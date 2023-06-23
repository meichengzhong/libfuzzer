//===-- Single-precision 2^x function -------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/math/exp2f.h"
#include "src/__support/FPUtil/FEnvImpl.h"
#include "src/__support/FPUtil/FPBits.h"
#include "src/__support/FPUtil/PolyEval.h"
#include "src/__support/FPUtil/multiply_add.h"
#include "src/__support/FPUtil/nearest_integer.h"
#include "src/__support/common.h"
#include "src/__support/macros/optimization.h" // LIBC_UNLIKELY

#include <errno.h>

#include "explogxf.h"

namespace __llvm_libc {

constexpr uint32_t EXVAL1 = 0x3b42'9d37U;
constexpr uint32_t EXVAL2 = 0xbcf3'a937U;
constexpr uint32_t EXVAL_MASK = EXVAL1 & EXVAL2;

LLVM_LIBC_FUNCTION(float, exp2f, (float x)) {
  using FPBits = typename fputil::FPBits<float>;
  FPBits xbits(x);

  uint32_t x_u = xbits.uintval();
  uint32_t x_abs = x_u & 0x7fff'ffffU;

  // |x| < 2^-25
  if (LIBC_UNLIKELY(x_abs <= 0x3280'0000U)) {
    return 1.0f + x;
  }

  // // When |x| >= 128, or x is nan
  if (LIBC_UNLIKELY(x_abs >= 0x4300'0000U)) {

    // x >= 128
    if (!xbits.get_sign()) {
      // x is finite
      if (x_u < 0x7f80'0000U) {
        int rounding = fputil::get_round();
        if (rounding == FE_DOWNWARD || rounding == FE_TOWARDZERO)
          return static_cast<float>(FPBits(FPBits::MAX_NORMAL));

        fputil::set_errno_if_required(ERANGE);
        fputil::raise_except_if_required(FE_OVERFLOW);
      }
      // x is +inf or nan
      return x + FPBits::inf().get_val();
    }
    // x <= -150
    if (x_u >= 0xc316'0000U) {
      // exp(-Inf) = 0
      if (xbits.is_inf())
        return 0.0f;
      // exp(nan) = nan
      if (xbits.is_nan())
        return x;
      if (fputil::get_round() == FE_UPWARD)
        return FPBits(FPBits::MIN_SUBNORMAL).get_val();
      if (x != 0.0f) {
        fputil::set_errno_if_required(ERANGE);
        fputil::raise_except_if_required(FE_UNDERFLOW);
      }
      return 0.0f;
    }
  }

  // Check exceptional values.
  if (LIBC_UNLIKELY((x_u & EXVAL_MASK) == EXVAL_MASK)) {
    if (LIBC_UNLIKELY(x_u == EXVAL1)) { // x = 0x1.853a6ep-9f
      if (fputil::get_round() == FE_TONEAREST)
        return 0x1.00870ap+0f;
    } else if (LIBC_UNLIKELY(x_u == EXVAL2)) { // x = -0x1.e7526ep-6f
      if (fputil::get_round() == FE_TONEAREST)
        return 0x1.f58d62p-1f;
    }
  }

  // For -150 < x < 128, to compute 2^x, we perform the following range
  // reduction: find hi, mid, lo such that:
  //   x = hi + mid + lo, in which
  //     hi is an integer,
  //     0 <= mid * 2^5 < 32 is an integer
  //     -2^(-6) <= lo <= 2^-6.
  // In particular,
  //   hi + mid = round(x * 2^5) * 2^(-5).
  // Then,
  //   2^x = 2^(hi + mid + lo) = 2^hi * 2^mid * 2^lo.
  // 2^mid is stored in the lookup table of 32 elements.
  // 2^lo is computed using a degree-5 minimax polynomial
  // generated by Sollya.
  // We perform 2^hi * 2^mid by simply add hi to the exponent field
  // of 2^mid.

  // kf = (hi + mid) * 2^5 = round(x * 2^5)
  float kf = fputil::nearest_integer(x * 32.0f);
  // dx = lo = x - (hi + mid) = x - kf * 2^(-5)
  double dx = fputil::multiply_add(-0x1.0p-5f, kf, x);

  int k = static_cast<int>(kf);
  // hi = floor(kf * 2^(-4))
  // exp_hi = shift hi to the exponent field of double precision.
  int64_t exp_hi = static_cast<int64_t>(k >> ExpBase::MID_BITS)
                   << fputil::FloatProperties<double>::MANTISSA_WIDTH;
  // mh = 2^hi * 2^mid
  // mh_bits = bit field of mh
  int64_t mh_bits = ExpBase::EXP_2_MID[k & ExpBase::MID_MASK] + exp_hi;
  double mh = fputil::FPBits<double>(uint64_t(mh_bits)).get_val();

  // Degree-5 polynomial approximating (2^x - 1)/x generating by Sollya with:
  // > P = fpminimax((2^x - 1)/x, 5, [|D...|], [-1/32. 1/32]);
  constexpr double COEFFS[5] = {0x1.62e42fefa39efp-1, 0x1.ebfbdff8131c4p-3,
                                0x1.c6b08d7061695p-5, 0x1.3b2b1bee74b2ap-7,
                                0x1.5d88091198529p-10};
  double dx_sq = dx * dx;
  double c1 = fputil::multiply_add(dx, COEFFS[0], 1.0);
  double c2 = fputil::multiply_add(dx, COEFFS[2], COEFFS[1]);
  double c3 = fputil::multiply_add(dx, COEFFS[4], COEFFS[3]);
  double p = fputil::multiply_add(dx_sq, c3, c2);
  // 2^x = 2^(hi + mid + lo)
  //     = 2^(hi + mid) * 2^lo
  //     ~ mh * (1 + lo * P(lo))
  //     = mh + (mh*lo) * P(lo)
  return static_cast<float>(fputil::multiply_add(p, dx_sq * mh, c1 * mh));
}

} // namespace __llvm_libc