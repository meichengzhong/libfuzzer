; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc %s -verify-machineinstrs -mtriple aarch64-apple-darwin -global-isel -o - 2>&1 | FileCheck %s

; There are two things we want to test here:
;  (1) We can tail call musttail calls.
;  (2) We spill and reload all of the arguments around a normal call.

declare i32 @musttail_variadic_callee(i32, ...)
define i32 @test_musttail_variadic(i32 %arg0, ...) {
; CHECK-LABEL: test_musttail_variadic:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    b _musttail_variadic_callee
  %r = musttail call i32 (i32, ...) @musttail_variadic_callee(i32 %arg0, ...)
  ret i32 %r
}

declare [2 x i64] @musttail_variadic_aggret_callee(i32 %arg0, ...)
define [2 x i64] @test_musttail_variadic_aggret(i32 %arg0, ...) {
; CHECK-LABEL: test_musttail_variadic_aggret:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    b _musttail_variadic_aggret_callee
  %r = musttail call [2 x i64] (i32, ...) @musttail_variadic_aggret_callee(i32 %arg0, ...)
  ret [2 x i64] %r
}

; Test musttailing with a normal call in the block. Test that we spill and
; restore, as a normal call will clobber all argument registers.
@asdf = internal constant [4 x i8] c"asdf"
declare void @puts(ptr)
define i32 @test_musttail_variadic_spill(i32 %arg0, ...) {
; CHECK-LABEL: test_musttail_variadic_spill:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub sp, sp, #224
; CHECK-NEXT:    .cfi_def_cfa_offset 224
; CHECK-NEXT:    stp x28, x27, [sp, #128] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x26, x25, [sp, #144] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x24, x23, [sp, #160] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x22, x21, [sp, #176] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x20, x19, [sp, #192] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x29, x30, [sp, #208] ; 16-byte Folded Spill
; CHECK-NEXT:    .cfi_offset w30, -8
; CHECK-NEXT:    .cfi_offset w29, -16
; CHECK-NEXT:    .cfi_offset w19, -24
; CHECK-NEXT:    .cfi_offset w20, -32
; CHECK-NEXT:    .cfi_offset w21, -40
; CHECK-NEXT:    .cfi_offset w22, -48
; CHECK-NEXT:    .cfi_offset w23, -56
; CHECK-NEXT:    .cfi_offset w24, -64
; CHECK-NEXT:    .cfi_offset w25, -72
; CHECK-NEXT:    .cfi_offset w26, -80
; CHECK-NEXT:    .cfi_offset w27, -88
; CHECK-NEXT:    .cfi_offset w28, -96
; CHECK-NEXT:    mov w19, w0
; CHECK-NEXT:  Lloh0:
; CHECK-NEXT:    adrp x0, _asdf@PAGE
; CHECK-NEXT:  Lloh1:
; CHECK-NEXT:    add x0, x0, _asdf@PAGEOFF
; CHECK-NEXT:    mov x20, x1
; CHECK-NEXT:    mov x21, x2
; CHECK-NEXT:    mov x22, x3
; CHECK-NEXT:    mov x23, x4
; CHECK-NEXT:    mov x24, x5
; CHECK-NEXT:    mov x25, x6
; CHECK-NEXT:    mov x26, x7
; CHECK-NEXT:    stp q7, q6, [sp] ; 32-byte Folded Spill
; CHECK-NEXT:    mov x27, x8
; CHECK-NEXT:    stp q5, q4, [sp, #32] ; 32-byte Folded Spill
; CHECK-NEXT:    stp q3, q2, [sp, #64] ; 32-byte Folded Spill
; CHECK-NEXT:    stp q1, q0, [sp, #96] ; 32-byte Folded Spill
; CHECK-NEXT:    bl _puts
; CHECK-NEXT:    ldp q1, q0, [sp, #96] ; 32-byte Folded Reload
; CHECK-NEXT:    mov w0, w19
; CHECK-NEXT:    mov x1, x20
; CHECK-NEXT:    mov x2, x21
; CHECK-NEXT:    mov x3, x22
; CHECK-NEXT:    mov x4, x23
; CHECK-NEXT:    mov x5, x24
; CHECK-NEXT:    mov x6, x25
; CHECK-NEXT:    mov x7, x26
; CHECK-NEXT:    mov x8, x27
; CHECK-NEXT:    ldp q3, q2, [sp, #64] ; 32-byte Folded Reload
; CHECK-NEXT:    ldp q5, q4, [sp, #32] ; 32-byte Folded Reload
; CHECK-NEXT:    ldp q7, q6, [sp] ; 32-byte Folded Reload
; CHECK-NEXT:    ldp x29, x30, [sp, #208] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x20, x19, [sp, #192] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x22, x21, [sp, #176] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x24, x23, [sp, #160] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x26, x25, [sp, #144] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x28, x27, [sp, #128] ; 16-byte Folded Reload
; CHECK-NEXT:    add sp, sp, #224
; CHECK-NEXT:    b _musttail_variadic_callee
; CHECK-NEXT:    .loh AdrpAdd Lloh0, Lloh1
  call void @puts(ptr @asdf)
  %r = musttail call i32 (i32, ...) @musttail_variadic_callee(i32 %arg0, ...)
  ret i32 %r
}

; Test musttailing with a varargs call in the block. Test that we spill and
; reload all arguments in the variadic argument pack.
declare void @llvm.va_start(ptr) nounwind
declare ptr @get_f(ptr %this)
define void @f_thunk(ptr %this, ...) {
; CHECK-LABEL: f_thunk:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub sp, sp, #256
; CHECK-NEXT:    .cfi_def_cfa_offset 256
; CHECK-NEXT:    stp x28, x27, [sp, #160] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x26, x25, [sp, #176] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x24, x23, [sp, #192] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x22, x21, [sp, #208] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x20, x19, [sp, #224] ; 16-byte Folded Spill
; CHECK-NEXT:    stp x29, x30, [sp, #240] ; 16-byte Folded Spill
; CHECK-NEXT:    .cfi_offset w30, -8
; CHECK-NEXT:    .cfi_offset w29, -16
; CHECK-NEXT:    .cfi_offset w19, -24
; CHECK-NEXT:    .cfi_offset w20, -32
; CHECK-NEXT:    .cfi_offset w21, -40
; CHECK-NEXT:    .cfi_offset w22, -48
; CHECK-NEXT:    .cfi_offset w23, -56
; CHECK-NEXT:    .cfi_offset w24, -64
; CHECK-NEXT:    .cfi_offset w25, -72
; CHECK-NEXT:    .cfi_offset w26, -80
; CHECK-NEXT:    .cfi_offset w27, -88
; CHECK-NEXT:    .cfi_offset w28, -96
; CHECK-NEXT:    add x9, sp, #128
; CHECK-NEXT:    add x10, sp, #256
; CHECK-NEXT:    mov x19, x0
; CHECK-NEXT:    mov x20, x1
; CHECK-NEXT:    mov x21, x2
; CHECK-NEXT:    mov x22, x3
; CHECK-NEXT:    mov x23, x4
; CHECK-NEXT:    mov x24, x5
; CHECK-NEXT:    mov x25, x6
; CHECK-NEXT:    mov x26, x7
; CHECK-NEXT:    stp q7, q6, [sp] ; 32-byte Folded Spill
; CHECK-NEXT:    mov x27, x8
; CHECK-NEXT:    stp q5, q4, [sp, #32] ; 32-byte Folded Spill
; CHECK-NEXT:    stp q3, q2, [sp, #64] ; 32-byte Folded Spill
; CHECK-NEXT:    stp q1, q0, [sp, #96] ; 32-byte Folded Spill
; CHECK-NEXT:    str x10, [x9]
; CHECK-NEXT:    bl _get_f
; CHECK-NEXT:    ldp q1, q0, [sp, #96] ; 32-byte Folded Reload
; CHECK-NEXT:    mov x9, x0
; CHECK-NEXT:    mov x0, x19
; CHECK-NEXT:    mov x1, x20
; CHECK-NEXT:    mov x2, x21
; CHECK-NEXT:    mov x3, x22
; CHECK-NEXT:    mov x4, x23
; CHECK-NEXT:    mov x5, x24
; CHECK-NEXT:    mov x6, x25
; CHECK-NEXT:    mov x7, x26
; CHECK-NEXT:    mov x8, x27
; CHECK-NEXT:    ldp q3, q2, [sp, #64] ; 32-byte Folded Reload
; CHECK-NEXT:    ldp q5, q4, [sp, #32] ; 32-byte Folded Reload
; CHECK-NEXT:    ldp q7, q6, [sp] ; 32-byte Folded Reload
; CHECK-NEXT:    ldp x29, x30, [sp, #240] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x20, x19, [sp, #224] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x22, x21, [sp, #208] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x24, x23, [sp, #192] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x26, x25, [sp, #176] ; 16-byte Folded Reload
; CHECK-NEXT:    ldp x28, x27, [sp, #160] ; 16-byte Folded Reload
; CHECK-NEXT:    add sp, sp, #256
; CHECK-NEXT:    br x9
  %ap = alloca [4 x ptr], align 16
  call void @llvm.va_start(ptr %ap)
  %fptr = call ptr(ptr) @get_f(ptr %this)
  musttail call void (ptr, ...) %fptr(ptr %this, ...)
  ret void
}

; We don't need any spills and reloads here, but we should still emit the
; copies in call lowering.
define void @g_thunk(ptr %fptr_i8, ...) {
; CHECK-LABEL: g_thunk:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    br x0
  musttail call void (ptr, ...) %fptr_i8(ptr %fptr_i8, ...)
  ret void
}

; Test that this works with multiple exits and basic blocks.
%struct.Foo = type { i1, ptr, ptr }
@g = external global i32
define void @h_thunk(ptr %this, ...) {
; CHECK-LABEL: h_thunk:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    ldrb w9, [x0]
; CHECK-NEXT:    tbz w9, #0, LBB5_2
; CHECK-NEXT:  ; %bb.1: ; %then
; CHECK-NEXT:    ldr x9, [x0, #8]
; CHECK-NEXT:    br x9
; CHECK-NEXT:  LBB5_2: ; %else
; CHECK-NEXT:  Lloh2:
; CHECK-NEXT:    adrp x10, _g@GOTPAGE
; CHECK-NEXT:    ldr x9, [x0, #16]
; CHECK-NEXT:    mov w11, #42
; CHECK-NEXT:  Lloh3:
; CHECK-NEXT:    ldr x10, [x10, _g@GOTPAGEOFF]
; CHECK-NEXT:  Lloh4:
; CHECK-NEXT:    str w11, [x10]
; CHECK-NEXT:    br x9
; CHECK-NEXT:    .loh AdrpLdrGotStr Lloh2, Lloh3, Lloh4
  %cond = load i1, ptr %this
  br i1 %cond, label %then, label %else

then:
  %a_p = getelementptr %struct.Foo, ptr %this, i32 0, i32 1
  %a_i8 = load ptr, ptr %a_p
  musttail call void (ptr, ...) %a_i8(ptr %this, ...)
  ret void

else:
  %b_p = getelementptr %struct.Foo, ptr %this, i32 0, i32 2
  %b_i8 = load ptr, ptr %b_p
  store i32 42, ptr @g
  musttail call void (ptr, ...) %b_i8(ptr %this, ...)
  ret void
}