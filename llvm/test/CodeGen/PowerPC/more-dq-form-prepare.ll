; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mcpu=pwr10 < %s | FileCheck %s

target datalayout = "e-m:e-i64:64-p:64:64-n32:64-v256:256:256-v512:512:512"
target triple = "powerpc64le-unknown-linux-gnu"

%_elem_type_of_a = type <{ double }>
%_elem_type_of_x = type <{ double }>

define void @foo(ptr %.m, ptr %.n, ptr %.a, ptr %.x, ptr %.l, ptr %.vy01, ptr %.vy02, ptr %.vy03, ptr %.vy04, ptr %.vy05, ptr %.vy06, ptr %.vy07, ptr %.vy08, ptr %.vy09, ptr %.vy0a, ptr %.vy0b, ptr %.vy0c, ptr %.vy21, ptr %.vy22, ptr %.vy23, ptr %.vy24, ptr %.vy25, ptr %.vy26, ptr %.vy27, ptr %.vy28, ptr %.vy29, ptr %.vy2a, ptr %.vy2b, ptr %.vy2c) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    stdu 1, -592(1)
; CHECK-NEXT:    .cfi_def_cfa_offset 592
; CHECK-NEXT:    .cfi_offset r14, -192
; CHECK-NEXT:    .cfi_offset r15, -184
; CHECK-NEXT:    .cfi_offset r16, -176
; CHECK-NEXT:    .cfi_offset r17, -168
; CHECK-NEXT:    .cfi_offset r18, -160
; CHECK-NEXT:    .cfi_offset r19, -152
; CHECK-NEXT:    .cfi_offset r20, -144
; CHECK-NEXT:    .cfi_offset r21, -136
; CHECK-NEXT:    .cfi_offset r22, -128
; CHECK-NEXT:    .cfi_offset r23, -120
; CHECK-NEXT:    .cfi_offset r24, -112
; CHECK-NEXT:    .cfi_offset r25, -104
; CHECK-NEXT:    .cfi_offset r26, -96
; CHECK-NEXT:    .cfi_offset r27, -88
; CHECK-NEXT:    .cfi_offset r28, -80
; CHECK-NEXT:    .cfi_offset r29, -72
; CHECK-NEXT:    .cfi_offset r30, -64
; CHECK-NEXT:    .cfi_offset r31, -56
; CHECK-NEXT:    .cfi_offset f26, -48
; CHECK-NEXT:    .cfi_offset f27, -40
; CHECK-NEXT:    .cfi_offset f28, -32
; CHECK-NEXT:    .cfi_offset f29, -24
; CHECK-NEXT:    .cfi_offset f30, -16
; CHECK-NEXT:    .cfi_offset f31, -8
; CHECK-NEXT:    .cfi_offset v20, -384
; CHECK-NEXT:    .cfi_offset v21, -368
; CHECK-NEXT:    .cfi_offset v22, -352
; CHECK-NEXT:    .cfi_offset v23, -336
; CHECK-NEXT:    .cfi_offset v24, -320
; CHECK-NEXT:    .cfi_offset v25, -304
; CHECK-NEXT:    .cfi_offset v26, -288
; CHECK-NEXT:    .cfi_offset v27, -272
; CHECK-NEXT:    .cfi_offset v28, -256
; CHECK-NEXT:    .cfi_offset v29, -240
; CHECK-NEXT:    .cfi_offset v30, -224
; CHECK-NEXT:    .cfi_offset v31, -208
; CHECK-NEXT:    lwz 4, 0(4)
; CHECK-NEXT:    std 14, 400(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 15, 408(1) # 8-byte Folded Spill
; CHECK-NEXT:    cmpwi 4, 1
; CHECK-NEXT:    std 16, 416(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 17, 424(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 18, 432(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 19, 440(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 20, 448(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 21, 456(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 22, 464(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 23, 472(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 24, 480(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 25, 488(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 26, 496(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 27, 504(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 28, 512(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 29, 520(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 30, 528(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 31, 536(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 26, 544(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 27, 552(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 28, 560(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 29, 568(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 30, 576(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 31, 584(1) # 8-byte Folded Spill
; CHECK-NEXT:    stxv 52, 208(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 53, 224(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 54, 240(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 55, 256(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 56, 272(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 57, 288(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 58, 304(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 59, 320(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 60, 336(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 61, 352(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 62, 368(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 63, 384(1) # 16-byte Folded Spill
; CHECK-NEXT:    blt 0, .LBB0_7
; CHECK-NEXT:  # %bb.1: # %_loop_1_do_.lr.ph
; CHECK-NEXT:    lwz 3, 0(3)
; CHECK-NEXT:    cmpwi 3, 1
; CHECK-NEXT:    blt 0, .LBB0_7
; CHECK-NEXT:  # %bb.2: # %_loop_1_do_.preheader
; CHECK-NEXT:    mr 22, 5
; CHECK-NEXT:    ld 5, 848(1)
; CHECK-NEXT:    ld 28, 824(1)
; CHECK-NEXT:    mr 11, 7
; CHECK-NEXT:    mr 18, 6
; CHECK-NEXT:    addi 3, 3, 1
; CHECK-NEXT:    std 8, 48(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 9, 56(1) # 8-byte Folded Spill
; CHECK-NEXT:    ld 6, 712(1)
; CHECK-NEXT:    ld 23, 688(1)
; CHECK-NEXT:    std 10, 64(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 6, 72(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 5, 200(1) # 8-byte Folded Spill
; CHECK-NEXT:    ld 5, 840(1)
; CHECK-NEXT:    cmpldi 3, 9
; CHECK-NEXT:    ld 19, 768(1)
; CHECK-NEXT:    ld 2, 760(1)
; CHECK-NEXT:    lxv 33, 0(6)
; CHECK-NEXT:    ld 21, 784(1)
; CHECK-NEXT:    ld 20, 776(1)
; CHECK-NEXT:    std 2, 112(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 19, 120(1) # 8-byte Folded Spill
; CHECK-NEXT:    lxv 10, 0(19)
; CHECK-NEXT:    ld 7, 728(1)
; CHECK-NEXT:    std 20, 128(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 21, 136(1) # 8-byte Folded Spill
; CHECK-NEXT:    lxv 7, 0(21)
; CHECK-NEXT:    ld 27, 816(1)
; CHECK-NEXT:    std 27, 168(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 5, 192(1) # 8-byte Folded Spill
; CHECK-NEXT:    ld 5, 832(1)
; CHECK-NEXT:    ld 26, 808(1)
; CHECK-NEXT:    ld 25, 800(1)
; CHECK-NEXT:    ld 24, 792(1)
; CHECK-NEXT:    ld 17, 752(1)
; CHECK-NEXT:    ld 16, 744(1)
; CHECK-NEXT:    ld 15, 736(1)
; CHECK-NEXT:    ld 29, 704(1)
; CHECK-NEXT:    ld 30, 720(1)
; CHECK-NEXT:    lxv 42, 0(9)
; CHECK-NEXT:    std 7, 80(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 15, 88(1) # 8-byte Folded Spill
; CHECK-NEXT:    lxv 37, 0(7)
; CHECK-NEXT:    lxv 43, 0(8)
; CHECK-NEXT:    mr 8, 29
; CHECK-NEXT:    std 26, 160(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 16, 96(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 17, 104(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 24, 144(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 25, 152(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 5, 184(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 28, 176(1) # 8-byte Folded Spill
; CHECK-NEXT:    ld 5, 696(1)
; CHECK-NEXT:    lxv 41, 0(10)
; CHECK-NEXT:    lxv 40, 0(23)
; CHECK-NEXT:    lxv 38, 0(29)
; CHECK-NEXT:    lxv 32, 0(30)
; CHECK-NEXT:    lxv 36, 0(15)
; CHECK-NEXT:    lxv 13, 0(16)
; CHECK-NEXT:    lxv 12, 0(17)
; CHECK-NEXT:    lxv 11, 0(2)
; CHECK-NEXT:    lxv 9, 0(20)
; CHECK-NEXT:    lxv 5, 0(24)
; CHECK-NEXT:    lxv 4, 0(25)
; CHECK-NEXT:    mr 10, 30
; CHECK-NEXT:    std 5, 32(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 23, 40(1) # 8-byte Folded Spill
; CHECK-NEXT:    lwa 5, 0(11)
; CHECK-NEXT:    li 11, 9
; CHECK-NEXT:    ld 7, 184(1) # 8-byte Folded Reload
; CHECK-NEXT:    lxv 2, 0(26)
; CHECK-NEXT:    lxv 0, 0(27)
; CHECK-NEXT:    lxv 1, 0(28)
; CHECK-NEXT:    li 28, 1
; CHECK-NEXT:    li 27, 0
; CHECK-NEXT:    ld 9, 32(1) # 8-byte Folded Reload
; CHECK-NEXT:    lxv 3, 0(7)
; CHECK-NEXT:    iselgt 3, 3, 11
; CHECK-NEXT:    addi 3, 3, -2
; CHECK-NEXT:    mulli 6, 5, 40
; CHECK-NEXT:    sldi 0, 5, 4
; CHECK-NEXT:    extswsli 14, 5, 3
; CHECK-NEXT:    rldicl 12, 3, 61, 3
; CHECK-NEXT:    lxv 39, 0(9)
; CHECK-NEXT:    add 31, 14, 22
; CHECK-NEXT:    add 11, 0, 22
; CHECK-NEXT:    mr 26, 22
; CHECK-NEXT:    addi 3, 11, 32
; CHECK-NEXT:    addi 11, 12, 1
; CHECK-NEXT:    mulli 12, 5, 48
; CHECK-NEXT:    addi 31, 31, 32
; CHECK-NEXT:    add 19, 22, 6
; CHECK-NEXT:    sldi 6, 5, 5
; CHECK-NEXT:    mulli 5, 5, 24
; CHECK-NEXT:    add 20, 22, 6
; CHECK-NEXT:    add 21, 22, 5
; CHECK-NEXT:    ld 5, 192(1) # 8-byte Folded Reload
; CHECK-NEXT:    lxv 8, 0(5)
; CHECK-NEXT:    ld 5, 200(1) # 8-byte Folded Reload
; CHECK-NEXT:    lxv 6, 0(5)
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB0_3: # %_loop_2_do_.lr.ph
; CHECK-NEXT:    # =>This Loop Header: Depth=1
; CHECK-NEXT:    # Child Loop BB0_4 Depth 2
; CHECK-NEXT:    maddld 5, 12, 27, 0
; CHECK-NEXT:    mr 6, 18
; CHECK-NEXT:    mr 29, 21
; CHECK-NEXT:    mr 30, 20
; CHECK-NEXT:    mr 2, 19
; CHECK-NEXT:    mtctr 11
; CHECK-NEXT:    add 25, 22, 5
; CHECK-NEXT:    maddld 5, 12, 27, 14
; CHECK-NEXT:    add 24, 22, 5
; CHECK-NEXT:    mr 5, 26
; CHECK-NEXT:    .p2align 5
; CHECK-NEXT:  .LBB0_4: # %_loop_2_do_
; CHECK-NEXT:    # Parent Loop BB0_3 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    lxvp 34, 0(6)
; CHECK-NEXT:    lxvp 44, 0(5)
; CHECK-NEXT:    xvmaddadp 43, 45, 35
; CHECK-NEXT:    lxvp 46, 0(24)
; CHECK-NEXT:    xvmaddadp 42, 47, 35
; CHECK-NEXT:    lxvp 48, 0(25)
; CHECK-NEXT:    lxvp 50, 0(29)
; CHECK-NEXT:    lxvp 62, 0(30)
; CHECK-NEXT:    lxvp 60, 0(2)
; CHECK-NEXT:    lxvp 58, 32(6)
; CHECK-NEXT:    lxvp 56, 32(5)
; CHECK-NEXT:    lxvp 54, 32(24)
; CHECK-NEXT:    lxvp 52, 32(25)
; CHECK-NEXT:    lxvp 30, 32(29)
; CHECK-NEXT:    lxvp 28, 32(30)
; CHECK-NEXT:    lxvp 26, 32(2)
; CHECK-NEXT:    xvmaddadp 41, 49, 35
; CHECK-NEXT:    xvmaddadp 40, 51, 35
; CHECK-NEXT:    xvmaddadp 39, 63, 35
; CHECK-NEXT:    xvmaddadp 38, 61, 35
; CHECK-NEXT:    xvmaddadp 33, 44, 34
; CHECK-NEXT:    xvmaddadp 32, 46, 34
; CHECK-NEXT:    xvmaddadp 37, 48, 34
; CHECK-NEXT:    xvmaddadp 36, 50, 34
; CHECK-NEXT:    xvmaddadp 13, 62, 34
; CHECK-NEXT:    xvmaddadp 12, 60, 34
; CHECK-NEXT:    xvmaddadp 11, 57, 59
; CHECK-NEXT:    xvmaddadp 10, 55, 59
; CHECK-NEXT:    xvmaddadp 9, 53, 59
; CHECK-NEXT:    xvmaddadp 7, 31, 59
; CHECK-NEXT:    xvmaddadp 5, 29, 59
; CHECK-NEXT:    xvmaddadp 4, 27, 59
; CHECK-NEXT:    xvmaddadp 2, 56, 58
; CHECK-NEXT:    xvmaddadp 0, 54, 58
; CHECK-NEXT:    xvmaddadp 1, 52, 58
; CHECK-NEXT:    xvmaddadp 3, 30, 58
; CHECK-NEXT:    xvmaddadp 8, 28, 58
; CHECK-NEXT:    xvmaddadp 6, 26, 58
; CHECK-NEXT:    addi 6, 6, 64
; CHECK-NEXT:    addi 5, 5, 64
; CHECK-NEXT:    addi 24, 24, 64
; CHECK-NEXT:    addi 25, 25, 64
; CHECK-NEXT:    addi 29, 29, 64
; CHECK-NEXT:    addi 30, 30, 64
; CHECK-NEXT:    addi 2, 2, 64
; CHECK-NEXT:    bdnz .LBB0_4
; CHECK-NEXT:  # %bb.5: # %_loop_2_endl_
; CHECK-NEXT:    #
; CHECK-NEXT:    addi 28, 28, 6
; CHECK-NEXT:    add 26, 26, 12
; CHECK-NEXT:    add 31, 31, 12
; CHECK-NEXT:    add 19, 19, 12
; CHECK-NEXT:    add 3, 3, 12
; CHECK-NEXT:    add 20, 20, 12
; CHECK-NEXT:    add 21, 21, 12
; CHECK-NEXT:    addi 27, 27, 1
; CHECK-NEXT:    cmpld 28, 4
; CHECK-NEXT:    ble 0, .LBB0_3
; CHECK-NEXT:  # %bb.6: # %_loop_1_loopHeader_._return_bb_crit_edge.loopexit
; CHECK-NEXT:    ld 3, 48(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 43, 0(3)
; CHECK-NEXT:    ld 3, 56(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 42, 0(3)
; CHECK-NEXT:    ld 3, 64(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 41, 0(3)
; CHECK-NEXT:    ld 3, 40(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 40, 0(3)
; CHECK-NEXT:    ld 3, 72(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 39, 0(9)
; CHECK-NEXT:    stxv 38, 0(8)
; CHECK-NEXT:    stxv 33, 0(3)
; CHECK-NEXT:    ld 3, 80(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 32, 0(10)
; CHECK-NEXT:    stxv 37, 0(3)
; CHECK-NEXT:    ld 3, 88(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 36, 0(3)
; CHECK-NEXT:    ld 3, 96(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 13, 0(3)
; CHECK-NEXT:    ld 3, 104(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 12, 0(3)
; CHECK-NEXT:    ld 3, 112(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 11, 0(3)
; CHECK-NEXT:    ld 3, 120(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 10, 0(3)
; CHECK-NEXT:    ld 3, 128(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 9, 0(3)
; CHECK-NEXT:    ld 3, 136(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 7, 0(3)
; CHECK-NEXT:    ld 3, 144(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 5, 0(3)
; CHECK-NEXT:    ld 3, 152(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 4, 0(3)
; CHECK-NEXT:    ld 3, 160(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 2, 0(3)
; CHECK-NEXT:    ld 3, 168(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 0, 0(3)
; CHECK-NEXT:    ld 3, 176(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 1, 0(3)
; CHECK-NEXT:    ld 3, 184(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 3, 0(3)
; CHECK-NEXT:    ld 3, 192(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 8, 0(3)
; CHECK-NEXT:    ld 3, 200(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 6, 0(3)
; CHECK-NEXT:  .LBB0_7: # %_return_bb
; CHECK-NEXT:    lxv 63, 384(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 62, 368(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 61, 352(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 60, 336(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 59, 320(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 58, 304(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 57, 288(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 56, 272(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 55, 256(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 54, 240(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 53, 224(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 52, 208(1) # 16-byte Folded Reload
; CHECK-NEXT:    lfd 31, 584(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 30, 576(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 29, 568(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 28, 560(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 27, 552(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 26, 544(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 31, 536(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 30, 528(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 29, 520(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 28, 512(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 27, 504(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 26, 496(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 25, 488(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 24, 480(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 23, 472(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 22, 464(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 21, 456(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 20, 448(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 19, 440(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 18, 432(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 17, 424(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 16, 416(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 15, 408(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 14, 400(1) # 8-byte Folded Reload
; CHECK-NEXT:    addi 1, 1, 592
; CHECK-NEXT:    blr
entry:
  %_val_l_ = load i32, ptr %.l, align 4
  %_conv = sext i32 %_val_l_ to i64
  %_mult_tmp = shl nsw i64 %_conv, 3
  %_sub_tmp4 = sub nuw nsw i64 -8, %_mult_tmp
  %_val_n_ = load i32, ptr %.n, align 4
  %_leq_tmp.not116 = icmp slt i32 %_val_n_, 1
  br i1 %_leq_tmp.not116, label %_return_bb, label %_loop_1_do_.lr.ph

_loop_1_do_.lr.ph:                                ; preds = %entry
  %_val_m_ = load i32, ptr %.m, align 4
  %_leq_tmp6.not114 = icmp slt i32 %_val_m_, 1
  br i1 %_leq_tmp6.not114, label %_return_bb, label %_loop_1_do_.preheader

_loop_1_do_.preheader:                            ; preds = %_loop_1_do_.lr.ph
  %x_rvo_based_addr_112 = getelementptr inbounds [0 x %_elem_type_of_x], ptr %.x, i64 0, i64 -1
  %a_rvo_based_addr_ = getelementptr inbounds i8, ptr %.a, i64 %_sub_tmp4
  %.vy01.promoted = load <2 x double>, ptr %.vy01, align 16
  %.vy02.promoted = load <2 x double>, ptr %.vy02, align 16
  %.vy03.promoted = load <2 x double>, ptr %.vy03, align 16
  %.vy04.promoted = load <2 x double>, ptr %.vy04, align 16
  %.vy05.promoted = load <2 x double>, ptr %.vy05, align 16
  %.vy06.promoted = load <2 x double>, ptr %.vy06, align 16
  %.vy07.promoted = load <2 x double>, ptr %.vy07, align 16
  %.vy08.promoted = load <2 x double>, ptr %.vy08, align 16
  %.vy09.promoted = load <2 x double>, ptr %.vy09, align 16
  %.vy0a.promoted = load <2 x double>, ptr %.vy0a, align 16
  %.vy0b.promoted = load <2 x double>, ptr %.vy0b, align 16
  %.vy0c.promoted = load <2 x double>, ptr %.vy0c, align 16
  %.vy21.promoted = load <2 x double>, ptr %.vy21, align 16
  %.vy22.promoted = load <2 x double>, ptr %.vy22, align 16
  %.vy23.promoted = load <2 x double>, ptr %.vy23, align 16
  %.vy24.promoted = load <2 x double>, ptr %.vy24, align 16
  %.vy25.promoted = load <2 x double>, ptr %.vy25, align 16
  %.vy26.promoted = load <2 x double>, ptr %.vy26, align 16
  %.vy27.promoted = load <2 x double>, ptr %.vy27, align 16
  %.vy28.promoted = load <2 x double>, ptr %.vy28, align 16
  %.vy29.promoted = load <2 x double>, ptr %.vy29, align 16
  %.vy2a.promoted = load <2 x double>, ptr %.vy2a, align 16
  %.vy2b.promoted = load <2 x double>, ptr %.vy2b, align 16
  %.vy2c.promoted = load <2 x double>, ptr %.vy2c, align 16
  %i = zext i32 %_val_m_ to i64
  %i1 = zext i32 %_val_n_ to i64
  br label %_loop_2_do_.lr.ph

_loop_2_do_.lr.ph:                                ; preds = %_loop_2_endl_, %_loop_1_do_.preheader
  %indvars.iv212 = phi i64 [ %indvars.iv.next213, %_loop_2_endl_ ], [ 1, %_loop_1_do_.preheader ]
  %i2 = phi <2 x double> [ %i142, %_loop_2_endl_ ], [ %.vy2c.promoted, %_loop_1_do_.preheader ]
  %i3 = phi <2 x double> [ %i140, %_loop_2_endl_ ], [ %.vy2b.promoted, %_loop_1_do_.preheader ]
  %i4 = phi <2 x double> [ %i138, %_loop_2_endl_ ], [ %.vy2a.promoted, %_loop_1_do_.preheader ]
  %i5 = phi <2 x double> [ %i136, %_loop_2_endl_ ], [ %.vy29.promoted, %_loop_1_do_.preheader ]
  %i6 = phi <2 x double> [ %i134, %_loop_2_endl_ ], [ %.vy28.promoted, %_loop_1_do_.preheader ]
  %i7 = phi <2 x double> [ %i132, %_loop_2_endl_ ], [ %.vy27.promoted, %_loop_1_do_.preheader ]
  %i8 = phi <2 x double> [ %i129, %_loop_2_endl_ ], [ %.vy26.promoted, %_loop_1_do_.preheader ]
  %i9 = phi <2 x double> [ %i127, %_loop_2_endl_ ], [ %.vy25.promoted, %_loop_1_do_.preheader ]
  %i10 = phi <2 x double> [ %i125, %_loop_2_endl_ ], [ %.vy24.promoted, %_loop_1_do_.preheader ]
  %i11 = phi <2 x double> [ %i123, %_loop_2_endl_ ], [ %.vy23.promoted, %_loop_1_do_.preheader ]
  %i12 = phi <2 x double> [ %i121, %_loop_2_endl_ ], [ %.vy22.promoted, %_loop_1_do_.preheader ]
  %i13 = phi <2 x double> [ %i119, %_loop_2_endl_ ], [ %.vy21.promoted, %_loop_1_do_.preheader ]
  %i14 = phi <2 x double> [ %i116, %_loop_2_endl_ ], [ %.vy0c.promoted, %_loop_1_do_.preheader ]
  %i15 = phi <2 x double> [ %i114, %_loop_2_endl_ ], [ %.vy0b.promoted, %_loop_1_do_.preheader ]
  %i16 = phi <2 x double> [ %i112, %_loop_2_endl_ ], [ %.vy0a.promoted, %_loop_1_do_.preheader ]
  %i17 = phi <2 x double> [ %i110, %_loop_2_endl_ ], [ %.vy09.promoted, %_loop_1_do_.preheader ]
  %i18 = phi <2 x double> [ %i108, %_loop_2_endl_ ], [ %.vy08.promoted, %_loop_1_do_.preheader ]
  %i19 = phi <2 x double> [ %i106, %_loop_2_endl_ ], [ %.vy07.promoted, %_loop_1_do_.preheader ]
  %i20 = phi <2 x double> [ %i81, %_loop_2_endl_ ], [ %.vy06.promoted, %_loop_1_do_.preheader ]
  %i21 = phi <2 x double> [ %i79, %_loop_2_endl_ ], [ %.vy05.promoted, %_loop_1_do_.preheader ]
  %i22 = phi <2 x double> [ %i77, %_loop_2_endl_ ], [ %.vy04.promoted, %_loop_1_do_.preheader ]
  %i23 = phi <2 x double> [ %i75, %_loop_2_endl_ ], [ %.vy03.promoted, %_loop_1_do_.preheader ]
  %i24 = phi <2 x double> [ %i73, %_loop_2_endl_ ], [ %.vy02.promoted, %_loop_1_do_.preheader ]
  %i25 = phi <2 x double> [ %i71, %_loop_2_endl_ ], [ %.vy01.promoted, %_loop_1_do_.preheader ]
  %_ix_x_len10 = mul i64 %_mult_tmp, %indvars.iv212
  %a_ix_dim_0_ = getelementptr inbounds i8, ptr %a_rvo_based_addr_, i64 %_ix_x_len10
  %i26 = add nuw nsw i64 %indvars.iv212, 1
  %_ix_x_len24 = mul i64 %_mult_tmp, %i26
  %a_ix_dim_0_25 = getelementptr inbounds i8, ptr %a_rvo_based_addr_, i64 %_ix_x_len24
  %i27 = add nuw nsw i64 %indvars.iv212, 2
  %_ix_x_len40 = mul i64 %_mult_tmp, %i27
  %a_ix_dim_0_41 = getelementptr inbounds i8, ptr %a_rvo_based_addr_, i64 %_ix_x_len40
  %i28 = add nuw nsw i64 %indvars.iv212, 3
  %_ix_x_len56 = mul i64 %_mult_tmp, %i28
  %a_ix_dim_0_57 = getelementptr inbounds i8, ptr %a_rvo_based_addr_, i64 %_ix_x_len56
  %i29 = add nuw nsw i64 %indvars.iv212, 4
  %_ix_x_len72 = mul i64 %_mult_tmp, %i29
  %a_ix_dim_0_73 = getelementptr inbounds i8, ptr %a_rvo_based_addr_, i64 %_ix_x_len72
  %i30 = add nuw nsw i64 %indvars.iv212, 5
  %_ix_x_len88 = mul i64 %_mult_tmp, %i30
  %a_ix_dim_0_89 = getelementptr inbounds i8, ptr %a_rvo_based_addr_, i64 %_ix_x_len88
  br label %_loop_2_do_

_loop_2_do_:                                      ; preds = %_loop_2_do_, %_loop_2_do_.lr.ph
  %indvars.iv = phi i64 [ 1, %_loop_2_do_.lr.ph ], [ %indvars.iv.next, %_loop_2_do_ ]
  %i31 = phi <2 x double> [ %i2, %_loop_2_do_.lr.ph ], [ %i142, %_loop_2_do_ ]
  %i32 = phi <2 x double> [ %i3, %_loop_2_do_.lr.ph ], [ %i140, %_loop_2_do_ ]
  %i33 = phi <2 x double> [ %i4, %_loop_2_do_.lr.ph ], [ %i138, %_loop_2_do_ ]
  %i34 = phi <2 x double> [ %i5, %_loop_2_do_.lr.ph ], [ %i136, %_loop_2_do_ ]
  %i35 = phi <2 x double> [ %i6, %_loop_2_do_.lr.ph ], [ %i134, %_loop_2_do_ ]
  %i36 = phi <2 x double> [ %i7, %_loop_2_do_.lr.ph ], [ %i132, %_loop_2_do_ ]
  %i37 = phi <2 x double> [ %i8, %_loop_2_do_.lr.ph ], [ %i129, %_loop_2_do_ ]
  %i38 = phi <2 x double> [ %i9, %_loop_2_do_.lr.ph ], [ %i127, %_loop_2_do_ ]
  %i39 = phi <2 x double> [ %i10, %_loop_2_do_.lr.ph ], [ %i125, %_loop_2_do_ ]
  %i40 = phi <2 x double> [ %i11, %_loop_2_do_.lr.ph ], [ %i123, %_loop_2_do_ ]
  %i41 = phi <2 x double> [ %i12, %_loop_2_do_.lr.ph ], [ %i121, %_loop_2_do_ ]
  %i42 = phi <2 x double> [ %i13, %_loop_2_do_.lr.ph ], [ %i119, %_loop_2_do_ ]
  %i43 = phi <2 x double> [ %i14, %_loop_2_do_.lr.ph ], [ %i116, %_loop_2_do_ ]
  %i44 = phi <2 x double> [ %i15, %_loop_2_do_.lr.ph ], [ %i114, %_loop_2_do_ ]
  %i45 = phi <2 x double> [ %i16, %_loop_2_do_.lr.ph ], [ %i112, %_loop_2_do_ ]
  %i46 = phi <2 x double> [ %i17, %_loop_2_do_.lr.ph ], [ %i110, %_loop_2_do_ ]
  %i47 = phi <2 x double> [ %i18, %_loop_2_do_.lr.ph ], [ %i108, %_loop_2_do_ ]
  %i48 = phi <2 x double> [ %i19, %_loop_2_do_.lr.ph ], [ %i106, %_loop_2_do_ ]
  %i49 = phi <2 x double> [ %i20, %_loop_2_do_.lr.ph ], [ %i81, %_loop_2_do_ ]
  %i50 = phi <2 x double> [ %i21, %_loop_2_do_.lr.ph ], [ %i79, %_loop_2_do_ ]
  %i51 = phi <2 x double> [ %i22, %_loop_2_do_.lr.ph ], [ %i77, %_loop_2_do_ ]
  %i52 = phi <2 x double> [ %i23, %_loop_2_do_.lr.ph ], [ %i75, %_loop_2_do_ ]
  %i53 = phi <2 x double> [ %i24, %_loop_2_do_.lr.ph ], [ %i73, %_loop_2_do_ ]
  %i54 = phi <2 x double> [ %i25, %_loop_2_do_.lr.ph ], [ %i71, %_loop_2_do_ ]
  %_ix_x_len = shl nuw nsw i64 %indvars.iv, 3
  %x_ix_dim_0_113 = getelementptr inbounds %_elem_type_of_x, ptr %x_rvo_based_addr_112, i64 %indvars.iv
  %i55 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %x_ix_dim_0_113)
  %a_ix_dim_1_ = getelementptr inbounds i8, ptr %a_ix_dim_0_, i64 %_ix_x_len
  %i56 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %a_ix_dim_1_)
  %a_ix_dim_1_29 = getelementptr inbounds i8, ptr %a_ix_dim_0_25, i64 %_ix_x_len
  %i57 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %a_ix_dim_1_29)
  %a_ix_dim_1_45 = getelementptr inbounds i8, ptr %a_ix_dim_0_41, i64 %_ix_x_len
  %i58 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %a_ix_dim_1_45)
  %a_ix_dim_1_61 = getelementptr inbounds i8, ptr %a_ix_dim_0_57, i64 %_ix_x_len
  %i59 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %a_ix_dim_1_61)
  %a_ix_dim_1_77 = getelementptr inbounds i8, ptr %a_ix_dim_0_73, i64 %_ix_x_len
  %i60 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %a_ix_dim_1_77)
  %a_ix_dim_1_93 = getelementptr inbounds i8, ptr %a_ix_dim_0_89, i64 %_ix_x_len
  %i61 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr nonnull %a_ix_dim_1_93)
  %i62 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i55)
  %.fca.0.extract35 = extractvalue { <16 x i8>, <16 x i8> } %i62, 0
  %.fca.1.extract36 = extractvalue { <16 x i8>, <16 x i8> } %i62, 1
  %i63 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i56)
  %.fca.0.extract29 = extractvalue { <16 x i8>, <16 x i8> } %i63, 0
  %.fca.1.extract30 = extractvalue { <16 x i8>, <16 x i8> } %i63, 1
  %i64 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i57)
  %.fca.0.extract23 = extractvalue { <16 x i8>, <16 x i8> } %i64, 0
  %.fca.1.extract24 = extractvalue { <16 x i8>, <16 x i8> } %i64, 1
  %i65 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i58)
  %.fca.0.extract17 = extractvalue { <16 x i8>, <16 x i8> } %i65, 0
  %.fca.1.extract18 = extractvalue { <16 x i8>, <16 x i8> } %i65, 1
  %i66 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i59)
  %.fca.0.extract11 = extractvalue { <16 x i8>, <16 x i8> } %i66, 0
  %.fca.1.extract12 = extractvalue { <16 x i8>, <16 x i8> } %i66, 1
  %i67 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i60)
  %.fca.0.extract5 = extractvalue { <16 x i8>, <16 x i8> } %i67, 0
  %.fca.1.extract6 = extractvalue { <16 x i8>, <16 x i8> } %i67, 1
  %i68 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i61)
  %.fca.0.extract = extractvalue { <16 x i8>, <16 x i8> } %i68, 0
  %.fca.1.extract = extractvalue { <16 x i8>, <16 x i8> } %i68, 1
  %i69 = bitcast <16 x i8> %.fca.0.extract29 to <2 x double>
  %i70 = bitcast <16 x i8> %.fca.0.extract35 to <2 x double>
  %i71 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i69, <2 x double> %i70, <2 x double> %i54)
  %i72 = bitcast <16 x i8> %.fca.0.extract23 to <2 x double>
  %i73 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i72, <2 x double> %i70, <2 x double> %i53)
  %i74 = bitcast <16 x i8> %.fca.0.extract17 to <2 x double>
  %i75 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i74, <2 x double> %i70, <2 x double> %i52)
  %i76 = bitcast <16 x i8> %.fca.0.extract11 to <2 x double>
  %i77 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i76, <2 x double> %i70, <2 x double> %i51)
  %i78 = bitcast <16 x i8> %.fca.0.extract5 to <2 x double>
  %i79 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i78, <2 x double> %i70, <2 x double> %i50)
  %i80 = bitcast <16 x i8> %.fca.0.extract to <2 x double>
  %i81 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i80, <2 x double> %i70, <2 x double> %i49)
  %i82 = getelementptr %_elem_type_of_x, ptr %x_ix_dim_0_113, i64 4
  %i84 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i82)
  %i85 = getelementptr i8, ptr %a_ix_dim_1_, i64 32
  %i86 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i85)
  %i87 = getelementptr i8, ptr %a_ix_dim_1_29, i64 32
  %i88 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i87)
  %i89 = getelementptr i8, ptr %a_ix_dim_1_45, i64 32
  %i90 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i89)
  %i91 = getelementptr i8, ptr %a_ix_dim_1_61, i64 32
  %i92 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i91)
  %i93 = getelementptr i8, ptr %a_ix_dim_1_77, i64 32
  %i94 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i93)
  %i95 = getelementptr i8, ptr %a_ix_dim_1_93, i64 32
  %i96 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(ptr %i95)
  %i97 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i84)
  %.fca.0.extract37 = extractvalue { <16 x i8>, <16 x i8> } %i97, 0
  %.fca.1.extract39 = extractvalue { <16 x i8>, <16 x i8> } %i97, 1
  %i98 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i86)
  %.fca.0.extract31 = extractvalue { <16 x i8>, <16 x i8> } %i98, 0
  %.fca.1.extract33 = extractvalue { <16 x i8>, <16 x i8> } %i98, 1
  %i99 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i88)
  %.fca.0.extract25 = extractvalue { <16 x i8>, <16 x i8> } %i99, 0
  %.fca.1.extract27 = extractvalue { <16 x i8>, <16 x i8> } %i99, 1
  %i100 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i90)
  %.fca.0.extract19 = extractvalue { <16 x i8>, <16 x i8> } %i100, 0
  %.fca.1.extract21 = extractvalue { <16 x i8>, <16 x i8> } %i100, 1
  %i101 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i92)
  %.fca.0.extract13 = extractvalue { <16 x i8>, <16 x i8> } %i101, 0
  %.fca.1.extract15 = extractvalue { <16 x i8>, <16 x i8> } %i101, 1
  %i102 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i94)
  %.fca.0.extract7 = extractvalue { <16 x i8>, <16 x i8> } %i102, 0
  %.fca.1.extract9 = extractvalue { <16 x i8>, <16 x i8> } %i102, 1
  %i103 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %i96)
  %.fca.0.extract1 = extractvalue { <16 x i8>, <16 x i8> } %i103, 0
  %.fca.1.extract3 = extractvalue { <16 x i8>, <16 x i8> } %i103, 1
  %i104 = bitcast <16 x i8> %.fca.1.extract30 to <2 x double>
  %i105 = bitcast <16 x i8> %.fca.1.extract36 to <2 x double>
  %i106 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i104, <2 x double> %i105, <2 x double> %i48)
  %i107 = bitcast <16 x i8> %.fca.1.extract24 to <2 x double>
  %i108 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i107, <2 x double> %i105, <2 x double> %i47)
  %i109 = bitcast <16 x i8> %.fca.1.extract18 to <2 x double>
  %i110 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i109, <2 x double> %i105, <2 x double> %i46)
  %i111 = bitcast <16 x i8> %.fca.1.extract12 to <2 x double>
  %i112 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i111, <2 x double> %i105, <2 x double> %i45)
  %i113 = bitcast <16 x i8> %.fca.1.extract6 to <2 x double>
  %i114 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i113, <2 x double> %i105, <2 x double> %i44)
  %i115 = bitcast <16 x i8> %.fca.1.extract to <2 x double>
  %i116 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i115, <2 x double> %i105, <2 x double> %i43)
  %i117 = bitcast <16 x i8> %.fca.0.extract31 to <2 x double>
  %i118 = bitcast <16 x i8> %.fca.0.extract37 to <2 x double>
  %i119 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i117, <2 x double> %i118, <2 x double> %i42)
  %i120 = bitcast <16 x i8> %.fca.0.extract25 to <2 x double>
  %i121 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i120, <2 x double> %i118, <2 x double> %i41)
  %i122 = bitcast <16 x i8> %.fca.0.extract19 to <2 x double>
  %i123 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i122, <2 x double> %i118, <2 x double> %i40)
  %i124 = bitcast <16 x i8> %.fca.0.extract13 to <2 x double>
  %i125 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i124, <2 x double> %i118, <2 x double> %i39)
  %i126 = bitcast <16 x i8> %.fca.0.extract7 to <2 x double>
  %i127 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i126, <2 x double> %i118, <2 x double> %i38)
  %i128 = bitcast <16 x i8> %.fca.0.extract1 to <2 x double>
  %i129 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i128, <2 x double> %i118, <2 x double> %i37)
  %i130 = bitcast <16 x i8> %.fca.1.extract33 to <2 x double>
  %i131 = bitcast <16 x i8> %.fca.1.extract39 to <2 x double>
  %i132 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i130, <2 x double> %i131, <2 x double> %i36)
  %i133 = bitcast <16 x i8> %.fca.1.extract27 to <2 x double>
  %i134 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i133, <2 x double> %i131, <2 x double> %i35)
  %i135 = bitcast <16 x i8> %.fca.1.extract21 to <2 x double>
  %i136 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i135, <2 x double> %i131, <2 x double> %i34)
  %i137 = bitcast <16 x i8> %.fca.1.extract15 to <2 x double>
  %i138 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i137, <2 x double> %i131, <2 x double> %i33)
  %i139 = bitcast <16 x i8> %.fca.1.extract9 to <2 x double>
  %i140 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i139, <2 x double> %i131, <2 x double> %i32)
  %i141 = bitcast <16 x i8> %.fca.1.extract3 to <2 x double>
  %i142 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %i141, <2 x double> %i131, <2 x double> %i31)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 8
  %_leq_tmp6.not = icmp ugt i64 %indvars.iv.next, %i
  br i1 %_leq_tmp6.not, label %_loop_2_endl_, label %_loop_2_do_

_loop_2_endl_:                                    ; preds = %_loop_2_do_
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 6
  %_leq_tmp.not = icmp ugt i64 %indvars.iv.next213, %i1
  br i1 %_leq_tmp.not, label %_loop_1_loopHeader_._return_bb_crit_edge.loopexit, label %_loop_2_do_.lr.ph

_loop_1_loopHeader_._return_bb_crit_edge.loopexit: ; preds = %_loop_2_endl_
  store <2 x double> %i71, ptr %.vy01, align 16
  store <2 x double> %i73, ptr %.vy02, align 16
  store <2 x double> %i75, ptr %.vy03, align 16
  store <2 x double> %i77, ptr %.vy04, align 16
  store <2 x double> %i79, ptr %.vy05, align 16
  store <2 x double> %i81, ptr %.vy06, align 16
  store <2 x double> %i106, ptr %.vy07, align 16
  store <2 x double> %i108, ptr %.vy08, align 16
  store <2 x double> %i110, ptr %.vy09, align 16
  store <2 x double> %i112, ptr %.vy0a, align 16
  store <2 x double> %i114, ptr %.vy0b, align 16
  store <2 x double> %i116, ptr %.vy0c, align 16
  store <2 x double> %i119, ptr %.vy21, align 16
  store <2 x double> %i121, ptr %.vy22, align 16
  store <2 x double> %i123, ptr %.vy23, align 16
  store <2 x double> %i125, ptr %.vy24, align 16
  store <2 x double> %i127, ptr %.vy25, align 16
  store <2 x double> %i129, ptr %.vy26, align 16
  store <2 x double> %i132, ptr %.vy27, align 16
  store <2 x double> %i134, ptr %.vy28, align 16
  store <2 x double> %i136, ptr %.vy29, align 16
  store <2 x double> %i138, ptr %.vy2a, align 16
  store <2 x double> %i140, ptr %.vy2b, align 16
  store <2 x double> %i142, ptr %.vy2c, align 16
  br label %_return_bb

_return_bb:                                       ; preds = %_loop_1_loopHeader_._return_bb_crit_edge.loopexit, %_loop_1_do_.lr.ph, %entry
  ret void
}

declare <256 x i1> @llvm.ppc.vsx.lxvp(ptr)
declare { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1>)
declare <2 x double> @llvm.fma.v2f64(<2 x double>, <2 x double>, <2 x double>)
