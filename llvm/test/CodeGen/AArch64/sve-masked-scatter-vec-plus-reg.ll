; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64--linux-gnu -mattr=+sve < %s | FileCheck %s

define void @masked_scatter_nxv2i8(<vscale x 2 x i8> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1b { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  call void @llvm.masked.scatter.nxv2i8(<vscale x 2 x i8> %data, <vscale x 2 x ptr> %ptrs, i32 1, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2i16(<vscale x 2 x i16> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1h { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2i16(<vscale x 2 x i16> %data, <vscale x 2 x ptr> %ptrs, i32 2, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2i32(<vscale x 2 x i32> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1w { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2i32(<vscale x 2 x i32> %data, <vscale x 2 x ptr> %ptrs, i32 4, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2i64(<vscale x 2 x i64> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1d { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2i64(<vscale x 2 x i64> %data, <vscale x 2 x ptr> %ptrs, i32 8, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2f16(<vscale x 2 x half> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1h { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2f16(<vscale x 2 x half> %data, <vscale x 2 x ptr> %ptrs, i32 2, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2bf16(<vscale x 2 x bfloat> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) #0 {
; CHECK-LABEL: masked_scatter_nxv2bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1h { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2bf16(<vscale x 2 x bfloat> %data, <vscale x 2 x ptr> %ptrs, i32 2, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2f32(<vscale x 2 x float> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1w { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2f32(<vscale x 2 x float> %data, <vscale x 2 x ptr> %ptrs, i32 4, <vscale x 2 x i1> %mask)
  ret void
}

define void @masked_scatter_nxv2f64(<vscale x 2 x double> %data, <vscale x 2 x ptr> %bases, i64 %offset, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_scatter_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    st1d { z0.d }, p0, [x0, z1.d]
; CHECK-NEXT:    ret
  %byte_ptrs = getelementptr i8, <vscale x 2 x ptr> %bases, i64 %offset
  %ptrs = bitcast <vscale x 2 x ptr> %byte_ptrs to <vscale x 2 x ptr>
  call void @llvm.masked.scatter.nxv2f64(<vscale x 2 x double> %data, <vscale x 2 x ptr> %ptrs, i32 8, <vscale x 2 x i1> %mask)
  ret void
}

declare void @llvm.masked.scatter.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x ptr>,  i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2f16(<vscale x 2 x half>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2bf16(<vscale x 2 x bfloat>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2f32(<vscale x 2 x float>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
declare void @llvm.masked.scatter.nxv2f64(<vscale x 2 x double>, <vscale x 2 x ptr>, i32, <vscale x 2 x i1>)
attributes #0 = { "target-features"="+sve,+bf16" }