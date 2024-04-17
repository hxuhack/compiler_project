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
  %r386 = add i32 0, 0
  %r387 = add i32 %r100, 0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %r388 = phi i32 [ %r387, %bb1 ], [ %r391, %bb3 ]
  %r103 = load i32, i32* @max
  %r104 = icmp sgt i32 %r388, %r103
  br i1 %r104, label %bb3, label %bb4

bb3:
  %r106 = load i32, i32* @max
  %r391 = sub i32 %r388, %r106
  br label %bb2

bb4:
  br label %bb5

bb5:
  %r389 = phi i32 [ %r388, %bb4 ], [ %r390, %bb6 ]
  %r109 = icmp slt i32 %r389, 0
  br i1 %r109, label %bb6, label %bb7

bb6:
  %r111 = load i32, i32* @max
  %r390 = add i32 %r389, %r111
  br label %bb5

bb7:
  ret i32 %r389
}

define i32 @mod( i32 %r114, i32 %r116 ) {
bb95:
  %r392 = add i32 0, 0
  %r394 = add i32 %r114, 0
  %r393 = add i32 0, 0
  %r395 = add i32 %r116, 0
  br label %bb8

bb8:
  %r121 = sdiv i32 %r394, %r395
  %r123 = mul i32 %r121, %r395
  %r124 = sub i32 %r394, %r123
  ret i32 %r124
}

define i32 @reduce( i32 %r125, i32 %r127, i32 %r129 ) {
bb96:
  %r396 = add i32 0, 0
  %r397 = add i32 0, 0
  %r398 = add i32 0, 0
  %r399 = add i32 0, 0
  %r400 = add i32 0, 0
  %r401 = add i32 0, 0
  %r402 = add i32 0, 0
  %r405 = add i32 %r125, 0
  %r403 = add i32 0, 0
  %r406 = add i32 %r127, 0
  %r404 = add i32 0, 0
  %r407 = add i32 %r129, 0
  br label %bb9

bb9:
  %r132 = icmp eq i32 %r405, 0
  br i1 %r132, label %bb10, label %bb11

bb10:
  %r135 = add i32 %r406, %r407
  %r136 = call i32 @checkrange(i32 %r135)
  ret i32 %r136
bb11:
  br label %bb12

bb12:
  %r138 = icmp eq i32 %r405, 1
  br i1 %r138, label %bb13, label %bb14

bb13:
  %r424 = add i32 0, 0
  %r425 = add i32 1, 0
  br label %bb16

bb16:
  %r426 = phi i32 [ %r425, %bb13 ], [ %r429, %bb21 ]
  %r427 = phi i32 [ %r424, %bb13 ], [ %r428, %bb21 ]
  %r142 = load i32, i32* @max
  %r143 = icmp slt i32 %r426, %r142
  br i1 %r143, label %bb17, label %bb18

bb17:
  %r146 = sdiv i32 %r406, %r426
  %r147 = call i32 @mod(i32 %r146, i32 2)
  %r150 = sdiv i32 %r407, %r426
  %r151 = call i32 @mod(i32 %r150, i32 2)
  %r152 = icmp eq i32 %r147, %r151
  br i1 %r152, label %bb19, label %bb20

bb19:
  %r431 = mul i32 %r427, 2
  br label %bb21

bb20:
  %r156 = mul i32 %r427, 2
  %r430 = add i32 %r156, 1
  br label %bb21

bb21:
  %r428 = phi i32 [ %r431, %bb19 ], [ %r430, %bb20 ]
  %r429 = mul i32 %r426, 2
  br label %bb16

bb18:
  ret i32 %r427
bb14:
  br label %bb15

bb15:
  %r162 = icmp eq i32 %r405, 2
  br i1 %r162, label %bb22, label %bb23

bb22:
  %r165 = icmp sgt i32 %r406, %r407
  br i1 %r165, label %bb25, label %bb26

bb25:
  ret i32 %r406
bb26:
  ret i32 %r407
bb23:
  br label %bb24

bb24:
  %r169 = icmp eq i32 %r405, 3
  br i1 %r169, label %bb28, label %bb29

bb28:
  %r416 = add i32 0, 0
  %r417 = add i32 1, 0
  br label %bb31

bb31:
  %r418 = phi i32 [ %r416, %bb28 ], [ %r420, %bb36 ]
  %r419 = phi i32 [ %r417, %bb28 ], [ %r421, %bb36 ]
  %r173 = load i32, i32* @max
  %r174 = icmp slt i32 %r419, %r173
  br i1 %r174, label %bb32, label %bb33

bb32:
  %r177 = sdiv i32 %r406, %r419
  %r178 = call i32 @mod(i32 %r177, i32 2)
  %r179 = icmp eq i32 %r178, 1
  br i1 %r179, label %bb34, label %bb37

bb37:
  %r182 = sdiv i32 %r407, %r419
  %r183 = call i32 @mod(i32 %r182, i32 2)
  %r184 = icmp eq i32 %r183, 1
  br i1 %r184, label %bb34, label %bb35

bb34:
  %r186 = mul i32 %r418, 2
  %r422 = add i32 %r186, 1
  br label %bb36

bb35:
  %r423 = mul i32 %r418, 2
  br label %bb36

bb36:
  %r420 = phi i32 [ %r422, %bb34 ], [ %r423, %bb35 ]
  %r421 = mul i32 %r419, 2
  br label %bb31

bb33:
  ret i32 %r418
bb29:
  br label %bb30

bb30:
  %r194 = icmp eq i32 %r405, 4
  br i1 %r194, label %bb38, label %bb39

bb38:
  %r408 = add i32 0, 0
  %r409 = add i32 1, 0
  br label %bb41

bb41:
  %r410 = phi i32 [ %r409, %bb38 ], [ %r413, %bb46 ]
  %r411 = phi i32 [ %r408, %bb38 ], [ %r412, %bb46 ]
  %r198 = load i32, i32* @max
  %r199 = icmp slt i32 %r410, %r198
  br i1 %r199, label %bb42, label %bb43

bb42:
  %r202 = sdiv i32 %r406, %r410
  %r203 = call i32 @mod(i32 %r202, i32 2)
  %r204 = icmp eq i32 %r203, 1
  br i1 %r204, label %bb47, label %bb45

bb47:
  %r207 = sdiv i32 %r407, %r410
  %r208 = call i32 @mod(i32 %r207, i32 2)
  %r209 = icmp eq i32 %r208, 1
  br i1 %r209, label %bb44, label %bb45

bb44:
  %r211 = mul i32 %r411, 2
  %r415 = add i32 %r211, 1
  br label %bb46

bb45:
  %r414 = mul i32 %r411, 2
  br label %bb46

bb46:
  %r412 = phi i32 [ %r415, %bb44 ], [ %r414, %bb45 ]
  %r413 = mul i32 %r410, 2
  br label %bb41

bb43:
  ret i32 %r411
bb39:
  br label %bb40

bb40:
  ret i32 0
}

define i32 @getvalue( i32* %r218, i32 %r219, i32 %r221, i32 %r223, i32 %r225 ) {
bb103:
  %r432 = add i32 0, 0
  %r433 = add i32 0, 0
  %r437 = add i32 %r219, 0
  %r434 = add i32 0, 0
  %r438 = add i32 %r221, 0
  %r435 = add i32 0, 0
  %r439 = add i32 %r223, 0
  %r436 = add i32 0, 0
  %r440 = add i32 %r225, 0
  br label %bb48

bb48:
  %r228 = icmp slt i32 %r439, 0
  br i1 %r228, label %bb49, label %bb54

bb54:
  %r230 = icmp slt i32 %r440, 0
  br i1 %r230, label %bb49, label %bb53

bb53:
  %r233 = icmp sge i32 %r439, %r437
  br i1 %r233, label %bb49, label %bb52

bb52:
  %r236 = icmp sge i32 %r440, %r438
  br i1 %r236, label %bb49, label %bb50

bb49:
  ret i32 0
bb50:
  br label %bb51

bb51:
  %r240 = mul i32 %r439, %r438
  %r441 = add i32 %r240, %r440
  %r244 = getelementptr i32, i32* %r218, i32 %r441
  %r245 = load i32, i32* %r244
  ret i32 %r245
}

define i32 @convn( i32 %r246, i32* %r248, i32* %r249, i32 %r250, i32 %r252, i32 %r254 ) {
bb105:
  %r442 = add i32 0, 0
  %r443 = add i32 0, 0
  %r444 = add i32 0, 0
  %r445 = add i32 0, 0
  %r446 = add i32 0, 0
  %r447 = add i32 0, 0
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  %r453 = add i32 %r246, 0
  %r450 = add i32 0, 0
  %r454 = add i32 %r250, 0
  %r451 = add i32 0, 0
  %r455 = add i32 %r252, 0
  %r452 = add i32 0, 0
  %r456 = add i32 %r254, 0
  br label %bb55

bb55:
  %r457 = add i32 0, 0
  %r458 = add i32 0, 0
  %r459 = add i32 1, 0
  br label %bb56

bb56:
  %r460 = phi i32 [ %r457, %bb55 ], [ %r463, %bb79 ]
  %r264 = icmp eq i32 %r459, %r459
  br i1 %r264, label %bb57, label %bb58

bb57:
  %r461 = add i32 0, 0
  br label %bb59

bb59:
  %r462 = phi i32 [ %r461, %bb57 ], [ %r470, %bb76 ]
  %r267 = icmp eq i32 %r459, %r459
  br i1 %r267, label %bb60, label %bb61

bb60:
  %r464 = add i32 0, 0
  %r270 = sdiv i32 %r456, 2
  %r465 = sub i32 %r460, %r270
  br label %bb62

bb62:
  %r466 = phi i32 [ %r464, %bb60 ], [ %r474, %bb73 ]
  %r467 = phi i32 [ %r465, %bb60 ], [ %r475, %bb73 ]
  %r274 = icmp eq i32 %r459, %r459
  br i1 %r274, label %bb63, label %bb64

bb63:
  %r277 = sdiv i32 %r456, 2
  %r471 = sub i32 %r462, %r277
  br label %bb65

bb65:
  %r472 = phi i32 [ %r466, %bb63 ], [ %r476, %bb70 ]
  %r473 = phi i32 [ %r471, %bb63 ], [ %r477, %bb70 ]
  %r281 = icmp eq i32 %r459, %r459
  br i1 %r281, label %bb66, label %bb67

bb66:
  %r288 = call i32 @getvalue(i32* %r248, i32 %r454, i32 %r455, i32 %r467, i32 %r473)
  %r476 = call i32 @reduce(i32 %r453, i32 %r472, i32 %r288)
  %r477 = add i32 %r473, 1
  %r295 = sdiv i32 %r456, 2
  %r296 = add i32 %r462, %r295
  %r297 = icmp sge i32 %r477, %r296
  br i1 %r297, label %bb68, label %bb69

bb68:
  br label %bb67

bb69:
  br label %bb70

bb70:
  br label %bb65

bb67:
  %r474 = phi i32 [ %r472, %bb65 ], [ %r476, %bb68 ]
  %r475 = add i32 %r467, 1
  %r303 = sdiv i32 %r456, 2
  %r304 = add i32 %r460, %r303
  %r305 = icmp sge i32 %r475, %r304
  br i1 %r305, label %bb71, label %bb72

bb71:
  br label %bb64

bb72:
  br label %bb73

bb73:
  br label %bb62

bb64:
  %r468 = phi i32 [ %r466, %bb62 ], [ %r474, %bb71 ]
  %r309 = mul i32 %r460, %r455
  %r469 = add i32 %r309, %r462
  %r314 = getelementptr i32, i32* %r249, i32 %r469
  store i32 %r468, i32* %r314
  %r470 = add i32 %r462, 1
  %r319 = icmp sge i32 %r470, %r455
  br i1 %r319, label %bb74, label %bb75

bb74:
  br label %bb61

bb75:
  br label %bb76

bb76:
  br label %bb59

bb61:
  %r463 = add i32 %r460, 1
  %r324 = icmp sge i32 %r463, %r454
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
  %r478 = add i32 0, 0
  %r479 = add i32 0, 0
  %r480 = add i32 %r327, 0
  br label %bb80

bb80:
  %r481 = add i32 0, 0
  br label %bb81

bb81:
  %r482 = phi i32 [ %r481, %bb80 ], [ %r483, %bb82 ]
  %r332 = icmp slt i32 %r482, %r480
  br i1 %r332, label %bb82, label %bb83

bb82:
  %r334 = getelementptr i32, i32* %r326, i32 %r482
  %r335 = load i32, i32* %r334
  %r337 = getelementptr i32, i32* %r325, i32 %r482
  store i32 %r335, i32* %r337
  %r483 = add i32 %r482, 1
  br label %bb81

bb83:
  ret void
}

define i32 @main( ) {
bb84:
  %r484 = add i32 0, 0
  %r485 = add i32 0, 0
  %r486 = add i32 0, 0
  %r491 = call i32 @getint()
  %r487 = add i32 0, 0
  %r492 = call i32 @getint()
  %r488 = add i32 0, 0
  %r493 = call i32 @getint()
  %r489 = add i32 0, 0
  %r494 = call i32 @getint()
  %r490 = add i32 0, 0
  %r495 = add i32 0, 0
  br label %bb85

bb85:
  %r496 = phi i32 [ %r495, %bb84 ], [ %r505, %bb86 ]
  %r351 = icmp slt i32 %r496, %r494
  br i1 %r351, label %bb86, label %bb87

bb86:
  %r352 = call i32 @getint()
  %r354 = getelementptr [10000000 x i32 ], [10000000 x i32 ]* @a, i32 0, i32 %r496
  store i32 %r352, i32* %r354
  %r505 = add i32 %r496, 1
  br label %bb85

bb87:
  %r497 = call i32 @getint()
  %r498 = add i32 0, 0
  br label %bb88

bb88:
  %r499 = phi i32 [ %r498, %bb87 ], [ %r504, %bb89 ]
  %r360 = icmp slt i32 %r499, %r497
  br i1 %r360, label %bb89, label %bb90

bb89:
  %r361 = call i32 @getint()
  %r363 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r499
  store i32 %r361, i32* %r363
  %r504 = add i32 %r499, 1
  br label %bb88

bb90:
  %r500 = add i32 %r497, 0
  call void @_sysy_starttime(i32 209)
  %r501 = add i32 0, 0
  br label %bb91

bb91:
  %r502 = phi i32 [ %r501, %bb90 ], [ %r503, %bb92 ]
  %r371 = icmp slt i32 %r502, %r500
  br i1 %r371, label %bb92, label %bb93

bb92:
  %r373 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r502
  %r374 = load i32, i32* %r373
  call void @convn(i32 %r374, i32* @a, i32* @b, i32 %r492, i32 %r493, i32 %r491)
  %r380 = mul i32 %r492, %r493
  call void @memmove(i32* @a, i32* @b, i32 %r380)
  %r503 = add i32 %r502, 1
  br label %bb91

bb93:
  call void @_sysy_stoptime(i32 312)
  %r385 = mul i32 %r492, %r493
  call void @putarray(i32 %r385, i32* @a)
  ret i32 0
}

