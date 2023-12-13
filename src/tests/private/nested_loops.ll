declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
%my_struct_1 = type { [7 x i32 ] }
%my_struct_2 = type { [8 x %my_struct_1 ] }
%my_struct_3 = type { [5 x %my_struct_2 ] }
%my_struct_4 = type { [4 x %my_struct_3 ] }
%my_struct_5 = type { [3 x %my_struct_4 ] }
%my_struct_6 = type { [2 x %my_struct_5 ] }
@arr1 = global [ 10 x %my_struct_6 ] zeroinitializer
@arr2 = global [ 10 x %my_struct_6 ] zeroinitializer
define i32 @loop1( i32 %r100, i32 %r102 ) {
bb90:
  %r401 = add i32 0, 0
  %r402 = add i32 0, 0
  %r403 = add i32 0, 0
  %r404 = add i32 0, 0
  %r405 = add i32 0, 0
  %r406 = add i32 0, 0
  %r407 = add i32 0, 0
  %r408 = add i32 0, 0
  %r409 = add i32 %r100, 0
  %r410 = add i32 0, 0
  %r411 = add i32 %r102, 0
  br label %bb1

bb1:
  %r412 = add i32 0, 0
  br label %bb2

bb2:
  %r413 = phi i32 [ %r412, %bb1 ], [ %r416, %bb8 ]
  %r113 = icmp slt i32 %r413, %r409
  br i1 %r113, label %bb5, label %bb4

bb5:
  %r116 = icmp slt i32 %r413, %r411
  br i1 %r116, label %bb3, label %bb4

bb3:
  %r414 = add i32 0, 0
  br label %bb6

bb6:
  %r415 = phi i32 [ %r414, %bb3 ], [ %r419, %bb11 ]
  %r118 = icmp slt i32 %r415, 2
  br i1 %r118, label %bb7, label %bb8

bb7:
  %r417 = add i32 0, 0
  br label %bb9

bb9:
  %r418 = phi i32 [ %r417, %bb7 ], [ %r422, %bb14 ]
  %r120 = icmp slt i32 %r418, 3
  br i1 %r120, label %bb10, label %bb11

bb10:
  %r420 = add i32 0, 0
  br label %bb12

bb12:
  %r421 = phi i32 [ %r420, %bb10 ], [ %r425, %bb17 ]
  %r122 = icmp slt i32 %r421, 4
  br i1 %r122, label %bb13, label %bb14

bb13:
  %r423 = add i32 0, 0
  br label %bb15

bb15:
  %r424 = phi i32 [ %r423, %bb13 ], [ %r428, %bb20 ]
  %r124 = icmp slt i32 %r424, 5
  br i1 %r124, label %bb16, label %bb17

bb16:
  %r426 = add i32 0, 0
  br label %bb18

bb18:
  %r427 = phi i32 [ %r426, %bb16 ], [ %r431, %bb23 ]
  %r126 = icmp slt i32 %r427, 6
  br i1 %r126, label %bb19, label %bb20

bb19:
  %r429 = add i32 0, 0
  br label %bb21

bb21:
  %r430 = phi i32 [ %r429, %bb19 ], [ %r440, %bb22 ]
  %r128 = icmp slt i32 %r430, 2
  br i1 %r128, label %bb22, label %bb23

bb22:
  %r432 = add i32 %r413, %r415
  %r433 = add i32 %r432, %r418
  %r434 = add i32 %r433, %r421
  %r435 = add i32 %r434, %r424
  %r436 = add i32 %r435, %r427
  %r437 = add i32 %r436, %r430
  %r438 = add i32 %r437, %r409
  %r439 = add i32 %r438, %r411
  %r147 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r413
  %r148 = getelementptr %my_struct_6, %my_struct_6* %r147, i32 0, i32 0
  %r150 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r148, i32 0, i32 %r415
  %r151 = getelementptr %my_struct_5, %my_struct_5* %r150, i32 0, i32 0
  %r153 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r151, i32 0, i32 %r418
  %r154 = getelementptr %my_struct_4, %my_struct_4* %r153, i32 0, i32 0
  %r156 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r154, i32 0, i32 %r421
  %r157 = getelementptr %my_struct_3, %my_struct_3* %r156, i32 0, i32 0
  %r159 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r157, i32 0, i32 %r424
  %r160 = getelementptr %my_struct_2, %my_struct_2* %r159, i32 0, i32 0
  %r162 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r160, i32 0, i32 %r427
  %r163 = getelementptr %my_struct_1, %my_struct_1* %r162, i32 0, i32 0
  %r165 = getelementptr [7 x i32 ], [7 x i32 ]* %r163, i32 0, i32 %r430
  store i32 %r439, i32* %r165
  %r440 = add i32 %r430, 1
  br label %bb21

bb23:
  %r431 = add i32 %r427, 1
  br label %bb18

bb20:
  %r428 = add i32 %r424, 1
  br label %bb15

bb17:
  %r425 = add i32 %r421, 1
  br label %bb12

bb14:
  %r422 = add i32 %r418, 1
  br label %bb9

bb11:
  %r419 = add i32 %r415, 1
  br label %bb6

bb8:
  %r416 = add i32 %r413, 1
  br label %bb2

bb4:
  ret i32 0
}

define i32 @loop2( ) {
bb24:
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  %r450 = add i32 0, 0
  %r451 = add i32 0, 0
  %r452 = add i32 0, 0
  %r453 = add i32 0, 0
  %r454 = add i32 0, 0
  %r455 = add i32 0, 0
  br label %bb25

bb25:
  %r456 = phi i32 [ %r455, %bb24 ], [ %r459, %bb30 ]
  %r188 = icmp slt i32 %r456, 10
  br i1 %r188, label %bb26, label %bb27

bb26:
  %r457 = add i32 0, 0
  br label %bb28

bb28:
  %r458 = phi i32 [ %r457, %bb26 ], [ %r462, %bb33 ]
  %r190 = icmp slt i32 %r458, 2
  br i1 %r190, label %bb29, label %bb30

bb29:
  %r460 = add i32 0, 0
  br label %bb31

bb31:
  %r461 = phi i32 [ %r460, %bb29 ], [ %r465, %bb36 ]
  %r192 = icmp slt i32 %r461, 3
  br i1 %r192, label %bb32, label %bb33

bb32:
  %r463 = add i32 0, 0
  br label %bb34

bb34:
  %r464 = phi i32 [ %r463, %bb32 ], [ %r468, %bb39 ]
  %r194 = icmp slt i32 %r464, 2
  br i1 %r194, label %bb35, label %bb36

bb35:
  %r466 = add i32 0, 0
  br label %bb37

bb37:
  %r467 = phi i32 [ %r466, %bb35 ], [ %r471, %bb42 ]
  %r196 = icmp slt i32 %r467, 4
  br i1 %r196, label %bb38, label %bb39

bb38:
  %r469 = add i32 0, 0
  br label %bb40

bb40:
  %r470 = phi i32 [ %r469, %bb38 ], [ %r474, %bb45 ]
  %r198 = icmp slt i32 %r470, 8
  br i1 %r198, label %bb41, label %bb42

bb41:
  %r472 = add i32 0, 0
  br label %bb43

bb43:
  %r473 = phi i32 [ %r472, %bb41 ], [ %r478, %bb44 ]
  %r200 = icmp slt i32 %r473, 7
  br i1 %r200, label %bb44, label %bb45

bb44:
  %r475 = add i32 %r456, %r458
  %r476 = add i32 %r475, %r464
  %r477 = add i32 %r476, %r473
  %r209 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r456
  %r210 = getelementptr %my_struct_6, %my_struct_6* %r209, i32 0, i32 0
  %r212 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r210, i32 0, i32 %r458
  %r213 = getelementptr %my_struct_5, %my_struct_5* %r212, i32 0, i32 0
  %r215 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r213, i32 0, i32 %r461
  %r216 = getelementptr %my_struct_4, %my_struct_4* %r215, i32 0, i32 0
  %r218 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r216, i32 0, i32 %r464
  %r219 = getelementptr %my_struct_3, %my_struct_3* %r218, i32 0, i32 0
  %r221 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r219, i32 0, i32 %r467
  %r222 = getelementptr %my_struct_2, %my_struct_2* %r221, i32 0, i32 0
  %r224 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r222, i32 0, i32 %r470
  %r225 = getelementptr %my_struct_1, %my_struct_1* %r224, i32 0, i32 0
  %r227 = getelementptr [7 x i32 ], [7 x i32 ]* %r225, i32 0, i32 %r473
  store i32 %r477, i32* %r227
  %r478 = add i32 %r473, 1
  br label %bb43

bb45:
  %r474 = add i32 %r470, 1
  br label %bb40

bb42:
  %r471 = add i32 %r467, 1
  br label %bb37

bb39:
  %r468 = add i32 %r464, 1
  br label %bb34

bb36:
  %r465 = add i32 %r461, 1
  br label %bb31

bb33:
  %r462 = add i32 %r458, 1
  br label %bb28

bb30:
  %r459 = add i32 %r456, 1
  br label %bb25

bb27:
  ret i32 0
}

define i32 @loop3( i32 %r242, i32 %r244, i32 %r246, i32 %r248, i32 %r250, i32 %r252, i32 %r254 ) {
bb91:
  %r494 = add i32 0, 0
  %r495 = add i32 0, 0
  %r496 = add i32 0, 0
  %r497 = add i32 0, 0
  %r498 = add i32 0, 0
  %r499 = add i32 0, 0
  %r500 = add i32 0, 0
  %r501 = add i32 0, 0
  %r502 = add i32 0, 0
  %r503 = add i32 %r242, 0
  %r504 = add i32 0, 0
  %r505 = add i32 %r244, 0
  %r506 = add i32 0, 0
  %r507 = add i32 %r246, 0
  %r508 = add i32 0, 0
  %r509 = add i32 %r248, 0
  %r510 = add i32 0, 0
  %r511 = add i32 %r250, 0
  %r512 = add i32 0, 0
  %r513 = add i32 %r252, 0
  %r514 = add i32 0, 0
  %r515 = add i32 %r254, 0
  br label %bb46

bb46:
  %r516 = add i32 0, 0
  %r517 = add i32 0, 0
  br label %bb47

bb47:
  %r518 = phi i32 [ %r517, %bb46 ], [ %r525, %bb88 ]
  %r519 = phi i32 [ %r516, %bb46 ], [ %r524, %bb88 ]
  %r265 = icmp slt i32 %r518, 10
  br i1 %r265, label %bb48, label %bb49

bb48:
  %r521 = add i32 0, 0
  br label %bb50

bb50:
  %r522 = phi i32 [ %r521, %bb48 ], [ %r530, %bb85 ]
  %r523 = phi i32 [ %r519, %bb48 ], [ %r529, %bb85 ]
  %r267 = icmp slt i32 %r522, 100
  br i1 %r267, label %bb51, label %bb52

bb51:
  %r526 = add i32 0, 0
  br label %bb53

bb53:
  %r527 = phi i32 [ %r526, %bb51 ], [ %r535, %bb82 ]
  %r528 = phi i32 [ %r523, %bb51 ], [ %r534, %bb82 ]
  %r269 = icmp slt i32 %r527, 1000
  br i1 %r269, label %bb54, label %bb55

bb54:
  %r531 = add i32 0, 0
  br label %bb56

bb56:
  %r532 = phi i32 [ %r528, %bb54 ], [ %r539, %bb79 ]
  %r533 = phi i32 [ %r531, %bb54 ], [ %r540, %bb79 ]
  %r271 = icmp slt i32 %r533, 10000
  br i1 %r271, label %bb57, label %bb58

bb57:
  %r536 = add i32 0, 0
  br label %bb59

bb59:
  %r537 = phi i32 [ %r532, %bb57 ], [ %r544, %bb76 ]
  %r538 = phi i32 [ %r536, %bb57 ], [ %r545, %bb76 ]
  %r273 = icmp slt i32 %r538, 100000
  br i1 %r273, label %bb60, label %bb61

bb60:
  %r541 = add i32 0, 0
  br label %bb62

bb62:
  %r542 = phi i32 [ %r541, %bb60 ], [ %r550, %bb73 ]
  %r543 = phi i32 [ %r537, %bb60 ], [ %r549, %bb73 ]
  %r275 = icmp slt i32 %r542, 1000000
  br i1 %r275, label %bb63, label %bb64

bb63:
  %r546 = add i32 0, 0
  br label %bb65

bb65:
  %r547 = phi i32 [ %r543, %bb63 ], [ %r557, %bb70 ]
  %r548 = phi i32 [ %r546, %bb63 ], [ %r558, %bb70 ]
  %r277 = icmp slt i32 %r548, 10000000
  br i1 %r277, label %bb66, label %bb67

bb66:
  %r551 = sdiv i32 %r547, 817
  %r552 = mul i32 %r551, 817
  %r553 = sub i32 %r547, %r552
  %r284 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r518
  %r285 = getelementptr %my_struct_6, %my_struct_6* %r284, i32 0, i32 0
  %r287 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r285, i32 0, i32 %r522
  %r288 = getelementptr %my_struct_5, %my_struct_5* %r287, i32 0, i32 0
  %r290 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r288, i32 0, i32 %r527
  %r291 = getelementptr %my_struct_4, %my_struct_4* %r290, i32 0, i32 0
  %r293 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r291, i32 0, i32 %r533
  %r294 = getelementptr %my_struct_3, %my_struct_3* %r293, i32 0, i32 0
  %r296 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r294, i32 0, i32 %r538
  %r297 = getelementptr %my_struct_2, %my_struct_2* %r296, i32 0, i32 0
  %r299 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r297, i32 0, i32 %r542
  %r300 = getelementptr %my_struct_1, %my_struct_1* %r299, i32 0, i32 0
  %r302 = getelementptr [7 x i32 ], [7 x i32 ]* %r300, i32 0, i32 %r548
  %r554 = load i32, i32* %r302
  %r555 = add i32 %r553, %r554
  %r306 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r518
  %r307 = getelementptr %my_struct_6, %my_struct_6* %r306, i32 0, i32 0
  %r309 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r307, i32 0, i32 %r522
  %r310 = getelementptr %my_struct_5, %my_struct_5* %r309, i32 0, i32 0
  %r312 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r310, i32 0, i32 %r527
  %r313 = getelementptr %my_struct_4, %my_struct_4* %r312, i32 0, i32 0
  %r315 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r313, i32 0, i32 %r533
  %r316 = getelementptr %my_struct_3, %my_struct_3* %r315, i32 0, i32 0
  %r318 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r316, i32 0, i32 %r538
  %r319 = getelementptr %my_struct_2, %my_struct_2* %r318, i32 0, i32 0
  %r321 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r319, i32 0, i32 %r542
  %r322 = getelementptr %my_struct_1, %my_struct_1* %r321, i32 0, i32 0
  %r324 = getelementptr [7 x i32 ], [7 x i32 ]* %r322, i32 0, i32 %r548
  %r556 = load i32, i32* %r324
  %r557 = add i32 %r555, %r556
  %r558 = add i32 %r548, 1
  %r331 = icmp sge i32 %r558, %r515
  br i1 %r331, label %bb68, label %bb69

bb68:
  br label %bb67

bb69:
  br label %bb70

bb70:
  br label %bb65

bb67:
  %r549 = phi i32 [ %r547, %bb65 ], [ %r557, %bb68 ]
  %r550 = add i32 %r542, 1
  %r336 = icmp sge i32 %r550, %r513
  br i1 %r336, label %bb71, label %bb72

bb71:
  br label %bb64

bb72:
  br label %bb73

bb73:
  br label %bb62

bb64:
  %r544 = phi i32 [ %r543, %bb62 ], [ %r549, %bb71 ]
  %r545 = add i32 %r538, 1
  %r341 = icmp sge i32 %r545, %r511
  br i1 %r341, label %bb74, label %bb75

bb74:
  br label %bb61

bb75:
  br label %bb76

bb76:
  br label %bb59

bb61:
  %r539 = phi i32 [ %r537, %bb59 ], [ %r544, %bb74 ]
  %r540 = add i32 %r533, 1
  %r346 = icmp sge i32 %r540, %r509
  br i1 %r346, label %bb77, label %bb78

bb77:
  br label %bb58

bb78:
  br label %bb79

bb79:
  br label %bb56

bb58:
  %r534 = phi i32 [ %r532, %bb56 ], [ %r539, %bb77 ]
  %r535 = add i32 %r527, 1
  %r351 = icmp sge i32 %r535, %r507
  br i1 %r351, label %bb80, label %bb81

bb80:
  br label %bb55

bb81:
  br label %bb82

bb82:
  br label %bb53

bb55:
  %r529 = phi i32 [ %r528, %bb53 ], [ %r534, %bb80 ]
  %r530 = add i32 %r522, 1
  %r356 = icmp sge i32 %r530, %r505
  br i1 %r356, label %bb83, label %bb84

bb83:
  br label %bb52

bb84:
  br label %bb85

bb85:
  br label %bb50

bb52:
  %r524 = phi i32 [ %r523, %bb50 ], [ %r529, %bb83 ]
  %r525 = add i32 %r518, 1
  %r361 = icmp sge i32 %r525, %r503
  br i1 %r361, label %bb86, label %bb87

bb86:
  br label %bb49

bb87:
  br label %bb88

bb88:
  br label %bb47

bb49:
  %r520 = phi i32 [ %r519, %bb47 ], [ %r524, %bb86 ]
  ret i32 %r520
}

define i32 @main( ) {
bb89:
  call void @_sysy_starttime(i32 97)
  %r568 = add i32 0, 0
  %r569 = call i32 @getint()
  %r570 = add i32 0, 0
  %r571 = call i32 @getint()
  %r572 = add i32 0, 0
  %r573 = call i32 @getint()
  %r574 = add i32 0, 0
  %r575 = call i32 @getint()
  %r576 = add i32 0, 0
  %r577 = call i32 @getint()
  %r578 = add i32 0, 0
  %r579 = call i32 @getint()
  %r580 = add i32 0, 0
  %r581 = call i32 @getint()
  %r582 = add i32 0, 0
  %r583 = call i32 @getint()
  %r584 = add i32 0, 0
  %r585 = call i32 @getint()
  call void @loop1(i32 %r569, i32 %r571)
  call void @loop2()
  %r586 = call i32 @loop3(i32 %r573, i32 %r575, i32 %r577, i32 %r579, i32 %r581, i32 %r583, i32 %r585)
  call void @_sysy_stoptime(i32 117)
  ret i32 %r586
}

