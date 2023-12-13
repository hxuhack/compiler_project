declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@base = global i32 16
@a = global [ 30000010 x i32 ] zeroinitializer
@ans = global i32 0
define i32 @getMaxNum( i32 %r100, i32* %r102 ) {
bb51:
  %r378 = add i32 0, 0
  %r379 = add i32 0, 0
  %r380 = add i32 0, 0
  %r381 = add i32 %r100, 0
  br label %bb1

bb1:
  %r382 = add i32 0, 0
  %r383 = add i32 0, 0
  br label %bb2

bb2:
  %r384 = phi i32 [ %r382, %bb1 ], [ %r387, %bb7 ]
  %r385 = phi i32 [ %r383, %bb1 ], [ %r388, %bb7 ]
  %r107 = icmp slt i32 %r385, %r381
  br i1 %r107, label %bb3, label %bb4

bb3:
  %r109 = getelementptr i32, i32* %r102, i32 %r385
  %r386 = load i32, i32* %r109
  %r112 = icmp sgt i32 %r386, %r384
  br i1 %r112, label %bb5, label %bb6

bb5:
  %r114 = getelementptr i32, i32* %r102, i32 %r385
  %r389 = load i32, i32* %r114
  br label %bb7

bb6:
  br label %bb7

bb7:
  %r387 = phi i32 [ %r389, %bb5 ], [ %r384, %bb6 ]
  %r388 = add i32 %r385, 1
  br label %bb2

bb4:
  ret i32 %r384
}

define i32 @getNumPos( i32 %r119, i32 %r121 ) {
bb52:
  %r394 = add i32 0, 0
  %r395 = add i32 0, 0
  %r396 = add i32 0, 0
  %r397 = add i32 %r119, 0
  %r398 = add i32 0, 0
  %r399 = add i32 %r121, 0
  br label %bb8

bb8:
  %r400 = add i32 1, 0
  %r401 = add i32 0, 0
  br label %bb9

bb9:
  %r402 = phi i32 [ %r397, %bb8 ], [ %r410, %bb10 ]
  %r403 = phi i32 [ %r401, %bb8 ], [ %r411, %bb10 ]
  %r127 = icmp slt i32 %r403, %r399
  br i1 %r127, label %bb10, label %bb11

bb10:
  %r409 = load i32, i32* @base
  %r410 = sdiv i32 %r402, %r409
  %r411 = add i32 %r403, 1
  br label %bb9

bb11:
  %r404 = load i32, i32* @base
  %r405 = sdiv i32 %r402, %r404
  %r406 = load i32, i32* @base
  %r407 = mul i32 %r405, %r406
  %r408 = sub i32 %r402, %r407
  ret i32 %r408
}

define void @radixSort( i32 %r140, i32* %r142, i32 %r143, i32 %r145 ) {
bb53:
  %r427 = add i32 0, 0
  %r428 = add i32 0, 0
  %r429 = add i32 0, 0
  %r430 = add i32 0, 0
  %r431 = add i32 0, 0
  %r432 = add i32 0, 0
  %r433 = add i32 0, 0
  %r434 = add i32 0, 0
  %r435 = add i32 0, 0
  %r436 = add i32 0, 0
  %r437 = add i32 0, 0
  %r438 = add i32 0, 0
  %r149 = alloca [ 16 x i32 ]
  %r148 = alloca [ 16 x i32 ]
  %r147 = alloca [ 16 x i32 ]
  %r439 = add i32 0, 0
  %r440 = add i32 %r140, 0
  %r441 = add i32 0, 0
  %r442 = add i32 %r143, 0
  %r443 = add i32 0, 0
  %r444 = add i32 %r145, 0
  br label %bb12

bb12:
  %r445 = add i32 0, 0
  br label %bb13

bb13:
  %r446 = phi i32 [ %r445, %bb12 ], [ %r508, %bb14 ]
  %r447 = load i32, i32* @base
  %r153 = icmp slt i32 %r446, %r447
  br i1 %r153, label %bb14, label %bb15

bb14:
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r446
  store i32 0, i32* %r155
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r446
  store i32 0, i32* %r157
  %r159 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r446
  store i32 0, i32* %r159
  %r508 = add i32 %r446, 1
  br label %bb13

bb15:
  %r448 = sub i32 0, 1
  %r164 = icmp eq i32 %r440, %r448
  br i1 %r164, label %bb16, label %bb19

bb19:
  %r449 = add i32 %r442, 1
  %r168 = icmp sge i32 %r449, %r444
  br i1 %r168, label %bb16, label %bb17

bb16:
  ret void
bb17:
  br label %bb18

bb18:
  %r450 = add i32 %r442, 0
  br label %bb20

bb20:
  %r451 = phi i32 [ %r450, %bb18 ], [ %r507, %bb21 ]
  %r173 = icmp slt i32 %r451, %r444
  br i1 %r173, label %bb21, label %bb22

bb21:
  %r176 = getelementptr i32, i32* %r142, i32 %r451
  %r501 = load i32, i32* %r176
  %r502 = call i32 @getNumPos(i32 %r501, i32 %r440)
  %r182 = getelementptr i32, i32* %r142, i32 %r451
  %r503 = load i32, i32* %r182
  %r504 = call i32 @getNumPos(i32 %r503, i32 %r440)
  %r187 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r502
  %r505 = load i32, i32* %r187
  %r506 = add i32 %r505, 1
  %r191 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r504
  store i32 %r506, i32* %r191
  %r507 = add i32 %r451, 1
  br label %bb20

bb22:
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 0
  store i32 %r442, i32* %r195
  %r197 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r452 = load i32, i32* %r197
  %r453 = add i32 %r442, %r452
  %r200 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r453, i32* %r200
  %r454 = add i32 1, 0
  br label %bb23

bb23:
  %r455 = phi i32 [ %r454, %bb22 ], [ %r500, %bb24 ]
  %r456 = load i32, i32* @base
  %r203 = icmp slt i32 %r455, %r456
  br i1 %r203, label %bb24, label %bb25

bb24:
  %r495 = sub i32 %r455, 1
  %r208 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r495
  %r496 = load i32, i32* %r208
  %r211 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r455
  store i32 %r496, i32* %r211
  %r213 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r455
  %r497 = load i32, i32* %r213
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r455
  %r498 = load i32, i32* %r216
  %r499 = add i32 %r497, %r498
  %r220 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r455
  store i32 %r499, i32* %r220
  %r500 = add i32 %r455, 1
  br label %bb23

bb25:
  %r457 = add i32 0, 0
  br label %bb26

bb26:
  %r458 = phi i32 [ %r457, %bb25 ], [ %r477, %bb31 ]
  %r459 = load i32, i32* @base
  %r225 = icmp slt i32 %r458, %r459
  br i1 %r225, label %bb27, label %bb28

bb27:
  br label %bb29

bb29:
  %r227 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r458
  %r475 = load i32, i32* %r227
  %r230 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r458
  %r476 = load i32, i32* %r230
  %r232 = icmp slt i32 %r475, %r476
  br i1 %r232, label %bb30, label %bb31

bb30:
  %r235 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r458
  %r478 = load i32, i32* %r235
  %r239 = getelementptr i32, i32* %r142, i32 %r478
  %r479 = load i32, i32* %r239
  br label %bb32

bb32:
  %r480 = phi i32 [ %r479, %bb30 ], [ %r488, %bb33 ]
  %r481 = call i32 @getNumPos(i32 %r480, i32 %r440)
  %r245 = icmp ne i32 %r481, %r458
  br i1 %r245, label %bb33, label %bb34

bb33:
  %r485 = add i32 %r480, 0
  %r486 = call i32 @getNumPos(i32 %r485, i32 %r440)
  %r253 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r486
  %r487 = load i32, i32* %r253
  %r256 = getelementptr i32, i32* %r142, i32 %r487
  %r488 = load i32, i32* %r256
  %r489 = call i32 @getNumPos(i32 %r485, i32 %r440)
  %r262 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r489
  %r490 = load i32, i32* %r262
  %r266 = getelementptr i32, i32* %r142, i32 %r490
  store i32 %r485, i32* %r266
  %r491 = call i32 @getNumPos(i32 %r485, i32 %r440)
  %r492 = call i32 @getNumPos(i32 %r485, i32 %r440)
  %r275 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r491
  %r493 = load i32, i32* %r275
  %r494 = add i32 %r493, 1
  %r279 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r492
  store i32 %r494, i32* %r279
  br label %bb32

bb34:
  %r282 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r458
  %r482 = load i32, i32* %r282
  %r286 = getelementptr i32, i32* %r142, i32 %r482
  store i32 %r480, i32* %r286
  %r288 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r458
  %r483 = load i32, i32* %r288
  %r484 = add i32 %r483, 1
  %r292 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r458
  store i32 %r484, i32* %r292
  br label %bb29

bb31:
  %r477 = add i32 %r458, 1
  br label %bb26

bb28:
  %r460 = add i32 %r442, 0
  %r297 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 0
  store i32 %r442, i32* %r297
  %r299 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r461 = load i32, i32* %r299
  %r462 = add i32 %r442, %r461
  %r302 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r462, i32* %r302
  %r463 = add i32 0, 0
  br label %bb35

bb35:
  %r464 = phi i32 [ %r463, %bb28 ], [ %r469, %bb40 ]
  %r465 = load i32, i32* @base
  %r305 = icmp slt i32 %r464, %r465
  br i1 %r305, label %bb36, label %bb37

bb36:
  %r307 = icmp sgt i32 %r464, 0
  br i1 %r307, label %bb38, label %bb39

bb38:
  %r470 = sub i32 %r464, 1
  %r312 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r470
  %r471 = load i32, i32* %r312
  %r315 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r464
  store i32 %r471, i32* %r315
  %r317 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r464
  %r472 = load i32, i32* %r317
  %r320 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r464
  %r473 = load i32, i32* %r320
  %r474 = add i32 %r472, %r473
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r464
  store i32 %r474, i32* %r324
  br label %bb40

bb39:
  br label %bb40

bb40:
  %r466 = sub i32 %r440, 1
  %r328 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r464
  %r467 = load i32, i32* %r328
  %r331 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r464
  %r468 = load i32, i32* %r331
  call void @radixSort(i32 %r466, i32* %r142, i32 %r467, i32 %r468)
  %r469 = add i32 %r464, 1
  br label %bb35

bb37:
  ret void
}

define i32 @main( ) {
bb41:
  %r512 = add i32 0, 0
  %r513 = add i32 0, 0
  %r514 = call i32 @getint()
  %r515 = add i32 0, 0
  %r516 = add i32 0, 0
  br label %bb42

bb42:
  %r517 = phi i32 [ %r516, %bb41 ], [ %r536, %bb43 ]
  %r340 = icmp slt i32 %r517, %r514
  br i1 %r340, label %bb43, label %bb44

bb43:
  %r535 = call i32 @getint()
  %r343 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r517
  store i32 %r535, i32* %r343
  %r536 = add i32 %r517, 1
  br label %bb42

bb44:
  call void @_sysy_starttime(i32 97)
  call void @radixSort(i32 8, i32* @a, i32 0, i32 %r514)
  %r518 = add i32 0, 0
  br label %bb45

bb45:
  %r519 = phi i32 [ %r518, %bb44 ], [ %r534, %bb46 ]
  %r350 = icmp slt i32 %r519, %r514
  br i1 %r350, label %bb46, label %bb47

bb46:
  %r524 = load i32, i32* @ans
  %r354 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r519
  %r525 = load i32, i32* %r354
  %r357 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r519
  %r526 = load i32, i32* %r357
  %r527 = add i32 2, %r519
  %r528 = sdiv i32 %r526, %r527
  %r529 = add i32 2, %r519
  %r530 = mul i32 %r528, %r529
  %r531 = sub i32 %r525, %r530
  %r532 = mul i32 %r519, %r531
  %r533 = add i32 %r524, %r532
  store i32 %r533, i32* @ans
  %r534 = add i32 %r519, 1
  br label %bb45

bb47:
  %r520 = load i32, i32* @ans
  %r371 = icmp slt i32 %r520, 0
  br i1 %r371, label %bb48, label %bb49

bb48:
  %r522 = load i32, i32* @ans
  %r523 = sub i32 0, %r522
  store i32 %r523, i32* @ans
  br label %bb50

bb49:
  br label %bb50

bb50:
  call void @_sysy_stoptime(i32 117)
  %r521 = load i32, i32* @ans
  call void @putint(i32 %r521)
  call void @putch(i32 10)
  ret i32 0
}

