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
  %r552 = add i32 0, 0
  %r553 = add i32 0, 0
  %r554 = add i32 0, 0
  %r555 = add i32 0, 0
  %r556 = add i32 0, 0
  %r557 = add i32 0, 0
  br label %bb2

bb2:
  %r558 = phi i32 [ %r557, %bb1 ], [ %r561, %bb7 ]
  %r104 = load i32, i32* @n
  %r105 = sub i32 %r104, 1
  %r106 = icmp slt i32 %r558, %r105
  br i1 %r106, label %bb3, label %bb4

bb3:
  %r559 = add i32 0, 0
  br label %bb5

bb5:
  %r560 = phi i32 [ %r559, %bb3 ], [ %r563, %bb10 ]
  %r108 = load i32, i32* @n
  %r110 = sub i32 %r108, %r558
  %r111 = sub i32 %r110, 1
  %r112 = icmp slt i32 %r560, %r111
  br i1 %r112, label %bb6, label %bb7

bb6:
  %r562 = add i32 %r560, 1
  %r117 = getelementptr i32, i32* %r100, i32 %r560
  %r118 = load i32, i32* %r117
  %r120 = getelementptr i32, i32* %r100, i32 %r562
  %r121 = load i32, i32* %r120
  %r122 = icmp sgt i32 %r118, %r121
  br i1 %r122, label %bb8, label %bb9

bb8:
  %r564 = add i32 %r560, 1
  %r128 = getelementptr i32, i32* %r100, i32 %r564
  %r565 = load i32, i32* %r128
  %r131 = getelementptr i32, i32* %r100, i32 %r560
  %r132 = load i32, i32* %r131
  %r134 = getelementptr i32, i32* %r100, i32 %r564
  store i32 %r132, i32* %r134
  %r137 = getelementptr i32, i32* %r100, i32 %r560
  store i32 %r565, i32* %r137
  br label %bb10

bb9:
  br label %bb10

bb10:
  %r563 = add i32 %r560, 1
  br label %bb5

bb7:
  %r561 = add i32 %r558, 1
  br label %bb2

bb4:
  ret i32 0
}

define i32 @insertsort( i32* %r142 ) {
bb11:
  %r566 = add i32 0, 0
  %r567 = add i32 0, 0
  %r568 = add i32 0, 0
  %r569 = add i32 0, 0
  %r570 = add i32 0, 0
  %r571 = add i32 1, 0
  br label %bb12

bb12:
  %r572 = phi i32 [ %r571, %bb11 ], [ %r577, %bb17 ]
  %r145 = load i32, i32* @n
  %r146 = icmp slt i32 %r572, %r145
  br i1 %r146, label %bb13, label %bb14

bb13:
  %r149 = getelementptr i32, i32* %r142, i32 %r572
  %r573 = load i32, i32* %r149
  %r574 = sub i32 %r572, 1
  br label %bb15

bb15:
  %r575 = phi i32 [ %r574, %bb13 ], [ %r579, %bb16 ]
  %r155 = sub i32 0, 1
  %r156 = icmp sgt i32 %r575, %r155
  br i1 %r156, label %bb18, label %bb17

bb18:
  %r159 = getelementptr i32, i32* %r142, i32 %r575
  %r160 = load i32, i32* %r159
  %r161 = icmp slt i32 %r573, %r160
  br i1 %r161, label %bb16, label %bb17

bb16:
  %r578 = add i32 %r575, 1
  %r166 = getelementptr i32, i32* %r142, i32 %r575
  %r167 = load i32, i32* %r166
  %r169 = getelementptr i32, i32* %r142, i32 %r578
  store i32 %r167, i32* %r169
  %r579 = sub i32 %r575, 1
  br label %bb15

bb17:
  %r576 = add i32 %r575, 1
  %r177 = getelementptr i32, i32* %r142, i32 %r576
  store i32 %r573, i32* %r177
  %r577 = add i32 %r572, 1
  br label %bb12

bb14:
  ret i32 0
}

define i32 @QuickSort( i32* %r180, i32 %r181, i32 %r183 ) {
bb104:
  %r580 = add i32 0, 0
  %r581 = add i32 0, 0
  %r582 = add i32 0, 0
  %r583 = add i32 0, 0
  %r584 = add i32 0, 0
  %r586 = add i32 %r181, 0
  %r585 = add i32 0, 0
  %r587 = add i32 %r183, 0
  br label %bb19

bb19:
  %r187 = icmp slt i32 %r586, %r587
  br i1 %r187, label %bb20, label %bb21

bb20:
  %r588 = add i32 %r586, 0
  %r589 = add i32 %r587, 0
  %r194 = getelementptr i32, i32* %r180, i32 %r586
  %r590 = load i32, i32* %r194
  br label %bb23

bb23:
  %r591 = phi i32 [ %r589, %bb20 ], [ %r600, %bb39 ]
  %r592 = phi i32 [ %r588, %bb20 ], [ %r599, %bb39 ]
  %r198 = icmp slt i32 %r592, %r591
  br i1 %r198, label %bb24, label %bb25

bb24:
  br label %bb26

bb26:
  %r597 = phi i32 [ %r591, %bb24 ], [ %r604, %bb27 ]
  %r201 = icmp slt i32 %r592, %r597
  br i1 %r201, label %bb29, label %bb28

bb29:
  %r203 = getelementptr i32, i32* %r180, i32 %r597
  %r204 = load i32, i32* %r203
  %r206 = sub i32 %r590, 1
  %r207 = icmp sgt i32 %r204, %r206
  br i1 %r207, label %bb27, label %bb28

bb27:
  %r604 = sub i32 %r597, 1
  br label %bb26

bb28:
  %r212 = icmp slt i32 %r592, %r597
  br i1 %r212, label %bb30, label %bb31

bb30:
  %r214 = getelementptr i32, i32* %r180, i32 %r597
  %r215 = load i32, i32* %r214
  %r217 = getelementptr i32, i32* %r180, i32 %r592
  store i32 %r215, i32* %r217
  %r603 = add i32 %r592, 1
  br label %bb32

bb31:
  br label %bb32

bb32:
  %r598 = phi i32 [ %r603, %bb30 ], [ %r592, %bb31 ]
  br label %bb33

bb33:
  %r599 = phi i32 [ %r598, %bb32 ], [ %r602, %bb34 ]
  %r222 = icmp slt i32 %r599, %r597
  br i1 %r222, label %bb36, label %bb35

bb36:
  %r224 = getelementptr i32, i32* %r180, i32 %r599
  %r225 = load i32, i32* %r224
  %r227 = icmp slt i32 %r225, %r590
  br i1 %r227, label %bb34, label %bb35

bb34:
  %r602 = add i32 %r599, 1
  br label %bb33

bb35:
  %r232 = icmp slt i32 %r599, %r597
  br i1 %r232, label %bb37, label %bb38

bb37:
  %r234 = getelementptr i32, i32* %r180, i32 %r599
  %r235 = load i32, i32* %r234
  %r237 = getelementptr i32, i32* %r180, i32 %r597
  store i32 %r235, i32* %r237
  %r601 = sub i32 %r597, 1
  br label %bb39

bb38:
  br label %bb39

bb39:
  %r600 = phi i32 [ %r601, %bb37 ], [ %r597, %bb38 ]
  br label %bb23

bb25:
  %r242 = getelementptr i32, i32* %r180, i32 %r592
  store i32 %r590, i32* %r242
  %r593 = sub i32 %r592, 1
  %r594 = call i32 @QuickSort(i32* %r180, i32 %r586, i32 %r593)
  %r595 = add i32 %r592, 1
  %r596 = call i32 @QuickSort(i32* %r180, i32 %r595, i32 %r587)
  br label %bb22

bb21:
  br label %bb22

bb22:
  ret i32 0
}

define i32 @getMid( i32* %r254 ) {
bb40:
  %r605 = add i32 0, 0
  %r606 = add i32 0, 0
  %r256 = load i32, i32* @n
  %r257 = sdiv i32 %r256, 2
  %r258 = mul i32 %r257, 2
  %r259 = load i32, i32* @n
  %r260 = icmp eq i32 %r258, %r259
  br i1 %r260, label %bb41, label %bb42

bb41:
  %r261 = load i32, i32* @n
  %r608 = sdiv i32 %r261, 2
  %r609 = sub i32 %r608, 1
  %r267 = getelementptr i32, i32* %r254, i32 %r608
  %r268 = load i32, i32* %r267
  %r270 = getelementptr i32, i32* %r254, i32 %r609
  %r271 = load i32, i32* %r270
  %r272 = add i32 %r268, %r271
  %r273 = sdiv i32 %r272, 2
  ret i32 %r273
bb42:
  %r274 = load i32, i32* @n
  %r607 = sdiv i32 %r274, 2
  %r277 = getelementptr i32, i32* %r254, i32 %r607
  %r278 = load i32, i32* %r277
  ret i32 %r278
}

define i32 @getMost( i32* %r279 ) {
bb44:
  %r610 = add i32 0, 0
  %r611 = add i32 0, 0
  %r612 = add i32 0, 0
  %r280 = alloca [ 1000 x i32 ]
  %r613 = add i32 0, 0
  %r614 = add i32 0, 0
  br label %bb45

bb45:
  %r615 = phi i32 [ %r614, %bb44 ], [ %r627, %bb46 ]
  %r283 = icmp slt i32 %r615, 1000
  br i1 %r283, label %bb46, label %bb47

bb46:
  %r285 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r615
  store i32 0, i32* %r285
  %r627 = add i32 %r615, 1
  br label %bb45

bb47:
  %r616 = add i32 0, 0
  %r617 = add i32 0, 0
  br label %bb48

bb48:
  %r618 = phi i32 [ %r616, %bb47 ], [ %r624, %bb53 ]
  %r619 = phi i32 [ %r611, %bb47 ], [ %r622, %bb53 ]
  %r620 = phi i32 [ %r617, %bb47 ], [ %r623, %bb53 ]
  %r291 = load i32, i32* @n
  %r292 = icmp slt i32 %r618, %r291
  br i1 %r292, label %bb49, label %bb50

bb49:
  %r295 = getelementptr i32, i32* %r279, i32 %r618
  %r621 = load i32, i32* %r295
  %r298 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r621
  %r299 = load i32, i32* %r298
  %r300 = add i32 %r299, 1
  %r302 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r621
  store i32 %r300, i32* %r302
  %r304 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r621
  %r305 = load i32, i32* %r304
  %r307 = icmp sgt i32 %r305, %r620
  br i1 %r307, label %bb51, label %bb52

bb51:
  %r309 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r280, i32 0, i32 %r621
  %r625 = load i32, i32* %r309
  %r626 = add i32 %r621, 0
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r622 = phi i32 [ %r626, %bb51 ], [ %r619, %bb52 ]
  %r623 = phi i32 [ %r625, %bb51 ], [ %r620, %bb52 ]
  %r624 = add i32 %r618, 1
  br label %bb48

bb50:
  ret i32 %r619
}

define i32 @revert( i32* %r315 ) {
bb54:
  %r628 = add i32 0, 0
  %r629 = add i32 0, 0
  %r630 = add i32 0, 0
  %r631 = add i32 0, 0
  %r632 = add i32 0, 0
  br label %bb55

bb55:
  %r633 = phi i32 [ %r632, %bb54 ], [ %r637, %bb56 ]
  %r634 = phi i32 [ %r631, %bb54 ], [ %r636, %bb56 ]
  %r321 = icmp slt i32 %r634, %r633
  br i1 %r321, label %bb56, label %bb57

bb56:
  %r323 = getelementptr i32, i32* %r315, i32 %r634
  %r635 = load i32, i32* %r323
  %r326 = getelementptr i32, i32* %r315, i32 %r633
  %r327 = load i32, i32* %r326
  %r329 = getelementptr i32, i32* %r315, i32 %r634
  store i32 %r327, i32* %r329
  %r332 = getelementptr i32, i32* %r315, i32 %r633
  store i32 %r635, i32* %r332
  %r636 = add i32 %r634, 1
  %r637 = sub i32 %r633, 1
  br label %bb55

bb57:
  ret i32 0
}

define i32 @arrCopy( i32* %r337, i32* %r338 ) {
bb58:
  %r638 = add i32 0, 0
  %r639 = add i32 0, 0
  br label %bb59

bb59:
  %r640 = phi i32 [ %r639, %bb58 ], [ %r641, %bb60 ]
  %r341 = load i32, i32* @n
  %r342 = icmp slt i32 %r640, %r341
  br i1 %r342, label %bb60, label %bb61

bb60:
  %r344 = getelementptr i32, i32* %r337, i32 %r640
  %r345 = load i32, i32* %r344
  %r347 = getelementptr i32, i32* %r338, i32 %r640
  store i32 %r345, i32* %r347
  %r641 = add i32 %r640, 1
  br label %bb59

bb61:
  ret i32 0
}

define i32 @calSum( i32* %r350, i32 %r351 ) {
bb107:
  %r642 = add i32 0, 0
  %r643 = add i32 0, 0
  %r644 = add i32 0, 0
  %r645 = add i32 %r351, 0
  br label %bb62

bb62:
  %r646 = add i32 0, 0
  %r647 = add i32 0, 0
  br label %bb63

bb63:
  %r648 = phi i32 [ %r646, %bb62 ], [ %r651, %bb68 ]
  %r649 = phi i32 [ %r647, %bb62 ], [ %r652, %bb68 ]
  %r356 = load i32, i32* @n
  %r357 = icmp slt i32 %r649, %r356
  br i1 %r357, label %bb64, label %bb65

bb64:
  %r360 = getelementptr i32, i32* %r350, i32 %r649
  %r361 = load i32, i32* %r360
  %r650 = add i32 %r648, %r361
  %r366 = sdiv i32 %r649, %r645
  %r368 = mul i32 %r366, %r645
  %r369 = sub i32 %r649, %r368
  %r371 = sub i32 %r645, 1
  %r372 = icmp ne i32 %r369, %r371
  br i1 %r372, label %bb66, label %bb67

bb66:
  %r374 = getelementptr i32, i32* %r350, i32 %r649
  store i32 0, i32* %r374
  br label %bb68

bb67:
  %r377 = getelementptr i32, i32* %r350, i32 %r649
  store i32 %r650, i32* %r377
  %r653 = add i32 0, 0
  br label %bb68

bb68:
  %r651 = phi i32 [ %r650, %bb66 ], [ %r653, %bb67 ]
  %r652 = add i32 %r649, 1
  br label %bb63

bb65:
  ret i32 0
}

define i32 @avgPooling( i32* %r380, i32 %r381 ) {
bb108:
  %r654 = add i32 0, 0
  %r655 = add i32 0, 0
  %r656 = add i32 0, 0
  %r657 = add i32 0, 0
  %r658 = add i32 0, 0
  %r659 = add i32 %r381, 0
  br label %bb69

bb69:
  %r660 = add i32 0, 0
  %r661 = add i32 0, 0
  br label %bb70

bb70:
  %r662 = phi i32 [ %r660, %bb69 ], [ %r670, %bb75 ]
  %r663 = phi i32 [ %r655, %bb69 ], [ %r668, %bb75 ]
  %r664 = phi i32 [ %r661, %bb69 ], [ %r669, %bb75 ]
  %r387 = load i32, i32* @n
  %r388 = icmp slt i32 %r662, %r387
  br i1 %r388, label %bb71, label %bb72

bb71:
  %r391 = sub i32 %r659, 1
  %r392 = icmp slt i32 %r662, %r391
  br i1 %r392, label %bb73, label %bb74

bb73:
  %r395 = getelementptr i32, i32* %r380, i32 %r662
  %r396 = load i32, i32* %r395
  %r677 = add i32 %r664, %r396
  br label %bb75

bb74:
  %r400 = sub i32 %r659, 1
  %r401 = icmp eq i32 %r662, %r400
  br i1 %r401, label %bb76, label %bb77

bb76:
  %r402 = getelementptr i32, i32* %r380, i32 0
  %r676 = load i32, i32* %r402
  %r406 = sdiv i32 %r664, %r659
  %r407 = getelementptr i32, i32* %r380, i32 0
  store i32 %r406, i32* %r407
  br label %bb78

bb77:
  %r410 = getelementptr i32, i32* %r380, i32 %r662
  %r411 = load i32, i32* %r410
  %r412 = add i32 %r664, %r411
  %r673 = sub i32 %r412, %r663
  %r418 = sub i32 %r662, %r659
  %r674 = add i32 %r418, 1
  %r421 = getelementptr i32, i32* %r380, i32 %r674
  %r675 = load i32, i32* %r421
  %r425 = sdiv i32 %r673, %r659
  %r427 = getelementptr i32, i32* %r380, i32 %r674
  store i32 %r425, i32* %r427
  br label %bb78

bb78:
  %r671 = phi i32 [ %r676, %bb76 ], [ %r675, %bb77 ]
  %r672 = phi i32 [ %r664, %bb76 ], [ %r673, %bb77 ]
  br label %bb75

bb75:
  %r668 = phi i32 [ %r663, %bb73 ], [ %r671, %bb78 ]
  %r669 = phi i32 [ %r677, %bb73 ], [ %r672, %bb78 ]
  %r670 = add i32 %r662, 1
  br label %bb70

bb72:
  %r430 = load i32, i32* @n
  %r432 = sub i32 %r430, %r659
  %r665 = add i32 %r432, 1
  br label %bb79

bb79:
  %r666 = phi i32 [ %r665, %bb72 ], [ %r667, %bb80 ]
  %r435 = load i32, i32* @n
  %r436 = icmp slt i32 %r666, %r435
  br i1 %r436, label %bb80, label %bb81

bb80:
  %r438 = getelementptr i32, i32* %r380, i32 %r666
  store i32 0, i32* %r438
  %r667 = add i32 %r666, 1
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
  %r678 = add i32 0, 0
  %r680 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r681 = call i32 @revert(i32* %r442)
  %r679 = add i32 0, 0
  %r682 = add i32 0, 0
  br label %bb83

bb83:
  %r683 = phi i32 [ %r682, %bb82 ], [ %r723, %bb84 ]
  %r480 = icmp slt i32 %r683, 32
  br i1 %r480, label %bb84, label %bb85

bb84:
  %r482 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r683
  %r722 = load i32, i32* %r482
  call void @putint(i32 %r722)
  %r723 = add i32 %r683, 1
  br label %bb83

bb85:
  %r684 = call i32 @bubblesort(i32* %r442)
  %r685 = add i32 0, 0
  br label %bb86

bb86:
  %r686 = phi i32 [ %r685, %bb85 ], [ %r721, %bb87 ]
  %r489 = icmp slt i32 %r686, 32
  br i1 %r489, label %bb87, label %bb88

bb87:
  %r491 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r686
  %r720 = load i32, i32* %r491
  call void @putint(i32 %r720)
  %r721 = add i32 %r686, 1
  br label %bb86

bb88:
  %r687 = call i32 @getMid(i32* %r442)
  call void @putint(i32 %r687)
  %r688 = call i32 @getMost(i32* %r442)
  call void @putint(i32 %r688)
  %r689 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r690 = call i32 @bubblesort(i32* %r442)
  %r691 = add i32 0, 0
  br label %bb89

bb89:
  %r692 = phi i32 [ %r691, %bb88 ], [ %r719, %bb90 ]
  %r503 = icmp slt i32 %r692, 32
  br i1 %r503, label %bb90, label %bb91

bb90:
  %r505 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r692
  %r718 = load i32, i32* %r505
  call void @putint(i32 %r718)
  %r719 = add i32 %r692, 1
  br label %bb89

bb91:
  %r693 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r694 = call i32 @insertsort(i32* %r442)
  %r695 = add i32 0, 0
  br label %bb92

bb92:
  %r696 = phi i32 [ %r695, %bb91 ], [ %r717, %bb93 ]
  %r513 = icmp slt i32 %r696, 32
  br i1 %r513, label %bb93, label %bb94

bb93:
  %r515 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r696
  %r716 = load i32, i32* %r515
  call void @putint(i32 %r716)
  %r717 = add i32 %r696, 1
  br label %bb92

bb94:
  %r697 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r698 = add i32 0, 0
  %r699 = add i32 31, 0
  %r700 = call i32 @QuickSort(i32* %r442, i32 %r698, i32 %r699)
  br label %bb95

bb95:
  %r701 = phi i32 [ %r698, %bb94 ], [ %r715, %bb96 ]
  %r525 = icmp slt i32 %r701, 32
  br i1 %r525, label %bb96, label %bb97

bb96:
  %r527 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r701
  %r714 = load i32, i32* %r527
  call void @putint(i32 %r714)
  %r715 = add i32 %r701, 1
  br label %bb95

bb97:
  %r702 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r703 = call i32 @calSum(i32* %r442, i32 4)
  %r704 = add i32 0, 0
  br label %bb98

bb98:
  %r705 = phi i32 [ %r704, %bb97 ], [ %r713, %bb99 ]
  %r535 = icmp slt i32 %r705, 32
  br i1 %r535, label %bb99, label %bb100

bb99:
  %r537 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r705
  %r712 = load i32, i32* %r537
  call void @putint(i32 %r712)
  %r713 = add i32 %r705, 1
  br label %bb98

bb100:
  %r706 = call i32 @arrCopy(i32* %r441, i32* %r442)
  %r707 = call i32 @avgPooling(i32* %r442, i32 3)
  %r708 = add i32 0, 0
  br label %bb101

bb101:
  %r709 = phi i32 [ %r708, %bb100 ], [ %r711, %bb102 ]
  %r545 = icmp slt i32 %r709, 32
  br i1 %r545, label %bb102, label %bb103

bb102:
  %r547 = getelementptr [32 x i32 ], [32 x i32 ]* %r442, i32 0, i32 %r709
  %r710 = load i32, i32* %r547
  call void @putint(i32 %r710)
  %r711 = add i32 %r709, 1
  br label %bb101

bb103:
  call void @_sysy_stoptime(i32 312)
  ret i32 0
}

