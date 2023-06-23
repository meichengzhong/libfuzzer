; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr +d -target-abi ilp32d < %s | FileCheck %s

define void @test_load_store(ptr %p, ptr %q) nounwind {
; CHECK-LABEL: test_load_store:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lh a0, 0(a0)
; CHECK-NEXT:    sh a0, 0(a1)
; CHECK-NEXT:    ret
  %a = load half, ptr %p
  store half %a, ptr %q
  ret void
}

define float @test_fpextend_float(ptr %p) nounwind {
; CHECK-LABEL: test_fpextend_float:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lhu a0, 0(a0)
; CHECK-NEXT:    tail __extendhfsf2@plt
  %a = load half, ptr %p
  %r = fpext half %a to float
  ret float %r
}

define double @test_fpextend_double(ptr %p) nounwind {
; CHECK-LABEL: test_fpextend_double:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; CHECK-NEXT:    lhu a0, 0(a0)
; CHECK-NEXT:    call __extendhfsf2@plt
; CHECK-NEXT:    fcvt.d.s fa0, fa0
; CHECK-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %a = load half, ptr %p
  %r = fpext half %a to double
  ret double %r
}

define void @test_fptrunc_float(float %f, ptr %p) nounwind {
; CHECK-LABEL: test_fptrunc_float:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; CHECK-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; CHECK-NEXT:    mv s0, a0
; CHECK-NEXT:    call __truncsfhf2@plt
; CHECK-NEXT:    sh a0, 0(s0)
; CHECK-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; CHECK-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %a = fptrunc float %f to half
  store half %a, ptr %p
  ret void
}

define void @test_fptrunc_double(double %d, ptr %p) nounwind {
; CHECK-LABEL: test_fptrunc_double:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; CHECK-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; CHECK-NEXT:    mv s0, a0
; CHECK-NEXT:    call __truncdfhf2@plt
; CHECK-NEXT:    sh a0, 0(s0)
; CHECK-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; CHECK-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %a = fptrunc double %d to half
  store half %a, ptr %p
  ret void
}

define void @test_fadd(ptr %p, ptr %q) nounwind {
; CHECK-LABEL: test_fadd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -32
; CHECK-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; CHECK-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; CHECK-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; CHECK-NEXT:    fsd fs0, 8(sp) # 8-byte Folded Spill
; CHECK-NEXT:    mv s0, a0
; CHECK-NEXT:    lhu s1, 0(a0)
; CHECK-NEXT:    lhu a0, 0(a1)
; CHECK-NEXT:    call __extendhfsf2@plt
; CHECK-NEXT:    fmv.s fs0, fa0
; CHECK-NEXT:    mv a0, s1
; CHECK-NEXT:    call __extendhfsf2@plt
; CHECK-NEXT:    fadd.s fa0, fa0, fs0
; CHECK-NEXT:    call __truncsfhf2@plt
; CHECK-NEXT:    sh a0, 0(s0)
; CHECK-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; CHECK-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; CHECK-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; CHECK-NEXT:    fld fs0, 8(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 32
; CHECK-NEXT:    ret
  %a = load half, ptr %p
  %b = load half, ptr %q
  %r = fadd half %a, %b
  store half %r, ptr %p
  ret void
}

define void @test_fmul(ptr %p, ptr %q) nounwind {
; CHECK-LABEL: test_fmul:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -32
; CHECK-NEXT:    sw ra, 28(sp) # 4-byte Folded Spill
; CHECK-NEXT:    sw s0, 24(sp) # 4-byte Folded Spill
; CHECK-NEXT:    sw s1, 20(sp) # 4-byte Folded Spill
; CHECK-NEXT:    fsd fs0, 8(sp) # 8-byte Folded Spill
; CHECK-NEXT:    mv s0, a0
; CHECK-NEXT:    lhu s1, 0(a0)
; CHECK-NEXT:    lhu a0, 0(a1)
; CHECK-NEXT:    call __extendhfsf2@plt
; CHECK-NEXT:    fmv.s fs0, fa0
; CHECK-NEXT:    mv a0, s1
; CHECK-NEXT:    call __extendhfsf2@plt
; CHECK-NEXT:    fmul.s fa0, fa0, fs0
; CHECK-NEXT:    call __truncsfhf2@plt
; CHECK-NEXT:    sh a0, 0(s0)
; CHECK-NEXT:    lw ra, 28(sp) # 4-byte Folded Reload
; CHECK-NEXT:    lw s0, 24(sp) # 4-byte Folded Reload
; CHECK-NEXT:    lw s1, 20(sp) # 4-byte Folded Reload
; CHECK-NEXT:    fld fs0, 8(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 32
; CHECK-NEXT:    ret
  %a = load half, ptr %p
  %b = load half, ptr %q
  %r = fmul half %a, %b
  store half %r, ptr %p
  ret void
}