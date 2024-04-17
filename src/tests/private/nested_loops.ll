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
  %r392 = add i32 0, 0
  %r393 = add i32 0, 0
  %r394 = add i32 0, 0
  %r395 = add i32 0, 0
  %r396 = add i32 0, 0
  %r397 = add i32 0, 0
  %r398 = add i32 0, 0
  %r399 = add i32 0, 0
  %r401 = add i32 %r100, 0
  %r400 = add i32 0, 0
  %r402 = add i32 %r102, 0
  br label %bb1

bb1:
  %r403 = add i32 0, 0
  br label %bb2

bb2:
  %r404 = phi i32 [ %r403, %bb1 ], [ %r407, %bb8 ]
  %r113 = icmp slt i32 %r404, %r401
  br i1 %r113, label %bb5, label %bb4

bb5:
  %r116 = icmp slt i32 %r404, %r402
  br i1 %r116, label %bb3, label %bb4

bb3:
  %r405 = add i32 0, 0
  br label %bb6

bb6:
  %r406 = phi i32 [ %r405, %bb3 ], [ %r410, %bb11 ]
  %r118 = icmp slt i32 %r406, 2
  br i1 %r118, label %bb7, label %bb8

bb7:
  %r408 = add i32 0, 0
  br label %bb9

bb9:
  %r409 = phi i32 [ %r408, %bb7 ], [ %r413, %bb14 ]
  %r120 = icmp slt i32 %r409, 3
  br i1 %r120, label %bb10, label %bb11

bb10:
  %r411 = add i32 0, 0
  br label %bb12

bb12:
  %r412 = phi i32 [ %r411, %bb10 ], [ %r416, %bb17 ]
  %r122 = icmp slt i32 %r412, 4
  br i1 %r122, label %bb13, label %bb14

bb13:
  %r414 = add i32 0, 0
  br label %bb15

bb15:
  %r415 = phi i32 [ %r414, %bb13 ], [ %r419, %bb20 ]
  %r124 = icmp slt i32 %r415, 5
  br i1 %r124, label %bb16, label %bb17

bb16:
  %r417 = add i32 0, 0
  br label %bb18

bb18:
  %r418 = phi i32 [ %r417, %bb16 ], [ %r422, %bb23 ]
  %r126 = icmp slt i32 %r418, 6
  br i1 %r126, label %bb19, label %bb20

bb19:
  %r420 = add i32 0, 0
  br label %bb21

bb21:
  %r421 = phi i32 [ %r420, %bb19 ], [ %r423, %bb22 ]
  %r128 = icmp slt i32 %r421, 2
  br i1 %r128, label %bb22, label %bb23

bb22:
  %r131 = add i32 %r404, %r406
  %r133 = add i32 %r131, %r409
  %r135 = add i32 %r133, %r412
  %r137 = add i32 %r135, %r415
  %r139 = add i32 %r137, %r418
  %r141 = add i32 %r139, %r421
  %r143 = add i32 %r141, %r401
  %r145 = add i32 %r143, %r402
  %r147 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r404
  %r148 = getelementptr %my_struct_6, %my_struct_6* %r147, i32 0, i32 0
  %r150 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r148, i32 0, i32 %r406
  %r151 = getelementptr %my_struct_5, %my_struct_5* %r150, i32 0, i32 0
  %r153 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r151, i32 0, i32 %r409
  %r154 = getelementptr %my_struct_4, %my_struct_4* %r153, i32 0, i32 0
  %r156 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r154, i32 0, i32 %r412
  %r157 = getelementptr %my_struct_3, %my_struct_3* %r156, i32 0, i32 0
  %r159 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r157, i32 0, i32 %r415
  %r160 = getelementptr %my_struct_2, %my_struct_2* %r159, i32 0, i32 0
  %r162 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r160, i32 0, i32 %r418
  %r163 = getelementptr %my_struct_1, %my_struct_1* %r162, i32 0, i32 0
  %r165 = getelementptr [7 x i32 ], [7 x i32 ]* %r163, i32 0, i32 %r421
  store i32 %r145, i32* %r165
  %r423 = add i32 %r421, 1
  br label %bb21

bb23:
  %r422 = add i32 %r418, 1
  br label %bb18

bb20:
  %r419 = add i32 %r415, 1
  br label %bb15

bb17:
  %r416 = add i32 %r412, 1
  br label %bb12

bb14:
  %r413 = add i32 %r409, 1
  br label %bb9

bb11:
  %r410 = add i32 %r406, 1
  br label %bb6

bb8:
  %r407 = add i32 %r404, 1
  br label %bb2

bb4:
  ret i32 0
}

define i32 @loop2( ) {
bb24:
  %r424 = add i32 0, 0
  %r425 = add i32 0, 0
  %r426 = add i32 0, 0
  %r427 = add i32 0, 0
  %r428 = add i32 0, 0
  %r429 = add i32 0, 0
  %r430 = add i32 0, 0
  %r431 = add i32 0, 0
  br label %bb25

bb25:
  %r432 = phi i32 [ %r431, %bb24 ], [ %r435, %bb30 ]
  %r188 = icmp slt i32 %r432, 10
  br i1 %r188, label %bb26, label %bb27

bb26:
  %r433 = add i32 0, 0
  br label %bb28

bb28:
  %r434 = phi i32 [ %r433, %bb26 ], [ %r438, %bb33 ]
  %r190 = icmp slt i32 %r434, 2
  br i1 %r190, label %bb29, label %bb30

bb29:
  %r436 = add i32 0, 0
  br label %bb31

bb31:
  %r437 = phi i32 [ %r436, %bb29 ], [ %r441, %bb36 ]
  %r192 = icmp slt i32 %r437, 3
  br i1 %r192, label %bb32, label %bb33

bb32:
  %r439 = add i32 0, 0
  br label %bb34

bb34:
  %r440 = phi i32 [ %r439, %bb32 ], [ %r444, %bb39 ]
  %r194 = icmp slt i32 %r440, 2
  br i1 %r194, label %bb35, label %bb36

bb35:
  %r442 = add i32 0, 0
  br label %bb37

bb37:
  %r443 = phi i32 [ %r442, %bb35 ], [ %r447, %bb42 ]
  %r196 = icmp slt i32 %r443, 4
  br i1 %r196, label %bb38, label %bb39

bb38:
  %r445 = add i32 0, 0
  br label %bb40

bb40:
  %r446 = phi i32 [ %r445, %bb38 ], [ %r450, %bb45 ]
  %r198 = icmp slt i32 %r446, 8
  br i1 %r198, label %bb41, label %bb42

bb41:
  %r448 = add i32 0, 0
  br label %bb43

bb43:
  %r449 = phi i32 [ %r448, %bb41 ], [ %r451, %bb44 ]
  %r200 = icmp slt i32 %r449, 7
  br i1 %r200, label %bb44, label %bb45

bb44:
  %r203 = add i32 %r432, %r434
  %r205 = add i32 %r203, %r440
  %r207 = add i32 %r205, %r449
  %r209 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r432
  %r210 = getelementptr %my_struct_6, %my_struct_6* %r209, i32 0, i32 0
  %r212 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r210, i32 0, i32 %r434
  %r213 = getelementptr %my_struct_5, %my_struct_5* %r212, i32 0, i32 0
  %r215 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r213, i32 0, i32 %r437
  %r216 = getelementptr %my_struct_4, %my_struct_4* %r215, i32 0, i32 0
  %r218 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r216, i32 0, i32 %r440
  %r219 = getelementptr %my_struct_3, %my_struct_3* %r218, i32 0, i32 0
  %r221 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r219, i32 0, i32 %r443
  %r222 = getelementptr %my_struct_2, %my_struct_2* %r221, i32 0, i32 0
  %r224 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r222, i32 0, i32 %r446
  %r225 = getelementptr %my_struct_1, %my_struct_1* %r224, i32 0, i32 0
  %r227 = getelementptr [7 x i32 ], [7 x i32 ]* %r225, i32 0, i32 %r449
  store i32 %r207, i32* %r227
  %r451 = add i32 %r449, 1
  br label %bb43

bb45:
  %r450 = add i32 %r446, 1
  br label %bb40

bb42:
  %r447 = add i32 %r443, 1
  br label %bb37

bb39:
  %r444 = add i32 %r440, 1
  br label %bb34

bb36:
  %r441 = add i32 %r437, 1
  br label %bb31

bb33:
  %r438 = add i32 %r434, 1
  br label %bb28

bb30:
  %r435 = add i32 %r432, 1
  br label %bb25

bb27:
  ret i32 0
}

define i32 @loop3( i32 %r242, i32 %r244, i32 %r246, i32 %r248, i32 %r250, i32 %r252, i32 %r254 ) {
bb91:
  %r452 = add i32 0, 0
  %r453 = add i32 0, 0
  %r454 = add i32 0, 0
  %r455 = add i32 0, 0
  %r456 = add i32 0, 0
  %r457 = add i32 0, 0
  %r458 = add i32 0, 0
  %r459 = add i32 0, 0
  %r460 = add i32 0, 0
  %r467 = add i32 %r242, 0
  %r461 = add i32 0, 0
  %r468 = add i32 %r244, 0
  %r462 = add i32 0, 0
  %r469 = add i32 %r246, 0
  %r463 = add i32 0, 0
  %r470 = add i32 %r248, 0
  %r464 = add i32 0, 0
  %r471 = add i32 %r250, 0
  %r465 = add i32 0, 0
  %r472 = add i32 %r252, 0
  %r466 = add i32 0, 0
  %r473 = add i32 %r254, 0
  br label %bb46

bb46:
  %r474 = add i32 0, 0
  %r475 = add i32 0, 0
  br label %bb47

bb47:
  %r476 = phi i32 [ %r474, %bb46 ], [ %r482, %bb88 ]
  %r477 = phi i32 [ %r475, %bb46 ], [ %r483, %bb88 ]
  %r265 = icmp slt i32 %r477, 10
  br i1 %r265, label %bb48, label %bb49

bb48:
  %r479 = add i32 0, 0
  br label %bb50

bb50:
  %r480 = phi i32 [ %r476, %bb48 ], [ %r487, %bb85 ]
  %r481 = phi i32 [ %r479, %bb48 ], [ %r488, %bb85 ]
  %r267 = icmp slt i32 %r481, 100
  br i1 %r267, label %bb51, label %bb52

bb51:
  %r484 = add i32 0, 0
  br label %bb53

bb53:
  %r485 = phi i32 [ %r480, %bb51 ], [ %r492, %bb82 ]
  %r486 = phi i32 [ %r484, %bb51 ], [ %r493, %bb82 ]
  %r269 = icmp slt i32 %r486, 1000
  br i1 %r269, label %bb54, label %bb55

bb54:
  %r489 = add i32 0, 0
  br label %bb56

bb56:
  %r490 = phi i32 [ %r485, %bb54 ], [ %r497, %bb79 ]
  %r491 = phi i32 [ %r489, %bb54 ], [ %r498, %bb79 ]
  %r271 = icmp slt i32 %r491, 10000
  br i1 %r271, label %bb57, label %bb58

bb57:
  %r494 = add i32 0, 0
  br label %bb59

bb59:
  %r495 = phi i32 [ %r490, %bb57 ], [ %r502, %bb76 ]
  %r496 = phi i32 [ %r494, %bb57 ], [ %r503, %bb76 ]
  %r273 = icmp slt i32 %r496, 100000
  br i1 %r273, label %bb60, label %bb61

bb60:
  %r499 = add i32 0, 0
  br label %bb62

bb62:
  %r500 = phi i32 [ %r495, %bb60 ], [ %r507, %bb73 ]
  %r501 = phi i32 [ %r499, %bb60 ], [ %r508, %bb73 ]
  %r275 = icmp slt i32 %r501, 1000000
  br i1 %r275, label %bb63, label %bb64

bb63:
  %r504 = add i32 0, 0
  br label %bb65

bb65:
  %r505 = phi i32 [ %r500, %bb63 ], [ %r509, %bb70 ]
  %r506 = phi i32 [ %r504, %bb63 ], [ %r510, %bb70 ]
  %r277 = icmp slt i32 %r506, 10000000
  br i1 %r277, label %bb66, label %bb67

bb66:
  %r280 = sdiv i32 %r505, 817
  %r281 = mul i32 %r280, 817
  %r282 = sub i32 %r505, %r281
  %r284 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r477
  %r285 = getelementptr %my_struct_6, %my_struct_6* %r284, i32 0, i32 0
  %r287 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r285, i32 0, i32 %r481
  %r288 = getelementptr %my_struct_5, %my_struct_5* %r287, i32 0, i32 0
  %r290 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r288, i32 0, i32 %r486
  %r291 = getelementptr %my_struct_4, %my_struct_4* %r290, i32 0, i32 0
  %r293 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r291, i32 0, i32 %r491
  %r294 = getelementptr %my_struct_3, %my_struct_3* %r293, i32 0, i32 0
  %r296 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r294, i32 0, i32 %r496
  %r297 = getelementptr %my_struct_2, %my_struct_2* %r296, i32 0, i32 0
  %r299 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r297, i32 0, i32 %r501
  %r300 = getelementptr %my_struct_1, %my_struct_1* %r299, i32 0, i32 0
  %r302 = getelementptr [7 x i32 ], [7 x i32 ]* %r300, i32 0, i32 %r506
  %r303 = load i32, i32* %r302
  %r304 = add i32 %r282, %r303
  %r306 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r477
  %r307 = getelementptr %my_struct_6, %my_struct_6* %r306, i32 0, i32 0
  %r309 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r307, i32 0, i32 %r481
  %r310 = getelementptr %my_struct_5, %my_struct_5* %r309, i32 0, i32 0
  %r312 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r310, i32 0, i32 %r486
  %r313 = getelementptr %my_struct_4, %my_struct_4* %r312, i32 0, i32 0
  %r315 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r313, i32 0, i32 %r491
  %r316 = getelementptr %my_struct_3, %my_struct_3* %r315, i32 0, i32 0
  %r318 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r316, i32 0, i32 %r496
  %r319 = getelementptr %my_struct_2, %my_struct_2* %r318, i32 0, i32 0
  %r321 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r319, i32 0, i32 %r501
  %r322 = getelementptr %my_struct_1, %my_struct_1* %r321, i32 0, i32 0
  %r324 = getelementptr [7 x i32 ], [7 x i32 ]* %r322, i32 0, i32 %r506
  %r325 = load i32, i32* %r324
  %r509 = add i32 %r304, %r325
  %r510 = add i32 %r506, 1
  %r331 = icmp sge i32 %r510, %r473
  br i1 %r331, label %bb68, label %bb69

bb68:
  br label %bb67

bb69:
  br label %bb70

bb70:
  br label %bb65

bb67:
  %r507 = phi i32 [ %r505, %bb65 ], [ %r509, %bb68 ]
  %r508 = add i32 %r501, 1
  %r336 = icmp sge i32 %r508, %r472
  br i1 %r336, label %bb71, label %bb72

bb71:
  br label %bb64

bb72:
  br label %bb73

bb73:
  br label %bb62

bb64:
  %r502 = phi i32 [ %r500, %bb62 ], [ %r507, %bb71 ]
  %r503 = add i32 %r496, 1
  %r341 = icmp sge i32 %r503, %r471
  br i1 %r341, label %bb74, label %bb75

bb74:
  br label %bb61

bb75:
  br label %bb76

bb76:
  br label %bb59

bb61:
  %r497 = phi i32 [ %r495, %bb59 ], [ %r502, %bb74 ]
  %r498 = add i32 %r491, 1
  %r346 = icmp sge i32 %r498, %r470
  br i1 %r346, label %bb77, label %bb78

bb77:
  br label %bb58

bb78:
  br label %bb79

bb79:
  br label %bb56

bb58:
  %r492 = phi i32 [ %r490, %bb56 ], [ %r497, %bb77 ]
  %r493 = add i32 %r486, 1
  %r351 = icmp sge i32 %r493, %r469
  br i1 %r351, label %bb80, label %bb81

bb80:
  br label %bb55

bb81:
  br label %bb82

bb82:
  br label %bb53

bb55:
  %r487 = phi i32 [ %r485, %bb53 ], [ %r492, %bb80 ]
  %r488 = add i32 %r481, 1
  %r356 = icmp sge i32 %r488, %r468
  br i1 %r356, label %bb83, label %bb84

bb83:
  br label %bb52

bb84:
  br label %bb85

bb85:
  br label %bb50

bb52:
  %r482 = phi i32 [ %r480, %bb50 ], [ %r487, %bb83 ]
  %r483 = add i32 %r477, 1
  %r361 = icmp sge i32 %r483, %r467
  br i1 %r361, label %bb86, label %bb87

bb86:
  br label %bb49

bb87:
  br label %bb88

bb88:
  br label %bb47

bb49:
  %r478 = phi i32 [ %r476, %bb47 ], [ %r482, %bb86 ]
  ret i32 %r478
}

define i32 @main( ) {
bb89:
  call void @_sysy_starttime(i32 97)
  %r511 = add i32 0, 0
  %r520 = call i32 @getint()
  %r512 = add i32 0, 0
  %r521 = call i32 @getint()
  %r513 = add i32 0, 0
  %r522 = call i32 @getint()
  %r514 = add i32 0, 0
  %r523 = call i32 @getint()
  %r515 = add i32 0, 0
  %r524 = call i32 @getint()
  %r516 = add i32 0, 0
  %r525 = call i32 @getint()
  %r517 = add i32 0, 0
  %r526 = call i32 @getint()
  %r518 = add i32 0, 0
  %r527 = call i32 @getint()
  %r519 = add i32 0, 0
  %r528 = call i32 @getint()
  call void @loop1(i32 %r520, i32 %r521)
  call void @loop2()
  %r529 = call i32 @loop3(i32 %r522, i32 %r523, i32 %r524, i32 %r525, i32 %r526, i32 %r527, i32 %r528)
  call void @_sysy_stoptime(i32 117)
  ret i32 %r529
}

