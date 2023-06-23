; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+zfh,+experimental-zvfh,+v -target-abi=ilp32d -riscv-v-vector-bits-min=128 \
; RUN:   -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+d,+zfh,+experimental-zvfh,+v -target-abi=lp64d -riscv-v-vector-bits-min=128 \
; RUN:   -verify-machineinstrs < %s | FileCheck %s

declare <2 x half> @llvm.vp.floor.v2f16(<2 x half>, <2 x i1>, i32)

define <2 x half> @vp_floor_v2f16(<2 x half> %va, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI0_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI0_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <2 x half> @llvm.vp.floor.v2f16(<2 x half> %va, <2 x i1> %m, i32 %evl)
  ret <2 x half> %v
}

define <2 x half> @vp_floor_v2f16_unmasked(<2 x half> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v2f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI1_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI1_0)(a1)
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, ma
; CHECK-NEXT:    vmset.m v0
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <2 x i1> poison, i1 true, i32 0
  %m = shufflevector <2 x i1> %head, <2 x i1> poison, <2 x i32> zeroinitializer
  %v = call <2 x half> @llvm.vp.floor.v2f16(<2 x half> %va, <2 x i1> %m, i32 %evl)
  ret <2 x half> %v
}

declare <4 x half> @llvm.vp.floor.v4f16(<4 x half>, <4 x i1>, i32)

define <4 x half> @vp_floor_v4f16(<4 x half> %va, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI2_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI2_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <4 x half> @llvm.vp.floor.v4f16(<4 x half> %va, <4 x i1> %m, i32 %evl)
  ret <4 x half> %v
}

define <4 x half> @vp_floor_v4f16_unmasked(<4 x half> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v4f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI3_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI3_0)(a1)
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, ma
; CHECK-NEXT:    vmset.m v0
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <4 x i1> poison, i1 true, i32 0
  %m = shufflevector <4 x i1> %head, <4 x i1> poison, <4 x i32> zeroinitializer
  %v = call <4 x half> @llvm.vp.floor.v4f16(<4 x half> %va, <4 x i1> %m, i32 %evl)
  ret <4 x half> %v
}

declare <8 x half> @llvm.vp.floor.v8f16(<8 x half>, <8 x i1>, i32)

define <8 x half> @vp_floor_v8f16(<8 x half> %va, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI4_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI4_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <8 x half> @llvm.vp.floor.v8f16(<8 x half> %va, <8 x i1> %m, i32 %evl)
  ret <8 x half> %v
}

define <8 x half> @vp_floor_v8f16_unmasked(<8 x half> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v8f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI5_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI5_0)(a1)
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, ma
; CHECK-NEXT:    vmset.m v0
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <8 x i1> poison, i1 true, i32 0
  %m = shufflevector <8 x i1> %head, <8 x i1> poison, <8 x i32> zeroinitializer
  %v = call <8 x half> @llvm.vp.floor.v8f16(<8 x half> %va, <8 x i1> %m, i32 %evl)
  ret <8 x half> %v
}

declare <16 x half> @llvm.vp.floor.v16f16(<16 x half>, <16 x i1>, i32)

define <16 x half> @vp_floor_v16f16(<16 x half> %va, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v0
; CHECK-NEXT:    lui a1, %hi(.LCPI6_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI6_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, ma
; CHECK-NEXT:    vfabs.v v12, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmflt.vf v10, v12, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfcvt.x.f.v v12, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v12, v12, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v12, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <16 x half> @llvm.vp.floor.v16f16(<16 x half> %va, <16 x i1> %m, i32 %evl)
  ret <16 x half> %v
}

define <16 x half> @vp_floor_v16f16_unmasked(<16 x half> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v16f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI7_0)
; CHECK-NEXT:    flh fa5, %lo(.LCPI7_0)(a1)
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    vmset.m v10
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfabs.v v12, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmflt.vf v10, v12, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfcvt.x.f.v v12, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v12, v12, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v12, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <16 x i1> poison, i1 true, i32 0
  %m = shufflevector <16 x i1> %head, <16 x i1> poison, <16 x i32> zeroinitializer
  %v = call <16 x half> @llvm.vp.floor.v16f16(<16 x half> %va, <16 x i1> %m, i32 %evl)
  ret <16 x half> %v
}

declare <2 x float> @llvm.vp.floor.v2f32(<2 x float>, <2 x i1>, i32)

define <2 x float> @vp_floor_v2f32(<2 x float> %va, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <2 x float> @llvm.vp.floor.v2f32(<2 x float> %va, <2 x i1> %m, i32 %evl)
  ret <2 x float> %v
}

define <2 x float> @vp_floor_v2f32_unmasked(<2 x float> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v2f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, ma
; CHECK-NEXT:    vmset.m v0
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <2 x i1> poison, i1 true, i32 0
  %m = shufflevector <2 x i1> %head, <2 x i1> poison, <2 x i32> zeroinitializer
  %v = call <2 x float> @llvm.vp.floor.v2f32(<2 x float> %va, <2 x i1> %m, i32 %evl)
  ret <2 x float> %v
}

declare <4 x float> @llvm.vp.floor.v4f32(<4 x float>, <4 x i1>, i32)

define <4 x float> @vp_floor_v4f32(<4 x float> %va, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <4 x float> @llvm.vp.floor.v4f32(<4 x float> %va, <4 x i1> %m, i32 %evl)
  ret <4 x float> %v
}

define <4 x float> @vp_floor_v4f32_unmasked(<4 x float> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v4f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, ma
; CHECK-NEXT:    vmset.m v0
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <4 x i1> poison, i1 true, i32 0
  %m = shufflevector <4 x i1> %head, <4 x i1> poison, <4 x i32> zeroinitializer
  %v = call <4 x float> @llvm.vp.floor.v4f32(<4 x float> %va, <4 x i1> %m, i32 %evl)
  ret <4 x float> %v
}

declare <8 x float> @llvm.vp.floor.v8f32(<8 x float>, <8 x i1>, i32)

define <8 x float> @vp_floor_v8f32(<8 x float> %va, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v0
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, ma
; CHECK-NEXT:    vfabs.v v12, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmflt.vf v10, v12, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfcvt.x.f.v v12, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v12, v12, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v12, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <8 x float> @llvm.vp.floor.v8f32(<8 x float> %va, <8 x i1> %m, i32 %evl)
  ret <8 x float> %v
}

define <8 x float> @vp_floor_v8f32_unmasked(<8 x float> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v8f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, ma
; CHECK-NEXT:    vmset.m v10
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfabs.v v12, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmflt.vf v10, v12, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfcvt.x.f.v v12, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v12, v12, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v12, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <8 x i1> poison, i1 true, i32 0
  %m = shufflevector <8 x i1> %head, <8 x i1> poison, <8 x i32> zeroinitializer
  %v = call <8 x float> @llvm.vp.floor.v8f32(<8 x float> %va, <8 x i1> %m, i32 %evl)
  ret <8 x float> %v
}

declare <16 x float> @llvm.vp.floor.v16f32(<16 x float>, <16 x i1>, i32)

define <16 x float> @vp_floor_v16f32(<16 x float> %va, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v12, v0
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, ma
; CHECK-NEXT:    vfabs.v v16, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmflt.vf v12, v16, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vfcvt.x.f.v v16, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v16, v16, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v16, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <16 x float> @llvm.vp.floor.v16f32(<16 x float> %va, <16 x i1> %m, i32 %evl)
  ret <16 x float> %v
}

define <16 x float> @vp_floor_v16f32_unmasked(<16 x float> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v16f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    vmset.m v12
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vfabs.v v16, v8, v0.t
; CHECK-NEXT:    lui a0, 307200
; CHECK-NEXT:    fmv.w.x fa5, a0
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmflt.vf v12, v16, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vfcvt.x.f.v v16, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v16, v16, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v16, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <16 x i1> poison, i1 true, i32 0
  %m = shufflevector <16 x i1> %head, <16 x i1> poison, <16 x i32> zeroinitializer
  %v = call <16 x float> @llvm.vp.floor.v16f32(<16 x float> %va, <16 x i1> %m, i32 %evl)
  ret <16 x float> %v
}

declare <2 x double> @llvm.vp.floor.v2f64(<2 x double>, <2 x i1>, i32)

define <2 x double> @vp_floor_v2f64(<2 x double> %va, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI16_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI16_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <2 x double> @llvm.vp.floor.v2f64(<2 x double> %va, <2 x i1> %m, i32 %evl)
  ret <2 x double> %v
}

define <2 x double> @vp_floor_v2f64_unmasked(<2 x double> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v2f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI17_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI17_0)(a1)
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, ma
; CHECK-NEXT:    vmset.m v0
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, ma
; CHECK-NEXT:    vfabs.v v9, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; CHECK-NEXT:    vmflt.vf v0, v9, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, ma
; CHECK-NEXT:    vfcvt.x.f.v v9, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v9, v9, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v9, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <2 x i1> poison, i1 true, i32 0
  %m = shufflevector <2 x i1> %head, <2 x i1> poison, <2 x i32> zeroinitializer
  %v = call <2 x double> @llvm.vp.floor.v2f64(<2 x double> %va, <2 x i1> %m, i32 %evl)
  ret <2 x double> %v
}

declare <4 x double> @llvm.vp.floor.v4f64(<4 x double>, <4 x i1>, i32)

define <4 x double> @vp_floor_v4f64(<4 x double> %va, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v0
; CHECK-NEXT:    lui a1, %hi(.LCPI18_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI18_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vfabs.v v12, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vmflt.vf v10, v12, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfcvt.x.f.v v12, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v12, v12, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v12, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <4 x double> @llvm.vp.floor.v4f64(<4 x double> %va, <4 x i1> %m, i32 %evl)
  ret <4 x double> %v
}

define <4 x double> @vp_floor_v4f64_unmasked(<4 x double> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v4f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI19_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI19_0)(a1)
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, ma
; CHECK-NEXT:    vmset.m v10
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfabs.v v12, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vmflt.vf v10, v12, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v10
; CHECK-NEXT:    vfcvt.x.f.v v12, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v12, v12, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v12, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <4 x i1> poison, i1 true, i32 0
  %m = shufflevector <4 x i1> %head, <4 x i1> poison, <4 x i32> zeroinitializer
  %v = call <4 x double> @llvm.vp.floor.v4f64(<4 x double> %va, <4 x i1> %m, i32 %evl)
  ret <4 x double> %v
}

declare <8 x double> @llvm.vp.floor.v8f64(<8 x double>, <8 x i1>, i32)

define <8 x double> @vp_floor_v8f64(<8 x double> %va, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v12, v0
; CHECK-NEXT:    lui a1, %hi(.LCPI20_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI20_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, ma
; CHECK-NEXT:    vfabs.v v16, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vmflt.vf v12, v16, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vfcvt.x.f.v v16, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v16, v16, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v16, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <8 x double> @llvm.vp.floor.v8f64(<8 x double> %va, <8 x i1> %m, i32 %evl)
  ret <8 x double> %v
}

define <8 x double> @vp_floor_v8f64_unmasked(<8 x double> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v8f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI21_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI21_0)(a1)
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, ma
; CHECK-NEXT:    vmset.m v12
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vfabs.v v16, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vmflt.vf v12, v16, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vfcvt.x.f.v v16, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v16, v16, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v16, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <8 x i1> poison, i1 true, i32 0
  %m = shufflevector <8 x i1> %head, <8 x i1> poison, <8 x i32> zeroinitializer
  %v = call <8 x double> @llvm.vp.floor.v8f64(<8 x double> %va, <8 x i1> %m, i32 %evl)
  ret <8 x double> %v
}

declare <15 x double> @llvm.vp.floor.v15f64(<15 x double>, <15 x i1>, i32)

define <15 x double> @vp_floor_v15f64(<15 x double> %va, <15 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v15f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v16, v0
; CHECK-NEXT:    lui a1, %hi(.LCPI22_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI22_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfabs.v v24, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmflt.vf v16, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v16
; CHECK-NEXT:    vfcvt.x.f.v v24, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v24, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <15 x double> @llvm.vp.floor.v15f64(<15 x double> %va, <15 x i1> %m, i32 %evl)
  ret <15 x double> %v
}

define <15 x double> @vp_floor_v15f64_unmasked(<15 x double> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v15f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI23_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI23_0)(a1)
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    vmset.m v16
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v16
; CHECK-NEXT:    vfabs.v v24, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmflt.vf v16, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v16
; CHECK-NEXT:    vfcvt.x.f.v v24, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v24, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <15 x i1> poison, i1 true, i32 0
  %m = shufflevector <15 x i1> %head, <15 x i1> poison, <15 x i32> zeroinitializer
  %v = call <15 x double> @llvm.vp.floor.v15f64(<15 x double> %va, <15 x i1> %m, i32 %evl)
  ret <15 x double> %v
}

declare <16 x double> @llvm.vp.floor.v16f64(<16 x double>, <16 x i1>, i32)

define <16 x double> @vp_floor_v16f64(<16 x double> %va, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v16, v0
; CHECK-NEXT:    lui a1, %hi(.LCPI24_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI24_0)(a1)
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfabs.v v24, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmflt.vf v16, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v16
; CHECK-NEXT:    vfcvt.x.f.v v24, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v24, v8, v0.t
; CHECK-NEXT:    ret
  %v = call <16 x double> @llvm.vp.floor.v16f64(<16 x double> %va, <16 x i1> %m, i32 %evl)
  ret <16 x double> %v
}

define <16 x double> @vp_floor_v16f64_unmasked(<16 x double> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v16f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI25_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI25_0)(a1)
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    vmset.m v16
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v16
; CHECK-NEXT:    vfabs.v v24, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmflt.vf v16, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v16
; CHECK-NEXT:    vfcvt.x.f.v v24, v8, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v24, v8, v0.t
; CHECK-NEXT:    ret
  %head = insertelement <16 x i1> poison, i1 true, i32 0
  %m = shufflevector <16 x i1> %head, <16 x i1> poison, <16 x i32> zeroinitializer
  %v = call <16 x double> @llvm.vp.floor.v16f64(<16 x double> %va, <16 x i1> %m, i32 %evl)
  ret <16 x double> %v
}

declare <32 x double> @llvm.vp.floor.v32f64(<32 x double>, <32 x i1>, i32)

define <32 x double> @vp_floor_v32f64(<32 x double> %va, <32 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v32f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 4
; CHECK-NEXT:    sub sp, sp, a1
; CHECK-NEXT:    .cfi_escape 0x0f, 0x0d, 0x72, 0x00, 0x11, 0x10, 0x22, 0x11, 0x10, 0x92, 0xa2, 0x38, 0x00, 0x1e, 0x22 # sp + 16 + 16 * vlenb
; CHECK-NEXT:    vmv1r.v v25, v0
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 3
; CHECK-NEXT:    add a1, sp, a1
; CHECK-NEXT:    addi a1, a1, 16
; CHECK-NEXT:    vs8r.v v16, (a1) # Unknown-size Folded Spill
; CHECK-NEXT:    vsetivli zero, 2, e8, mf4, ta, ma
; CHECK-NEXT:    li a2, 16
; CHECK-NEXT:    vslidedown.vi v1, v0, 2
; CHECK-NEXT:    mv a1, a0
; CHECK-NEXT:    bltu a0, a2, .LBB26_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    li a1, 16
; CHECK-NEXT:  .LBB26_2:
; CHECK-NEXT:    lui a2, %hi(.LCPI26_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI26_0)(a2)
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v25
; CHECK-NEXT:    vfabs.v v16, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmflt.vf v25, v16, fa5, v0.t
; CHECK-NEXT:    fsrmi a1, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v25
; CHECK-NEXT:    vfcvt.x.f.v v16, v8, v0.t
; CHECK-NEXT:    fsrm a1
; CHECK-NEXT:    vfcvt.f.x.v v16, v16, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v16, v8, v0.t
; CHECK-NEXT:    addi a1, a0, -16
; CHECK-NEXT:    sltu a0, a0, a1
; CHECK-NEXT:    addi a0, a0, -1
; CHECK-NEXT:    and a0, a0, a1
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8r.v v16, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vfabs.v v24, v16, v0.t
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v24, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    vl8r.v v24, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vmflt.vf v1, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    vfcvt.x.f.v v24, v16, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v16, v24, v16, v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %v = call <32 x double> @llvm.vp.floor.v32f64(<32 x double> %va, <32 x i1> %m, i32 %evl)
  ret <32 x double> %v
}

define <32 x double> @vp_floor_v32f64_unmasked(<32 x double> %va, i32 zeroext %evl) {
; CHECK-LABEL: vp_floor_v32f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    li a2, 16
; CHECK-NEXT:    vmset.m v1
; CHECK-NEXT:    mv a1, a0
; CHECK-NEXT:    bltu a0, a2, .LBB27_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    li a1, 16
; CHECK-NEXT:  .LBB27_2:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    sub sp, sp, a2
; CHECK-NEXT:    .cfi_escape 0x0f, 0x0d, 0x72, 0x00, 0x11, 0x10, 0x22, 0x11, 0x08, 0x92, 0xa2, 0x38, 0x00, 0x1e, 0x22 # sp + 16 + 8 * vlenb
; CHECK-NEXT:    lui a2, %hi(.LCPI27_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI27_0)(a2)
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    vfabs.v v24, v8, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmv1r.v v2, v1
; CHECK-NEXT:    vmflt.vf v2, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a1, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v2
; CHECK-NEXT:    vfcvt.x.f.v v24, v8, v0.t
; CHECK-NEXT:    fsrm a1
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vs8r.v v24, (a1) # Unknown-size Folded Spill
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vl8r.v v24, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vfsgnj.vv v8, v24, v8, v0.t
; CHECK-NEXT:    addi a1, a0, -16
; CHECK-NEXT:    sltu a0, a0, a1
; CHECK-NEXT:    addi a0, a0, -1
; CHECK-NEXT:    and a0, a0, a1
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    vfabs.v v24, v16, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmflt.vf v1, v24, fa5, v0.t
; CHECK-NEXT:    fsrmi a0, 2
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, ma
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    vfcvt.x.f.v v24, v16, v0.t
; CHECK-NEXT:    fsrm a0
; CHECK-NEXT:    vfcvt.f.x.v v24, v24, v0.t
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v16, v24, v16, v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %head = insertelement <32 x i1> poison, i1 true, i32 0
  %m = shufflevector <32 x i1> %head, <32 x i1> poison, <32 x i32> zeroinitializer
  %v = call <32 x double> @llvm.vp.floor.v32f64(<32 x double> %va, <32 x i1> %m, i32 %evl)
  ret <32 x double> %v
}