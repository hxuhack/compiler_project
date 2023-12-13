declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @bubblesort( i32* %r100 ) {
bb1:
  %r557 = add i32 0, 0
  %r558 = add i32 0, 0
  %r559 = add i32 0, 0
  %r560 = add i32 0, 0
  %r561 = add i32 0, 0
  %r562 = add i32 0, 0
  br label %bb2

bb2:
  %r563 = phi i32 [ %r562, %bb1 ], [ %r571, %bb7 ]
  %r564 = load i32, i32* @n
  %r565 = sub i32 %r564, 1
  %r106 = icmp slt i32 %r563, %r565
  br i1 %r106, label %bb3, label %bb4

bb3:
  %r566 = add i32 0, 0
  br label %bb5

bb5:
  %r567 = phi i32 [ %r566, %bb3 ], [ %r575, %bb10 ]
  %r568 = load i32, i32* @n
  %r569 = sub i32 %r568, %r563
  %r570 = sub i32 %r569, 1
  %r112 = icmp slt i32 %r567, %r570
  br i1 %r112, label %bb6, label %bb7

bb6:
  %r572 = add i32 %r567, 1
  %r117 = getelementptr i32, i32* %r100, i32 %r567
  %r573 = load i32, i32* %r117
  %r120 = getelementptr i32, i32* %r100, i32 %r572
  %r574 = load i32, i32* %r120
  %r122 = icmp sgt i32 %r573, %r574
  br i1 %r122, label %bb8, label %bb9

bb8:
  %r576 = add i32 %r567, 1
  %r128 = getelementptr i32, i32* %r100, i32 %r576
  %r577 = load i32, i32* %r128
  %r131 = getelementptr i32, i32* %r100, i32 %r567
  %r578 = load i32, i32* %r131
  %r134 = getelementptr i32, i32* %r100, i32 %r576
  store i32 %r578, i32* %r134
  %r137 = getelementptr i32, i32* %r100, i32 %r567
  store i32 %r577, i32* %r137
  br label %bb10

bb9:
  br label %bb10

bb10:
  %r575 = add i32 %r567, 1
  br label %bb5

bb7:
  %r571 = add i32 %r563, 1
  br label %bb2

bb4:
  ret i32 0
}

define i32 @insertsort( i32* %r142 ) {
bb11:
  %r584 = add i32 0, 0
  %r585 = add i32 0, 0
  %r586 = add i32 0, 0
  %r587 = add i32 0, 0
  %r588 = add i32 0, 0
  %r589 = add i32 1, 0
  br label %bb12

bb12:
  %r590 = phi i32 [ %r589, %bb11 ], [ %r597, %bb17 ]
  %r591 = load i32, i32* @n
  %r146 = icmp slt i32 %r590, %r591
  br i1 %r146, label %bb13, label %bb14

bb13:
  %r149 = getelementptr i32, i32* %r142, i32 %r590
  %r592 = load i32, i32* %r149
  %r593 = sub i32 %r590, 1
  br label %bb15

bb15:
  %r594 = phi i32 [ %r593, %bb13 ], [ %r601, %bb16 ]
  %r595 = sub i32 0, 1
  %r156 = icmp sgt i32 %r594, %r595
  br i1 %r156, label %bb18, label %bb17

bb18:
  %r159 = getelementptr i32, i32* %r142, i32 %r594
  %r598 = load i32, i32* %r159
  %r161 = icmp slt i32 %r592, %r598
  br i1 %r161, label %bb16, label %bb17

bb16:
  %r599 = add i32 %r594, 1
  %r166 = getelementptr i32, i32* %r142, i32 %r594
  %r600 = load i32, i32* %r166
  %r169 = getelementptr i32, i32* %r142, i32 %r599
  store i32 %r600, i32* %r169
  %r601 = sub i32 %r594, 1
  br label %bb15

bb17:
  %r596 = add i32 %r594, 1
  %r177 = getelementptr i32, i32* %r142, i32 %r596
  store i32 %r592, i32* %r177
  %r597 = add i32 %r590, 1
  br label %bb12

bb14:
  ret i32 0
}

define i32 @QuickSort( i32* %r180, i32 %r181, i32 %r183 ) {
bb104:
  %r608 = add i32 0, 0
  %r609 = add i32 0, 0
  %r610 = add i32 0, 0
  %r611 = add i32 0, 0
  %r612 = add i32 0, 0
  %r613 = add i32 %r181, 0
  %r614 = add i32 0, 0
  %r615 = add i32 %r183, 0
  br label %bb19

bb19:
  %r187 = icmp slt i32 %r613, %r615
  br i1 %r187, label %bb20, label %bb21

bb20:
  %r616 = add i32 %r613, 0
  %r617 = add i32 %r615, 0
  %r194 = getelementptr i32, i32* %r180, i32 %r613
  %r618 = load i32, i32* %r194
  br label %bb23

bb23:
  %r619 = phi i32 [ %r617, %bb20 ], [ %r628, %bb39 ]
  %r620 = phi i32 [ %r616, %bb20 ], [ %r627, %bb39 ]
  %r198 = icmp slt i32 %r620, %r619
  br i1 %r198, label %bb24, label %bb25

bb24:
  br label %bb26

bb26:
  %r625 = phi i32 [ %r619, %bb24 ], [ %r637, %bb27 ]
  %r201 = icmp slt i32 %r620, %r625
  br i1 %r201, label %bb29, label %bb28

bb29:
  %r203 = getelementptr i32, i32* %r180, i32 %r625
  %r635 = load i32, i32* %r203
  %r636 = sub i32 %r618, 1
  %r207 = icmp sgt i32 %r635, %r636
  br i1 %r207, label %bb27, label %bb28

bb27:
  %r637 = sub i32 %r625, 1
  br label %bb26

bb28:
  %r212 = icmp slt i32 %r620, %r625
  br i1 %r212, label %bb30, label %bb31

bb30:
  %r214 = getelementptr i32, i32* %r180, i32 %r625
  %r633 = load i32, i32* %r214
  %r217 = getelementptr i32, i32* %r180, i32 %r620
  store i32 %r633, i32* %r217
  %r634 = add i32 %r620, 1
  br label %bb32

bb31:
  br label %bb32

bb32:
  %r626 = phi i32 [ %r634, %bb30 ], [ %r620, %bb31 ]
  br label %bb33

bb33:
  %r627 = phi i32 [ %r626, %bb32 ], [ %r632, %bb34 ]
  %r222 = icmp slt i32 %r627, %r625
  br i1 %r222, label %bb36, label %bb35

bb36:
  %r224 = getelementptr i32, i32* %r180, i32 %r627
  %r631 = load i32, i32* %r224
  %r227 = icmp slt i32 %r631, %r618
  br i1 %r227, label %bb34, label %bb35

bb34:
  %r632 = add i32 %r627, 1
  br label %bb33

bb35:
  %r232 = icmp slt i32 %r627, %r625
  br i1 %r232, label %bb37, label %bb38

bb37:
  %r234 = getelementptr i32, i32* %r180, i32 %r627
  %r629 = load i32, i32* %r234
  %r237 = getelementptr i32, i32* %r180, i32 %r625
  store i32 %r629, i32* %r237
  %r630 = sub i32 %r625, 1
  br label %bb39

bb38:
  br label %bb39

bb39:
  %r628 = phi i32 [ %r630, %bb37 ], [ %r625, %bb38 ]
  br label %bb23

bb25:
  %r242 = getelementptr i32, i32* %r180, i32 %r620
  store i32 %r618, i32* %r242
  %r621 = sub i32 %r620, 1
  %r622 = call i32 @QuickSort(i32* %r180, i32 %r613, i32 %r621)
  %r623 = add i32 %r620, 1
  %r624 = call i32 @QuickSort(i32* %r180, i32 %r623, i32 %r615)
  br label %bb22

bb21:
  br label %bb22

bb22:
  ret i32 0
}

define i32 @getMid( i32* %r254 ) {
bb40:
  %r640 = add i32 0, 0
  %r641 = add i32 0, 0
  %r642 = load i32, i32* @n
  %r643 = sdiv i32 %r642, 2
  %r644 = mul i32 %r643, 2
  %r645 = load i32, i32* @n
  %r260 = icmp eq i32 %r644, %r645
  br i1 %r260, label %bb41, label %bb42

bb41:
  %r649 = load i32, i32* @n
  %r650 = sdiv i32 %r649, 2
  %r651 = sub i32 %r650, 1
  %r267 = getelementptr i32, i32* %r254, i32 %r650
  %r652 = load i32, i32* %r267
  %r270 = getelementptr i32, i32* %r254, i32 %r651
  %r653 = load i32, i32* %r270
  %r654 = add i32 %r652, %r653
  %r655 = sdiv i32 %r654, 2
  ret i32 %r655
bb42:
  %r646 = load i32, i32* @n
  %r647 = sdiv i32 %r646, 2
  %r277 = getelementptr i32, i32* %r254, i32 %r647
  %r648 = load i32, i32* %r277
  ret i32 %r648
}

define i32 @getMost( i32* %r279 ) {
bb44:
  %r660 = add i32 0, 0
  %r661 = add i32 0, 0
  %r662 = add i32 0, 0
  %r280 = alloca [ 1000 x i32 ]
  %r663 = add i32 0, 0
  %r664 = add i32 0, 0
  br label %bb45

bb45:
  %r665 = phi i32 [ %r664, %bb44 ], [ %r681, %bb46 ]
  %r283 = icmp slt i32 %r665, 1000
  br i1 %r283, label %bb46, label %bb47

bb46:
  %r285 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r665
  store i32 0, i32* %r285
  %r681 = add i32 %r665, 1
  br label %bb45

bb47:
  %r666 = add i32 0, 0
  %r667 = add i32 0, 0
  br label %bb48

bb48:
  %r668 = phi i32 [ %r666, %bb47 ], [ %r678, %bb53 ]
  %r669 = phi i32 [ %r667, %bb47 ], [ %r676, %bb53 ]
  %r670 = phi i32 [ %r661, %bb47 ], [ %r677, %bb53 ]
  %r671 = load i32, i32* @n
  %r292 = icmp slt i32 %r668, %r671
  br i1 %r292, label %bb49, label %bb50

bb49:
  %r295 = getelementptr i32, i32* %r279, i32 %r668
  %r672 = load i32, i32* %r295
  %r298 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r672
  %r673 = load i32, i32* %r298
  %r674 = add i32 %r673, 1
  %r302 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r672
  store i32 %r674, i32* %r302
  %r304 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r672
  %r675 = load i32, i32* %r304
  %r307 = icmp sgt i32 %r675, %r669
  br i1 %r307, label %bb51, label %bb52

bb51:
  %r309 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r672
  %r679 = load i32, i32* %r309
  %r680 = add i32 %r672, 0
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r676 = phi i32 [ %r679, %bb51 ], [ %r669, %bb52 ]
  %r677 = phi i32 [ %r680, %bb51 ], [ %r670, %bb52 ]
  %r678 = add i32 %r668, 1
  br label %bb48

bb50:
  ret i32 %r670
}

define i32 @revert( i32* %r315 ) {
bb54:
  %r685 = add i32 0, 0
  %r686 = add i32 0, 0
  %r687 = add i32 0, 0
  %r688 = add i32 0, 0
  %r689 = add i32 0, 0
  br label %bb55

bb55:
  %r690 = phi i32 [ %r689, %bb54 ], [ %r695, %bb56 ]
  %r691 = phi i32 [ %r688, %bb54 ], [ %r694, %bb56 ]
  %r321 = icmp slt i32 %r691, %r690
  br i1 %r321, label %bb56, label %bb57

bb56:
  %r323 = getelementptr i32, i32* %r315, i32 %r691
  %r692 = load i32, i32* %r323
  %r326 = getelementptr i32, i32* %r315, i32 %r690
  %r693 = load i32, i32* %r326
  %r329 = getelementptr i32, i32* %r315, i32 %r691
  store i32 %r693, i32* %r329
  %r332 = getelementptr i32, i32* %r315, i32 %r690
  store i32 %r692, i32* %r332
  %r694 = add i32 %r691, 1
  %r695 = sub i32 %r690, 1
  br label %bb55

bb57:
  ret i32 0
}

define i32 @arrCopy( i32* %r337, i32* %r338 ) {
bb58:
  %r697 = add i32 0, 0
  %r698 = add i32 0, 0
  br label %bb59

bb59:
  %r699 = phi i32 [ %r698, %bb58 ], [ %r702, %bb60 ]
  %r700 = load i32, i32* @n
  %r342 = icmp slt i32 %r699, %r700
  br i1 %r342, label %bb60, label %bb61

bb60:
  %r344 = getelementptr i32, i32* %r337, i32 %r699
  %r701 = load i32, i32* %r344
  %r347 = getelementptr i32, i32* %r338, i32 %r699
  store i32 %r701, i32* %r347
  %r702 = add i32 %r699, 1
  br label %bb59

bb61:
  ret i32 0
}

define i32 @calSum( i32* %r350, i32 %r351 ) {
bb107:
  %r706 = add i32 0, 0
  %r707 = add i32 0, 0
  %r708 = add i32 0, 0
  %r709 = add i32 %r351, 0
  br label %bb62

bb62:
  %r710 = add i32 0, 0
  %r711 = add i32 0, 0
  br label %bb63

bb63:
  %r712 = phi i32 [ %r710, %bb62 ], [ %r721, %bb68 ]
  %r713 = phi i32 [ %r711, %bb62 ], [ %r722, %bb68 ]
  %r714 = load i32, i32* @n
  %r357 = icmp slt i32 %r713, %r714
  br i1 %r357, label %bb64, label %bb65

bb64:
  %r360 = getelementptr i32, i32* %r350, i32 %r713
  %r715 = load i32, i32* %r360
  %r716 = add i32 %r712, %r715
  %r717 = sdiv i32 %r713, %r709
  %r718 = mul i32 %r717, %r709
  %r719 = sub i32 %r713, %r718
  %r720 = sub i32 %r709, 1
  %r372 = icmp ne i32 %r719, %r720
  br i1 %r372, label %bb66, label %bb67

bb66:
  %r374 = getelementptr i32, i32* %r350, i32 %r713
  store i32 0, i32* %r374
  br label %bb68

bb67:
  %r377 = getelementptr i32, i32* %r350, i32 %r713
  store i32 %r716, i32* %r377
  %r723 = add i32 0, 0
  br label %bb68

bb68:
  %r721 = phi i32 [ %r716, %bb66 ], [ %r723, %bb67 ]
  %r722 = add i32 %r713, 1
  br label %bb63

bb65:
  ret i32 0
}

define i32 @avgPooling( i32* %r380, i32 %r381 ) {
bb108:
  %r729 = add i32 0, 0
  %r730 = add i32 0, 0
  %r731 = add i32 0, 0
  %r732 = add i32 0, 0
  %r733 = add i32 0, 0
  %r734 = add i32 %r381, 0
  br label %bb69

bb69:
  %r735 = add i32 0, 0
  %r736 = add i32 0, 0
  br label %bb70

bb70:
  %r737 = phi i32 [ %r735, %bb69 ], [ %r750, %bb75 ]
  %r738 = phi i32 [ %r736, %bb69 ], [ %r748, %bb75 ]
  %r739 = phi i32 [ %r730, %bb69 ], [ %r749, %bb75 ]
  %r740 = load i32, i32* @n
  %r388 = icmp slt i32 %r737, %r740
  br i1 %r388, label %bb71, label %bb72

bb71:
  %r747 = sub i32 %r734, 1
  %r392 = icmp slt i32 %r737, %r747
  br i1 %r392, label %bb73, label %bb74

bb73:
  %r395 = getelementptr i32, i32* %r380, i32 %r737
  %r763 = load i32, i32* %r395
  %r764 = add i32 %r738, %r763
  br label %bb75

bb74:
  %r751 = sub i32 %r734, 1
  %r401 = icmp eq i32 %r737, %r751
  br i1 %r401, label %bb76, label %bb77

bb76:
  %r402 = getelementptr i32, i32* %r380, i32 0
  %r761 = load i32, i32* %r402
  %r762 = sdiv i32 %r738, %r734
  %r407 = getelementptr i32, i32* %r380, i32 0
  store i32 %r762, i32* %r407
  br label %bb78

bb77:
  %r410 = getelementptr i32, i32* %r380, i32 %r737
  %r754 = load i32, i32* %r410
  %r755 = add i32 %r738, %r754
  %r756 = sub i32 %r755, %r739
  %r757 = sub i32 %r737, %r734
  %r758 = add i32 %r757, 1
  %r421 = getelementptr i32, i32* %r380, i32 %r758
  %r759 = load i32, i32* %r421
  %r760 = sdiv i32 %r756, %r734
  %r427 = getelementptr i32, i32* %r380, i32 %r758
  store i32 %r760, i32* %r427
  br label %bb78

bb78:
  %r752 = phi i32 [ %r738, %bb76 ], [ %r756, %bb77 ]
  %r753 = phi i32 [ %r761, %bb76 ], [ %r759, %bb77 ]
  br label %bb75

bb75:
  %r748 = phi i32 [ %r764, %bb73 ], [ %r752, %bb78 ]
  %r749 = phi i32 [ %r739, %bb73 ], [ %r753, %bb78 ]
  %r750 = add i32 %r737, 1
  br label %bb70

bb72:
  %r741 = load i32, i32* @n
  %r742 = sub i32 %r741, %r734
  %r743 = add i32 %r742, 1
  br label %bb79

bb79:
  %r744 = phi i32 [ %r743, %bb72 ], [ %r746, %bb80 ]
  %r745 = load i32, i32* @n
  %r436 = icmp slt i32 %r744, %r745
  br i1 %r436, label %bb80, label %bb81

bb80:
  %r438 = getelementptr i32, i32* %r380, i32 %r744
  store i32 0, i32* %r438
  %r746 = add i32 %r744, 1
  br label %bb79

bb81:
  ret i32 0
}

define i32 @main( ) {
bb82:
  call void @_sysy_starttime(i32 209)
  store i32 32, i32* @n
  %r441 = alloca [ 32 x i32 ]
  %r442 = alloca [ 32 x i32 ]
  %r443 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 0
  store i32 7, i32* %r443
  %r444 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 1
  store i32 23, i32* %r444
  %r445 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 2
  store i32 89, i32* %r445
  %r446 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 3
  store i32 26, i32* %r446
  %r447 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 4
  store i32 282, i32* %r447
  %r448 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 5
  store i32 254, i32* %r448
  %r449 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 6
  store i32 27, i32* %r449
  %r450 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 7
  store i32 5, i32* %r450
  %r451 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 8
  store i32 83, i32* %r451
  %r452 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 9
  store i32 273, i32* %r452
  %r453 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 10
  store i32 574, i32* %r453
  %r454 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 11
  store i32 905, i32* %r454
  %r455 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 12
  store i32 354, i32* %r455
  %r456 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 13
  store i32 657, i32* %r456
  %r457 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 14
  store i32 935, i32* %r457
  %r458 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 15
  store i32 264, i32* %r458
  %r459 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 16
  store i32 639, i32* %r459
  %r460 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 17
  store i32 459, i32* %r460
  %r461 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 18
  store i32 29, i32* %r461
  %r462 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 19
  store i32 68, i32* %r462
  %r463 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 20
  store i32 929, i32* %r463
  %r464 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 21
  store i32 756, i32* %r464
  %r465 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 22
  store i32 452, i32* %r465
  %r466 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 23
  store i32 279, i32* %r466
  %r467 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 24
  store i32 58, i32* %r467
  %r468 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 25
  store i32 87, i32* %r468
  %r469 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 26
  store i32 96, i32* %r469
  %r470 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 27
  store i32 36, i32* %r470
  %r471 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 28
  store i32 39, i32* %r471
  %r472 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 29
  store i32 28, i32* %r472
  %r473 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 30
  store i32 1, i32* %r473
  %r474 = getelementptr [32 x i32 ], [32 x i32 ]* %r441, i32 0, i32 31
  store i32 290, i32* %r474
  %r767 = add i32 0, 0
  %r768 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r769 = call i32 @revert(i32* %r442)
  %r770 = add i32 0, 0
  %r771 = add i32 0, 0
  br label %bb83

bb83:
  %r772 = phi i32 [ %r771, %bb82 ], [ %r812, %bb84 ]
  %r480 = icmp slt i32 %r772, 32
  br i1 %r480, label %bb84, label %bb85

bb84:
  %r482 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r772
  %r811 = load i32, i32* %r482
  call void @putint(i32 %r811)
  %r812 = add i32 %r772, 1
  br label %bb83

bb85:
  %r773 = call i32 @bubblesort(i32* %r442)
  %r774 = add i32 0, 0
  br label %bb86

bb86:
  %r775 = phi i32 [ %r774, %bb85 ], [ %r810, %bb87 ]
  %r489 = icmp slt i32 %r775, 32
  br i1 %r489, label %bb87, label %bb88

bb87:
  %r491 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r775
  %r809 = load i32, i32* %r491
  call void @putint(i32 %r809)
  %r810 = add i32 %r775, 1
  br label %bb86

bb88:
  %r776 = call i32 @getMid(i32* %r442)
  call void @putint(i32 %r776)
  %r777 = call i32 @getMost(i32* %r442)
  call void @putint(i32 %r777)
  %r778 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r779 = call i32 @bubblesort(i32* %r442)
  %r780 = add i32 0, 0
  br label %bb89

bb89:
  %r781 = phi i32 [ %r780, %bb88 ], [ %r808, %bb90 ]
  %r503 = icmp slt i32 %r781, 32
  br i1 %r503, label %bb90, label %bb91

bb90:
  %r505 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r781
  %r807 = load i32, i32* %r505
  call void @putint(i32 %r807)
  %r808 = add i32 %r781, 1
  br label %bb89

bb91:
  %r782 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r783 = call i32 @insertsort(i32* %r442)
  %r784 = add i32 0, 0
  br label %bb92

bb92:
  %r785 = phi i32 [ %r784, %bb91 ], [ %r806, %bb93 ]
  %r513 = icmp slt i32 %r785, 32
  br i1 %r513, label %bb93, label %bb94

bb93:
  %r515 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r785
  %r805 = load i32, i32* %r515
  call void @putint(i32 %r805)
  %r806 = add i32 %r785, 1
  br label %bb92

bb94:
  %r786 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r787 = add i32 0, 0
  %r788 = add i32 31, 0
  %r789 = call i32 @QuickSort(i32* %r442, i32 %r787, i32 %r788)
  br label %bb95

bb95:
  %r790 = phi i32 [ %r787, %bb94 ], [ %r804, %bb96 ]
  %r525 = icmp slt i32 %r790, 32
  br i1 %r525, label %bb96, label %bb97

bb96:
  %r527 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r790
  %r803 = load i32, i32* %r527
  call void @putint(i32 %r803)
  %r804 = add i32 %r790, 1
  br label %bb95

bb97:
  %r791 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r792 = call i32 @calSum(i32* %r442, i32 4)
  %r793 = add i32 0, 0
  br label %bb98

bb98:
  %r794 = phi i32 [ %r793, %bb97 ], [ %r802, %bb99 ]
  %r535 = icmp slt i32 %r794, 32
  br i1 %r535, label %bb99, label %bb100

bb99:
  %r537 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r794
  %r801 = load i32, i32* %r537
  call void @putint(i32 %r801)
  %r802 = add i32 %r794, 1
  br label %bb98

bb100:
  %r795 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r796 = call i32 @avgPooling(i32* %r442, i32 3)
  %r797 = add i32 0, 0
  br label %bb101

bb101:
  %r798 = phi i32 [ %r797, %bb100 ], [ %r800, %bb102 ]
  %r545 = icmp slt i32 %r798, 32
  br i1 %r545, label %bb102, label %bb103

bb102:
  %r547 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r798
  %r799 = load i32, i32* %r547
  call void @putint(i32 %r799)
  %r800 = add i32 %r798, 1
  br label %bb101

bb103:
  call void @_sysy_stoptime(i32 312)
  ret i32 0
}

