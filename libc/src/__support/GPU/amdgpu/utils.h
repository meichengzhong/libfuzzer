//===-------------- AMDGPU implementation of GPU utils ----------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIBC_SRC_SUPPORT_GPU_AMDGPU_IO_H
#define LLVM_LIBC_SRC_SUPPORT_GPU_AMDGPU_IO_H

#include "src/__support/common.h"

#include <stdint.h>

namespace __llvm_libc {
namespace gpu {

/// The number of threads that execute in lock-step in a lane.
constexpr const uint64_t LANE_SIZE = __AMDGCN_WAVEFRONT_SIZE;

/// Returns the number of workgroups in the 'x' dimension of the grid.
LIBC_INLINE uint32_t get_num_blocks_x() {
  return __builtin_amdgcn_grid_size_x() / __builtin_amdgcn_workgroup_size_x();
}

/// Returns the number of workgroups in the 'y' dimension of the grid.
LIBC_INLINE uint32_t get_num_blocks_y() {
  return __builtin_amdgcn_grid_size_y() / __builtin_amdgcn_workgroup_size_y();
}

/// Returns the number of workgroups in the 'z' dimension of the grid.
LIBC_INLINE uint32_t get_num_blocks_z() {
  return __builtin_amdgcn_grid_size_z() / __builtin_amdgcn_workgroup_size_z();
}

/// Returns the 'x' dimension of the current AMD workgroup's id.
LIBC_INLINE uint32_t get_block_id_x() {
  return __builtin_amdgcn_workgroup_id_x();
}

/// Returns the 'y' dimension of the current AMD workgroup's id.
LIBC_INLINE uint32_t get_block_id_y() {
  return __builtin_amdgcn_workgroup_id_y();
}

/// Returns the 'z' dimension of the current AMD workgroup's id.
LIBC_INLINE uint32_t get_block_id_z() {
  return __builtin_amdgcn_workgroup_id_z();
}

/// Returns the absolute id of the AMD workgroup.
LIBC_INLINE uint64_t get_block_id() {
  return get_block_id_x() + get_num_blocks_x() * get_block_id_y() +
         get_num_blocks_x() * get_num_blocks_y() * get_block_id_z();
}

/// Returns the number of workitems in the 'x' dimension.
LIBC_INLINE uint32_t get_num_threads_x() {
  return __builtin_amdgcn_workgroup_size_x();
}

/// Returns the number of workitems in the 'y' dimension.
LIBC_INLINE uint32_t get_num_threads_y() {
  return __builtin_amdgcn_workgroup_size_y();
}

/// Returns the number of workitems in the 'z' dimension.
LIBC_INLINE uint32_t get_num_threads_z() {
  return __builtin_amdgcn_workgroup_size_z();
}

/// Returns the 'x' dimension id of the workitem in the current AMD workgroup.
LIBC_INLINE uint32_t get_thread_id_x() {
  return __builtin_amdgcn_workitem_id_x();
}

/// Returns the 'y' dimension id of the workitem in the current AMD workgroup.
LIBC_INLINE uint32_t get_thread_id_y() {
  return __builtin_amdgcn_workitem_id_y();
}

/// Returns the 'z' dimension id of the workitem in the current AMD workgroup.
LIBC_INLINE uint32_t get_thread_id_z() {
  return __builtin_amdgcn_workitem_id_z();
}

/// Returns the absolute id of the thread in the current AMD workgroup.
LIBC_INLINE uint64_t get_thread_id() {
  return get_thread_id_x() + get_num_threads_x() * get_thread_id_y() +
         get_num_threads_x() * get_num_threads_y() * get_thread_id_z();
}

/// Returns the size of an AMD wavefront. Either 32 or 64 depending on hardware.
LIBC_INLINE uint32_t get_lane_size() { return LANE_SIZE; }

/// Returns the id of the thread inside of an AMD wavefront executing together.
[[clang::convergent]] LIBC_INLINE uint32_t get_lane_id() {
  if (LANE_SIZE == 64)
    return __builtin_amdgcn_mbcnt_hi(~0u, __builtin_amdgcn_mbcnt_lo(~0u, 0u));
  else
    return __builtin_amdgcn_mbcnt_lo(~0u, 0u);
}

/// Returns the bit-mask of active threads in the current wavefront.
[[clang::convergent]] LIBC_INLINE uint64_t get_lane_mask() {
  return __builtin_amdgcn_read_exec();
}

/// Copies the value from the first active thread in the wavefront to the rest.
[[clang::convergent]] LIBC_INLINE uint32_t broadcast_value(uint32_t x) {
  return __builtin_amdgcn_readfirstlane(x);
}

/// Waits for all the threads in the block to converge and issues a fence.
[[clang::convergent]] LIBC_INLINE void sync_threads() {
  __builtin_amdgcn_s_barrier();
  __builtin_amdgcn_fence(__ATOMIC_ACQUIRE, "workgroup");
}

/// Wait for all threads in the wavefront to converge, this is a noop on AMDGPU.
[[clang::convergent]] LIBC_INLINE void sync_lane(uint64_t) {}

} // namespace gpu
} // namespace __llvm_libc

#endif
