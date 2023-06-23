; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O0 -mtriple=aarch64 -mattr=+sve2p1 < %s | FileCheck %s --check-prefixes=CHECK,CHECK-O0
; RUN: llc -O3 -mtriple=aarch64 -mattr=+sve2p1 < %s | FileCheck %s --check-prefixes=CHECK,CHECK-O3

;
; Test simple loads, stores and return.
;
define target("aarch64.svcount") @test_load(ptr %ptr) nounwind {
; CHECK-LABEL: test_load:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr p0, [x0]
; CHECK-NEXT:    ret
  %res = load target("aarch64.svcount"), ptr %ptr
  ret target("aarch64.svcount") %res
}

define void @test_store(ptr %ptr, target("aarch64.svcount") %val) nounwind {
; CHECK-LABEL: test_store:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str p0, [x0]
; CHECK-NEXT:    ret
  store target("aarch64.svcount") %val, ptr %ptr
  ret void
}

define target("aarch64.svcount") @test_alloca_store_reload(target("aarch64.svcount") %val) nounwind {
; CHECKO0-LABEL: test_alloca_store_reload:
; CHECKO0:       // %bb.0:
; CHECKO0-NEXT:    sub sp, sp, #16
; CHECKO0-NEXT:    add x8, sp, #14
; CHECKO0-NEXT:    str p0, [x8]
; CHECKO0-NEXT:    ldr p0, [x8]
; CHECKO0-NEXT:    add sp, sp, #16
; CHECKO0-NEXT:    ret
;
; CHECKO3-LABEL: test_alloca_store_reload:
; CHECKO3:       // %bb.0:
; CHECKO3-NEXT:    sub sp, sp, #16
; CHECKO3-NEXT:    add x8, sp, #14
; CHECKO3-NEXT:    str p0, [x8]
; CHECKO3-NEXT:    add sp, sp, #16
; CHECKO3-NEXT:    ret
; CHECK-O0-LABEL: test_alloca_store_reload:
; CHECK-O0:       // %bb.0:
; CHECK-O0-NEXT:    sub sp, sp, #16
; CHECK-O0-NEXT:    add x8, sp, #14
; CHECK-O0-NEXT:    str p0, [x8]
; CHECK-O0-NEXT:    ldr p0, [x8]
; CHECK-O0-NEXT:    add sp, sp, #16
; CHECK-O0-NEXT:    ret
;
; CHECK-O3-LABEL: test_alloca_store_reload:
; CHECK-O3:       // %bb.0:
; CHECK-O3-NEXT:    sub sp, sp, #16
; CHECK-O3-NEXT:    add x8, sp, #14
; CHECK-O3-NEXT:    str p0, [x8]
; CHECK-O3-NEXT:    add sp, sp, #16
; CHECK-O3-NEXT:    ret
  %ptr = alloca target("aarch64.svcount"), align 1
  store target("aarch64.svcount") %val, ptr %ptr
  %res = load target("aarch64.svcount"), ptr %ptr
  ret target("aarch64.svcount") %res
}

;
; Test passing as arguments (from perspective of callee)
;

define target("aarch64.svcount") @test_return_arg1(target("aarch64.svcount") %arg0, target("aarch64.svcount") %arg1) nounwind {
; CHECK-LABEL: test_return_arg1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov p0.b, p1.b
; CHECK-NEXT:    ret
  ret target("aarch64.svcount") %arg1
}

define target("aarch64.svcount") @test_return_arg4(target("aarch64.svcount") %arg0, target("aarch64.svcount") %arg1, target("aarch64.svcount") %arg2, target("aarch64.svcount") %arg3, target("aarch64.svcount") %arg4) nounwind {
; CHECK-LABEL: test_return_arg4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr p0, [x0]
; CHECK-NEXT:    ret
  ret target("aarch64.svcount") %arg4
}

;
; Test passing as arguments (from perspective of caller)
;

declare void @take_svcount_1(target("aarch64.svcount") %arg)
define void @test_pass_1arg(target("aarch64.svcount") %arg) nounwind {
; CHECK-LABEL: test_pass_1arg:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str x30, [sp, #-16]! // 8-byte Folded Spill
; CHECK-NEXT:    bl take_svcount_1
; CHECK-NEXT:    ldr x30, [sp], #16 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  call void @take_svcount_1(target("aarch64.svcount") %arg)
  ret void
}

declare void @take_svcount_5(target("aarch64.svcount") %arg0, target("aarch64.svcount") %arg1, target("aarch64.svcount") %arg2, target("aarch64.svcount") %arg3, target("aarch64.svcount") %arg4)
define void @test_pass_5args(target("aarch64.svcount") %arg) nounwind {
; CHECKO0-LABEL: test_pass_5args:
; CHECKO0:       // %bb.0:
; CHECKO0-NEXT:    stp x29, x30, [sp, #-16]! // 16-byte Folded Spill
; CHECKO0-NEXT:    addvl sp, sp, #-1
; CHECKO0-NEXT:    mov p3.b, p0.b
; CHECKO0-NEXT:    str p3, [sp, #7, mul vl]
; CHECKO0-NEXT:    addpl x0, sp, #7
; CHECKO0-NEXT:    mov p0.b, p3.b
; CHECKO0-NEXT:    mov p1.b, p3.b
; CHECKO0-NEXT:    mov p2.b, p3.b
; CHECKO0-NEXT:    bl take_svcount_5
; CHECKO0-NEXT:    addvl sp, sp, #1
; CHECKO0-NEXT:    ldp x29, x30, [sp], #16 // 16-byte Folded Reload
; CHECKO0-NEXT:    ret
;
; CHECKO3-LABEL: test_pass_5args:
; CHECKO3:       // %bb.0:
; CHECKO3-NEXT:    stp x29, x30, [sp, #-16]! // 16-byte Folded Spill
; CHECKO3-NEXT:    addvl sp, sp, #-1
; CHECKO3-NEXT:    addpl x0, sp, #7
; CHECKO3-NEXT:    mov p1.b, p0.b
; CHECKO3-NEXT:    mov p2.b, p0.b
; CHECKO3-NEXT:    mov p3.b, p0.b
; CHECKO3-NEXT:    str p0, [sp, #7, mul vl]
; CHECKO3-NEXT:    bl take_svcount_5
; CHECKO3-NEXT:    addvl sp, sp, #1
; CHECKO3-NEXT:    ldp x29, x30, [sp], #16 // 16-byte Folded Reload
; CHECKO3-NEXT:    ret
; CHECK-O0-LABEL: test_pass_5args:
; CHECK-O0:       // %bb.0:
; CHECK-O0-NEXT:    stp x29, x30, [sp, #-16]! // 16-byte Folded Spill
; CHECK-O0-NEXT:    addvl sp, sp, #-1
; CHECK-O0-NEXT:    mov p3.b, p0.b
; CHECK-O0-NEXT:    str p3, [sp, #7, mul vl]
; CHECK-O0-NEXT:    addpl x0, sp, #7
; CHECK-O0-NEXT:    mov p0.b, p3.b
; CHECK-O0-NEXT:    mov p1.b, p3.b
; CHECK-O0-NEXT:    mov p2.b, p3.b
; CHECK-O0-NEXT:    bl take_svcount_5
; CHECK-O0-NEXT:    addvl sp, sp, #1
; CHECK-O0-NEXT:    ldp x29, x30, [sp], #16 // 16-byte Folded Reload
; CHECK-O0-NEXT:    ret
;
; CHECK-O3-LABEL: test_pass_5args:
; CHECK-O3:       // %bb.0:
; CHECK-O3-NEXT:    stp x29, x30, [sp, #-16]! // 16-byte Folded Spill
; CHECK-O3-NEXT:    addvl sp, sp, #-1
; CHECK-O3-NEXT:    addpl x0, sp, #7
; CHECK-O3-NEXT:    mov p1.b, p0.b
; CHECK-O3-NEXT:    mov p2.b, p0.b
; CHECK-O3-NEXT:    mov p3.b, p0.b
; CHECK-O3-NEXT:    str p0, [sp, #7, mul vl]
; CHECK-O3-NEXT:    bl take_svcount_5
; CHECK-O3-NEXT:    addvl sp, sp, #1
; CHECK-O3-NEXT:    ldp x29, x30, [sp], #16 // 16-byte Folded Reload
; CHECK-O3-NEXT:    ret
  call void @take_svcount_5(target("aarch64.svcount") %arg, target("aarch64.svcount") %arg, target("aarch64.svcount") %arg, target("aarch64.svcount") %arg, target("aarch64.svcount") %arg)
  ret void
}

define target("aarch64.svcount") @test_sel(target("aarch64.svcount") %x, target("aarch64.svcount") %y, i1 %cmp) {
; CHECK-O0-LABEL: test_sel:
; CHECK-O0:       // %bb.0:
; CHECK-O0-NEXT:    mov p2.b, p1.b
; CHECK-O0-NEXT:    mov p1.b, p0.b
; CHECK-O0-NEXT:    // implicit-def: $x8
; CHECK-O0-NEXT:    mov w8, w0
; CHECK-O0-NEXT:    sbfx x9, x8, #0, #1
; CHECK-O0-NEXT:    mov x8, xzr
; CHECK-O0-NEXT:    whilelo p0.b, x8, x9
; CHECK-O0-NEXT:    sel p0.b, p0, p1.b, p2.b
; CHECK-O0-NEXT:    ret
;
; CHECK-O3-LABEL: test_sel:
; CHECK-O3:       // %bb.0:
; CHECK-O3-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-O3-NEXT:    sbfx x8, x0, #0, #1
; CHECK-O3-NEXT:    whilelo p2.b, xzr, x8
; CHECK-O3-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-O3-NEXT:    ret
  %x.y = select i1 %cmp, target("aarch64.svcount") %x, target("aarch64.svcount") %y
  ret target("aarch64.svcount") %x.y
}

define target("aarch64.svcount") @test_sel_cc(target("aarch64.svcount") %x, target("aarch64.svcount") %y, i32 %k) {
; CHECK-O0-LABEL: test_sel_cc:
; CHECK-O0:       // %bb.0:
; CHECK-O0-NEXT:    mov p2.b, p1.b
; CHECK-O0-NEXT:    mov p1.b, p0.b
; CHECK-O0-NEXT:    subs w8, w0, #42
; CHECK-O0-NEXT:    cset w9, gt
; CHECK-O0-NEXT:    // implicit-def: $x8
; CHECK-O0-NEXT:    mov w8, w9
; CHECK-O0-NEXT:    sbfx x9, x8, #0, #1
; CHECK-O0-NEXT:    mov x8, xzr
; CHECK-O0-NEXT:    whilelo p0.b, x8, x9
; CHECK-O0-NEXT:    sel p0.b, p0, p1.b, p2.b
; CHECK-O0-NEXT:    ret
;
; CHECK-O3-LABEL: test_sel_cc:
; CHECK-O3:       // %bb.0:
; CHECK-O3-NEXT:    cmp w0, #42
; CHECK-O3-NEXT:    cset w8, gt
; CHECK-O3-NEXT:    sbfx x8, x8, #0, #1
; CHECK-O3-NEXT:    whilelo p2.b, xzr, x8
; CHECK-O3-NEXT:    sel p0.b, p2, p0.b, p1.b
; CHECK-O3-NEXT:    ret
  %cmp = icmp sgt i32 %k, 42
  %x.y = select i1 %cmp, target("aarch64.svcount") %x, target("aarch64.svcount") %y
  ret target("aarch64.svcount") %x.y
}