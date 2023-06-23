// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 %s -emit-llvm -ffp-exception-behavior=maytrap -o - -triple x86_64-unknown-unknown | FileCheck %s

// Test that the constrained intrinsics are picking up the exception
// metadata from the AST instead of the global default from the command line.
// FIXME: these functions shouldn't trap on SNaN.

#pragma float_control(except, on)

int printf(const char *, ...);

// CHECK-LABEL: @p(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[STR_ADDR:%.*]] = alloca ptr, align 8
// CHECK-NEXT:    [[X_ADDR:%.*]] = alloca i32, align 4
// CHECK-NEXT:    store ptr [[STR:%.*]], ptr [[STR_ADDR]], align 8
// CHECK-NEXT:    store i32 [[X:%.*]], ptr [[X_ADDR]], align 4
// CHECK-NEXT:    [[TMP0:%.*]] = load ptr, ptr [[STR_ADDR]], align 8
// CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr [[X_ADDR]], align 4
// CHECK-NEXT:    [[CALL:%.*]] = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef [[TMP0]], i32 noundef [[TMP1]]) [[ATTR4:#.*]]
// CHECK-NEXT:    ret void
//
void p(char *str, int x) {
  printf("%s: %d\n", str, x);
}

#define P(n,args) p(#n #args, __builtin_##n args)

// CHECK-LABEL: @test_fpclassify(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[D_ADDR:%.*]] = alloca double, align 8
// CHECK-NEXT:    store double [[D:%.*]], ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[TMP0:%.*]] = load double, ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[ISZERO:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP0]], double 0.000000e+00, metadata !"oeq", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    br i1 [[ISZERO]], label [[FPCLASSIFY_END:%.*]], label [[FPCLASSIFY_NOT_ZERO:%.*]]
// CHECK:       fpclassify_end:
// CHECK-NEXT:    [[FPCLASSIFY_RESULT:%.*]] = phi i32 [ 4, [[ENTRY:%.*]] ], [ 0, [[FPCLASSIFY_NOT_ZERO]] ], [ 1, [[FPCLASSIFY_NOT_NAN:%.*]] ], [ [[TMP2:%.*]], [[FPCLASSIFY_NOT_INF:%.*]] ]
// CHECK-NEXT:    call void @p(ptr noundef @.str.1, i32 noundef [[FPCLASSIFY_RESULT]]) [[ATTR4]]
// CHECK-NEXT:    ret void
// CHECK:       fpclassify_not_zero:
// CHECK-NEXT:    [[CMP:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP0]], double [[TMP0]], metadata !"uno", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    br i1 [[CMP]], label [[FPCLASSIFY_END]], label [[FPCLASSIFY_NOT_NAN]]
// CHECK:       fpclassify_not_nan:
// CHECK-NEXT:    [[TMP1:%.*]] = call double @llvm.fabs.f64(double [[TMP0]]) [[ATTR5:#.*]]
// CHECK-NEXT:    [[ISINF:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP1]], double 0x7FF0000000000000, metadata !"oeq", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    br i1 [[ISINF]], label [[FPCLASSIFY_END]], label [[FPCLASSIFY_NOT_INF]]
// CHECK:       fpclassify_not_inf:
// CHECK-NEXT:    [[ISNORMAL:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP1]], double 0x10000000000000, metadata !"uge", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    [[TMP2]] = select i1 [[ISNORMAL]], i32 2, i32 3
// CHECK-NEXT:    br label [[FPCLASSIFY_END]]
//
void test_fpclassify(double d) {
  P(fpclassify, (0, 1, 2, 3, 4, d));

  return;
}

// CHECK-LABEL: @test_fp16_isinf(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[LD_ADDR:%.*]] = alloca half, align 2
// CHECK-NEXT:    store half [[H:%.*]], ptr [[LD_ADDR]], align 2
// CHECK-NEXT:    [[TMP0:%.*]] = load half, ptr [[LD_ADDR]], align 2
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast half [[TMP0]] to i16
// CHECK-NEXT:    [[SHL1:%.*]] = shl i16 [[BITCAST]], 1
// CHECK-NEXT:    [[CMP:%.*]] = icmp eq i16 [[SHL1]], -2048
// CHECK-NEXT:    [[RES:%.*]] = zext i1 [[CMP]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:2]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_fp16_isinf(_Float16 h) {
  P(isinf, (h));

  return;
}

// CHECK-LABEL: @test_float_isinf(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[LD_ADDR:%.*]] = alloca float, align 4
// CHECK-NEXT:    store float [[F:%.*]], ptr [[LD_ADDR]], align 4
// CHECK-NEXT:    [[TMP0:%.*]] = load float, ptr [[LD_ADDR]], align 4
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast float [[TMP0]] to i32
// CHECK-NEXT:    [[SHL1:%.*]] = shl i32 [[BITCAST]], 1
// CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[SHL1]], -16777216
// CHECK-NEXT:    [[RES:%.*]] = zext i1 [[CMP]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_float_isinf(float f) {
  P(isinf, (f));

  return;
}

// CHECK-LABEL: @test_double_isinf(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[LD_ADDR:%.*]] = alloca double, align 8
// CHECK-NEXT:    store double [[D:%.*]], ptr [[LD_ADDR]], align 8
// CHECK-NEXT:    [[TMP0:%.*]] = load double, ptr [[LD_ADDR]], align 8
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast double [[TMP0]] to i64
// CHECK-NEXT:    [[SHL1:%.*]] = shl i64 [[BITCAST]], 1
// CHECK-NEXT:    [[CMP:%.*]] = icmp eq i64 [[SHL1]], -9007199254740992
// CHECK-NEXT:    [[RES:%.*]] = zext i1 [[CMP]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_double_isinf(double d) {
  P(isinf, (d));

  return;
}

// CHECK-LABEL: @test_fp16_isfinite(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[LD_ADDR:%.*]] = alloca half, align 2
// CHECK-NEXT:    store half [[H:%.*]], ptr [[LD_ADDR]], align 2
// CHECK-NEXT:    [[TMP0:%.*]] = load half, ptr [[LD_ADDR]], align 2
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast half [[TMP0]] to i16
// CHECK-NEXT:    [[SHL1:%.*]] = shl i16 [[BITCAST]], 1
// CHECK-NEXT:    [[CMP:%.*]] = icmp ult i16 [[SHL1]], -2048
// CHECK-NEXT:    [[RES:%.*]] = zext i1 [[CMP]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_fp16_isfinite(_Float16 h) {
  P(isfinite, (h));

  return;
}

// CHECK-LABEL: @test_float_isfinite(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[LD_ADDR:%.*]] = alloca float, align 4
// CHECK-NEXT:    store float [[F:%.*]], ptr [[LD_ADDR]], align 4
// CHECK-NEXT:    [[TMP0:%.*]] = load float, ptr [[LD_ADDR]], align 4
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast float [[TMP0]] to i32
// CHECK-NEXT:    [[SHL1:%.*]] = shl i32 [[BITCAST]], 1
// CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[SHL1]], -16777216
// CHECK-NEXT:    [[RES:%.*]] = zext i1 [[CMP]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_float_isfinite(float f) {
  P(isfinite, (f));

  return;
}

// CHECK-LABEL: @test_double_isfinite(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[LD_ADDR:%.*]] = alloca double, align 8
// CHECK-NEXT:    store double [[D:%.*]], ptr [[LD_ADDR]], align 8
// CHECK-NEXT:    [[TMP0:%.*]] = load double, ptr [[LD_ADDR]], align 8
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast double [[TMP0]] to i64
// CHECK-NEXT:    [[SHL1:%.*]] = shl i64 [[BITCAST]], 1
// CHECK-NEXT:    [[CMP:%.*]] = icmp ult i64 [[SHL1]], -9007199254740992
// CHECK-NEXT:    [[RES:%.*]] = zext i1 [[CMP]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_double_isfinite(double d) {
  P(isfinite, (d));

  return;
}

// CHECK-LABEL: @test_isinf_sign(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[D_ADDR:%.*]] = alloca double, align 8
// CHECK-NEXT:    store double [[D:%.*]], ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[TMP0:%.*]] = load double, ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[TMP1:%.*]] = call double @llvm.fabs.f64(double [[TMP0]]) [[ATTR5]]
// CHECK-NEXT:    [[ISINF:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP1]], double 0x7FF0000000000000, metadata !"oeq", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    [[TMP2:%.*]] = bitcast double [[TMP0]] to i64
// CHECK-NEXT:    [[TMP3:%.*]] = icmp slt i64 [[TMP2]], 0
// CHECK-NEXT:    [[TMP4:%.*]] = select i1 [[TMP3]], i32 -1, i32 1
// CHECK-NEXT:    [[TMP5:%.*]] = select i1 [[ISINF]], i32 [[TMP4]], i32 0
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[TMP5]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_isinf_sign(double d) {
  P(isinf_sign, (d));

  return;
}

// CHECK-LABEL: @test_fp16_isnan(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[H_ADDR:%.*]] = alloca half, align 2
// CHECK-NEXT:    store half [[H:%.*]], ptr [[H_ADDR]], align 2
// CHECK-NEXT:    [[TMP0:%.*]] = load half, ptr [[H_ADDR]], align 2
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast half [[TMP0]] to i16
// CHECK-NEXT:    [[ABS:%.*]] = and i16 [[BITCAST]], [[#%u,0x7FFF]]
// CHECK-NEXT:    [[TMP1:%.*]] = sub i16 [[#%u,0x7C00]], [[ABS]]
// CHECK-NEXT:    [[ISNAN:%.*]] = lshr i16 [[TMP1]], 15
// CHECK-NEXT:    [[RES:%.*]] = zext i16 [[ISNAN]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_fp16_isnan(_Float16 h) {
  P(isnan, (h));

  return;
}

// CHECK-LABEL: @test_float_isnan(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[F_ADDR:%.*]] = alloca float, align 4
// CHECK-NEXT:    store float [[F:%.*]], ptr [[F_ADDR]], align 4
// CHECK-NEXT:    [[TMP0:%.*]] = load float, ptr [[F_ADDR]], align 4
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast float [[TMP0]] to i32
// CHECK-NEXT:    [[ABS:%.*]] = and i32 [[BITCAST]], [[#%u,0x7FFFFFFF]]
// CHECK-NEXT:    [[TMP1:%.*]] = sub i32 [[#%u,0x7F800000]], [[ABS]]
// CHECK-NEXT:    [[ISNAN:%.*]] = lshr i32 [[TMP1]], 31
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[ISNAN]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_float_isnan(float f) {
  P(isnan, (f));

  return;
}

// CHECK-LABEL: @test_double_isnan(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[D_ADDR:%.*]] = alloca double, align 8
// CHECK-NEXT:    store double [[D:%.*]], ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[TMP0:%.*]] = load double, ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[BITCAST:%.*]] = bitcast double [[TMP0]] to i64
// CHECK-NEXT:    [[ABS:%.*]] = and i64 [[BITCAST]], [[#%u,0x7FFFFFFFFFFFFFFF]]
// CHECK-NEXT:    [[TMP1:%.*]] = sub i64 [[#%u,0x7FF0000000000000]], [[ABS]]
// CHECK-NEXT:    [[ISNAN:%.*]] = lshr i64 [[TMP1]], 63
// CHECK-NEXT:    [[RES:%.*]] = trunc i64 [[ISNAN]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[RES]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_double_isnan(double d) {
  P(isnan, (d));

  return;
}

// CHECK-LABEL: @test_isnormal(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[D_ADDR:%.*]] = alloca double, align 8
// CHECK-NEXT:    store double [[D:%.*]], ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[TMP0:%.*]] = load double, ptr [[D_ADDR]], align 8
// CHECK-NEXT:    [[ISEQ:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP0]], double [[TMP0]], metadata !"oeq", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    [[TMP1:%.*]] = call double @llvm.fabs.f64(double [[TMP0]]) [[ATTR5]]
// CHECK-NEXT:    [[ISINF:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP1]], double 0x7FF0000000000000, metadata !"ult", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    [[ISNORMAL:%.*]] = call i1 @llvm.experimental.constrained.fcmp.f64(double [[TMP1]], double 0x10000000000000, metadata !"uge", metadata !"fpexcept.strict") [[ATTR4]]
// CHECK-NEXT:    [[AND:%.*]] = and i1 [[ISEQ]], [[ISINF]]
// CHECK-NEXT:    [[AND1:%.*]] = and i1 [[AND]], [[ISNORMAL]]
// CHECK-NEXT:    [[TMP2:%.*]] = zext i1 [[AND1]] to i32
// CHECK-NEXT:    call void @p(ptr noundef @.str.[[#STRID:STRID+1]], i32 noundef [[TMP2]]) [[ATTR4]]
// CHECK-NEXT:    ret void
//
void test_isnormal(double d) {
  P(isnormal, (d));

  return;
}