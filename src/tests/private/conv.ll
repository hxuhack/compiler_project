declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@max = global i32 1073741824
@a = global [ 10000000 x i32 ] zeroinitializer
@b = global [ 10000000 x i32 ] zeroinitializer
@kernelid = global [ 10000 x i32 ] zeroinitializer
define i32 @checkrange( i32 %r100 ) {
bb94:
  %r387 = add i32 0, 0
  %r388 = add i32 %r100, 0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %r389 = phi i32 [ %r388, %bb1 ], [ %r395, %bb3 ]
  %r390 = load i32, i32* @max
  %r104 = icmp sgt i32 %r389, %r390
  br i1 %r104, label %bb3, label %bb4

bb3:
  %r394 = load i32, i32* @max
  %r395 = sub i32 %r389, %r394
  br label %bb2

bb4:
  br label %bb5

bb5:
  %r391 = phi i32 [ %r389, %bb4 ], [ %r393, %bb6 ]
  %r109 = icmp slt i32 %r391, 0
  br i1 %r109, label %bb6, label %bb7

bb6:
  %r392 = load i32, i32* @max
  %r393 = add i32 %r391, %r392
  br label %bb5

bb7:
  ret i32 %r391
}

define i32 @mod( i32 %r114, i32 %r116 ) {
bb95:
  %r398 = add i32 0, 0
  %r399 = add i32 %r114, 0
  %r400 = add i32 0, 0
  %r401 = add i32 %r116, 0
  br label %bb8

bb8:
  %r402 = sdiv i32 %r399, %r401
  %r403 = mul i32 %r402, %r401
  %r404 = sub i32 %r399, %r403
  ret i32 %r404
}

define i32 @reduce( i32 %r125, i32 %r127, i32 %r129 ) {
bb96:
  %r414 = add i32 0, 0
  %r415 = add i32 0, 0
  %r416 = add i32 0, 0
  %r417 = add i32 0, 0
  %r418 = add i32 0, 0
  %r419 = add i32 0, 0
  %r420 = add i32 0, 0
  %r421 = add i32 %r125, 0
  %r422 = add i32 0, 0
  %r423 = add i32 %r127, 0
  %r424 = add i32 0, 0
  %r425 = add i32 %r129, 0
  br label %bb9

bb9:
  %r132 = icmp eq i32 %r421, 0
  br i1 %r132, label %bb10, label %bb11

bb10:
  %r468 = add i32 %r423, %r425
  %r469 = call i32 @checkrange(i32 %r468)
  ret i32 %r469
bb11:
  br label %bb12

bb12:
  %r138 = icmp eq i32 %r421, 1
  br i1 %r138, label %bb13, label %bb14

bb13:
  %r454 = add i32 0, 0
  %r455 = add i32 1, 0
  br label %bb16

bb16:
  %r456 = phi i32 [ %r455, %bb13 ], [ %r464, %bb21 ]
  %r457 = phi i32 [ %r454, %bb13 ], [ %r463, %bb21 ]
  %r458 = load i32, i32* @max
  %r143 = icmp slt i32 %r456, %r458
  br i1 %r143, label %bb17, label %bb18

bb17:
  %r459 = sdiv i32 %r423, %r456
  %r460 = call i32 @mod(i32 %r459, i32 2)
  %r461 = sdiv i32 %r425, %r456
  %r462 = call i32 @mod(i32 %r461, i32 2)
  %r152 = icmp eq i32 %r460, %r462
  br i1 %r152, label %bb19, label %bb20

bb19:
  %r467 = mul i32 %r457, 2
  br label %bb21

bb20:
  %r465 = mul i32 %r457, 2
  %r466 = add i32 %r465, 1
  br label %bb21

bb21:
  %r463 = phi i32 [ %r467, %bb19 ], [ %r466, %bb20 ]
  %r464 = mul i32 %r456, 2
  br label %bb16

bb18:
  ret i32 %r457
bb14:
  br label %bb15

bb15:
  %r162 = icmp eq i32 %r421, 2
  br i1 %r162, label %bb22, label %bb23

bb22:
  %r165 = icmp sgt i32 %r423, %r425
  br i1 %r165, label %bb25, label %bb26

bb25:
  ret i32 %r423
bb26:
  ret i32 %r425
bb23:
  br label %bb24

bb24:
  %r169 = icmp eq i32 %r421, 3
  br i1 %r169, label %bb28, label %bb29

bb28:
  %r440 = add i32 0, 0
  %r441 = add i32 1, 0
  br label %bb31

bb31:
  %r442 = phi i32 [ %r440, %bb28 ], [ %r447, %bb36 ]
  %r443 = phi i32 [ %r441, %bb28 ], [ %r448, %bb36 ]
  %r444 = load i32, i32* @max
  %r174 = icmp slt i32 %r443, %r444
  br i1 %r174, label %bb32, label %bb33

bb32:
  %r445 = sdiv i32 %r423, %r443
  %r446 = call i32 @mod(i32 %r445, i32 2)
  %r179 = icmp eq i32 %r446, 1
  br i1 %r179, label %bb34, label %bb37

bb37:
  %r451 = sdiv i32 %r425, %r443
  %r452 = call i32 @mod(i32 %r451, i32 2)
  %r184 = icmp eq i32 %r452, 1
  br i1 %r184, label %bb34, label %bb35

bb34:
  %r449 = mul i32 %r442, 2
  %r450 = add i32 %r449, 1
  br label %bb36

bb35:
  %r453 = mul i32 %r442, 2
  br label %bb36

bb36:
  %r447 = phi i32 [ %r450, %bb34 ], [ %r453, %bb35 ]
  %r448 = mul i32 %r443, 2
  br label %bb31

bb33:
  ret i32 %r442
bb29:
  br label %bb30

bb30:
  %r194 = icmp eq i32 %r421, 4
  br i1 %r194, label %bb38, label %bb39

bb38:
  %r426 = add i32 0, 0
  %r427 = add i32 1, 0
  br label %bb41

bb41:
  %r428 = phi i32 [ %r426, %bb38 ], [ %r433, %bb46 ]
  %r429 = phi i32 [ %r427, %bb38 ], [ %r434, %bb46 ]
  %r430 = load i32, i32* @max
  %r199 = icmp slt i32 %r429, %r430
  br i1 %r199, label %bb42, label %bb43

bb42:
  %r431 = sdiv i32 %r423, %r429
  %r432 = call i32 @mod(i32 %r431, i32 2)
  %r204 = icmp eq i32 %r432, 1
  br i1 %r204, label %bb47, label %bb45

bb47:
  %r436 = sdiv i32 %r425, %r429
  %r437 = call i32 @mod(i32 %r436, i32 2)
  %r209 = icmp eq i32 %r437, 1
  br i1 %r209, label %bb44, label %bb45

bb44:
  %r438 = mul i32 %r428, 2
  %r439 = add i32 %r438, 1
  br label %bb46

bb45:
  %r435 = mul i32 %r428, 2
  br label %bb46

bb46:
  %r433 = phi i32 [ %r439, %bb44 ], [ %r435, %bb45 ]
  %r434 = mul i32 %r429, 2
  br label %bb41

bb43:
  ret i32 %r428
bb39:
  br label %bb40

bb40:
  ret i32 0
}

define i32 @getvalue( i32* %r218, i32 %r219, i32 %r221, i32 %r223, i32 %r225 ) {
bb103:
  %r475 = add i32 0, 0
  %r476 = add i32 0, 0
  %r477 = add i32 %r219, 0
  %r478 = add i32 0, 0
  %r479 = add i32 %r221, 0
  %r480 = add i32 0, 0
  %r481 = add i32 %r223, 0
  %r482 = add i32 0, 0
  %r483 = add i32 %r225, 0
  br label %bb48

bb48:
  %r228 = icmp slt i32 %r481, 0
  br i1 %r228, label %bb49, label %bb54

bb54:
  %r230 = icmp slt i32 %r483, 0
  br i1 %r230, label %bb49, label %bb53

bb53:
  %r233 = icmp sge i32 %r481, %r477
  br i1 %r233, label %bb49, label %bb52

bb52:
  %r236 = icmp sge i32 %r483, %r479
  br i1 %r236, label %bb49, label %bb50

bb49:
  ret i32 0
bb50:
  br label %bb51

bb51:
  %r484 = mul i32 %r481, %r479
  %r485 = add i32 %r484, %r483
  %r244 = getelementptr i32, i32* %r218, i32 %r485
  %r486 = load i32, i32* %r244
  ret i32 %r486
}

define i32 @convn( i32 %r246, i32* %r248, i32* %r249, i32 %r250, i32 %r252, i32 %r254 ) {
bb105:
  %r498 = add i32 0, 0
  %r499 = add i32 0, 0
  %r500 = add i32 0, 0
  %r501 = add i32 0, 0
  %r502 = add i32 0, 0
  %r503 = add i32 0, 0
  %r504 = add i32 0, 0
  %r505 = add i32 0, 0
  %r506 = add i32 %r246, 0
  %r507 = add i32 0, 0
  %r508 = add i32 %r250, 0
  %r509 = add i32 0, 0
  %r510 = add i32 %r252, 0
  %r511 = add i32 0, 0
  %r512 = add i32 %r254, 0
  br label %bb55

bb55:
  %r513 = add i32 0, 0
  %r514 = add i32 0, 0
  %r515 = add i32 1, 0
  br label %bb56

bb56:
  %r516 = phi i32 [ %r513, %bb55 ], [ %r519, %bb79 ]
  %r264 = icmp eq i32 %r515, %r515
  br i1 %r264, label %bb57, label %bb58

bb57:
  %r517 = add i32 0, 0
  br label %bb59

bb59:
  %r518 = phi i32 [ %r517, %bb57 ], [ %r528, %bb76 ]
  %r267 = icmp eq i32 %r515, %r515
  br i1 %r267, label %bb60, label %bb61

bb60:
  %r520 = add i32 0, 0
  %r521 = sdiv i32 %r512, 2
  %r522 = sub i32 %r516, %r521
  br label %bb62

bb62:
  %r523 = phi i32 [ %r522, %bb60 ], [ %r534, %bb73 ]
  %r524 = phi i32 [ %r520, %bb60 ], [ %r533, %bb73 ]
  %r274 = icmp eq i32 %r515, %r515
  br i1 %r274, label %bb63, label %bb64

bb63:
  %r529 = sdiv i32 %r512, 2
  %r530 = sub i32 %r518, %r529
  br label %bb65

bb65:
  %r531 = phi i32 [ %r524, %bb63 ], [ %r538, %bb70 ]
  %r532 = phi i32 [ %r530, %bb63 ], [ %r539, %bb70 ]
  %r281 = icmp eq i32 %r515, %r515
  br i1 %r281, label %bb66, label %bb67

bb66:
  %r537 = call i32 @getvalue(i32* %r248, i32 %r508, i32 %r510, i32 %r523, i32 %r532)
  %r538 = call i32 @reduce(i32 %r506, i32 %r531, i32 %r537)
  %r539 = add i32 %r532, 1
  %r540 = sdiv i32 %r512, 2
  %r541 = add i32 %r518, %r540
  %r297 = icmp sge i32 %r539, %r541
  br i1 %r297, label %bb68, label %bb69

bb68:
  br label %bb67

bb69:
  br label %bb70

bb70:
  br label %bb65

bb67:
  %r533 = phi i32 [ %r531, %bb65 ], [ %r538, %bb68 ]
  %r534 = add i32 %r523, 1
  %r535 = sdiv i32 %r512, 2
  %r536 = add i32 %r516, %r535
  %r305 = icmp sge i32 %r534, %r536
  br i1 %r305, label %bb71, label %bb72

bb71:
  br label %bb64

bb72:
  br label %bb73

bb73:
  br label %bb62

bb64:
  %r525 = phi i32 [ %r524, %bb62 ], [ %r533, %bb71 ]
  %r526 = mul i32 %r516, %r510
  %r527 = add i32 %r526, %r518
  %r314 = getelementptr i32, i32* %r249, i32 %r527
  store i32 %r525, i32* %r314
  %r528 = add i32 %r518, 1
  %r319 = icmp sge i32 %r528, %r510
  br i1 %r319, label %bb74, label %bb75

bb74:
  br label %bb61

bb75:
  br label %bb76

bb76:
  br label %bb59

bb61:
  %r519 = add i32 %r516, 1
  %r324 = icmp sge i32 %r519, %r508
  br i1 %r324, label %bb77, label %bb78

bb77:
  br label %bb58

bb78:
  br label %bb79

bb79:
  br label %bb56

bb58:
  ret i32 0
}

define void @memmove( i32* %r325, i32* %r326, i32 %r327 ) {
bb110:
  %r544 = add i32 0, 0
  %r545 = add i32 0, 0
  %r546 = add i32 %r327, 0
  br label %bb80

bb80:
  %r547 = add i32 0, 0
  br label %bb81

bb81:
  %r548 = phi i32 [ %r547, %bb80 ], [ %r550, %bb82 ]
  %r332 = icmp slt i32 %r548, %r546
  br i1 %r332, label %bb82, label %bb83

bb82:
  %r334 = getelementptr i32, i32* %r326, i32 %r548
  %r549 = load i32, i32* %r334
  %r337 = getelementptr i32, i32* %r325, i32 %r548
  store i32 %r549, i32* %r337
  %r550 = add i32 %r548, 1
  br label %bb81

bb83:
  ret void
}

define i32 @main( ) {
bb84:
  %r558 = add i32 0, 0
  %r559 = add i32 0, 0
  %r560 = add i32 0, 0
  %r561 = call i32 @getint()
  %r562 = add i32 0, 0
  %r563 = call i32 @getint()
  %r564 = add i32 0, 0
  %r565 = call i32 @getint()
  %r566 = add i32 0, 0
  %r567 = call i32 @getint()
  %r568 = add i32 0, 0
  %r569 = add i32 0, 0
  br label %bb85

bb85:
  %r570 = phi i32 [ %r569, %bb84 ], [ %r584, %bb86 ]
  %r351 = icmp slt i32 %r570, %r567
  br i1 %r351, label %bb86, label %bb87

bb86:
  %r583 = call i32 @getint()
  %r354 = getelementptr [10000000 x i32 ], [10000000 x i32 ]* @a, i32 0, i32 %r570
  store i32 %r583, i32* %r354
  %r584 = add i32 %r570, 1
  br label %bb85

bb87:
  %r571 = call i32 @getint()
  %r572 = add i32 0, 0
  br label %bb88

bb88:
  %r573 = phi i32 [ %r572, %bb87 ], [ %r582, %bb89 ]
  %r360 = icmp slt i32 %r573, %r571
  br i1 %r360, label %bb89, label %bb90

bb89:
  %r581 = call i32 @getint()
  %r363 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r573
  store i32 %r581, i32* %r363
  %r582 = add i32 %r573, 1
  br label %bb88

bb90:
  %r574 = add i32 %r571, 0
  call void @_sysy_starttime(i32 209)
  %r575 = add i32 0, 0
  br label %bb91

bb91:
  %r576 = phi i32 [ %r575, %bb90 ], [ %r580, %bb92 ]
  %r371 = icmp slt i32 %r576, %r574
  br i1 %r371, label %bb92, label %bb93

bb92:
  %r373 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r576
  %r578 = load i32, i32* %r373
  call void @convn(i32 %r578, i32* @a, i32* @b, i32 %r563, i32 %r565, i32 %r561)
  %r579 = mul i32 %r563, %r565
  call void @memmove(i32* @a, i32* @b, i32 %r579)
  %r580 = add i32 %r576, 1
  br label %bb91

bb93:
  call void @_sysy_stoptime(i32 312)
  %r577 = mul i32 %r563, %r565
  call void @putarray(i32 %r577, i32* @a)
  ret i32 0
}

