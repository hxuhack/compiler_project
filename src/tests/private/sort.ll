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
  %r375 = add i32 0, 0
  %r376 = add i32 0, 0
  %r377 = add i32 0, 0
  %r378 = add i32 %r100, 0
  br label %bb1

bb1:
  %r379 = add i32 0, 0
  %r380 = add i32 0, 0
  br label %bb2

bb2:
  %r381 = phi i32 [ %r379, %bb1 ], [ %r383, %bb7 ]
  %r382 = phi i32 [ %r380, %bb1 ], [ %r384, %bb7 ]
  %r107 = icmp slt i32 %r382, %r378
  br i1 %r107, label %bb3, label %bb4

bb3:
  %r109 = getelementptr i32, i32* %r102, i32 %r382
  %r110 = load i32, i32* %r109
  %r112 = icmp sgt i32 %r110, %r381
  br i1 %r112, label %bb5, label %bb6

bb5:
  %r114 = getelementptr i32, i32* %r102, i32 %r382
  %r385 = load i32, i32* %r114
  br label %bb7

bb6:
  br label %bb7

bb7:
  %r383 = phi i32 [ %r385, %bb5 ], [ %r381, %bb6 ]
  %r384 = add i32 %r382, 1
  br label %bb2

bb4:
  ret i32 %r381
}

define i32 @getNumPos( i32 %r119, i32 %r121 ) {
bb52:
  %r386 = add i32 0, 0
  %r387 = add i32 0, 0
  %r388 = add i32 0, 0
  %r390 = add i32 %r119, 0
  %r389 = add i32 0, 0
  %r391 = add i32 %r121, 0
  br label %bb8

bb8:
  %r392 = add i32 1, 0
  %r393 = add i32 0, 0
  br label %bb9

bb9:
  %r394 = phi i32 [ %r390, %bb8 ], [ %r396, %bb10 ]
  %r395 = phi i32 [ %r393, %bb8 ], [ %r397, %bb10 ]
  %r127 = icmp slt i32 %r395, %r391
  br i1 %r127, label %bb10, label %bb11

bb10:
  %r129 = load i32, i32* @base
  %r396 = sdiv i32 %r394, %r129
  %r397 = add i32 %r395, 1
  br label %bb9

bb11:
  %r135 = load i32, i32* @base
  %r136 = sdiv i32 %r394, %r135
  %r137 = load i32, i32* @base
  %r138 = mul i32 %r136, %r137
  %r139 = sub i32 %r394, %r138
  ret i32 %r139
}

define void @radixSort( i32 %r140, i32* %r142, i32 %r143, i32 %r145 ) {
bb53:
  %r398 = add i32 0, 0
  %r399 = add i32 0, 0
  %r400 = add i32 0, 0
  %r401 = add i32 0, 0
  %r402 = add i32 0, 0
  %r403 = add i32 0, 0
  %r404 = add i32 0, 0
  %r405 = add i32 0, 0
  %r406 = add i32 0, 0
  %r407 = add i32 0, 0
  %r408 = add i32 0, 0
  %r409 = add i32 0, 0
  %r149 = alloca [ 16 x i32 ]
  %r148 = alloca [ 16 x i32 ]
  %r147 = alloca [ 16 x i32 ]
  %r410 = add i32 0, 0
  %r413 = add i32 %r140, 0
  %r411 = add i32 0, 0
  %r414 = add i32 %r143, 0
  %r412 = add i32 0, 0
  %r415 = add i32 %r145, 0
  br label %bb12

bb12:
  %r416 = add i32 0, 0
  br label %bb13

bb13:
  %r417 = phi i32 [ %r416, %bb12 ], [ %r447, %bb14 ]
  %r152 = load i32, i32* @base
  %r153 = icmp slt i32 %r417, %r152
  br i1 %r153, label %bb14, label %bb15

bb14:
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r417
  store i32 0, i32* %r155
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r417
  store i32 0, i32* %r157
  %r159 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r417
  store i32 0, i32* %r159
  %r447 = add i32 %r417, 1
  br label %bb13

bb15:
  %r163 = sub i32 0, 1
  %r164 = icmp eq i32 %r413, %r163
  br i1 %r164, label %bb16, label %bb19

bb19:
  %r166 = add i32 %r414, 1
  %r168 = icmp sge i32 %r166, %r415
  br i1 %r168, label %bb16, label %bb17

bb16:
  ret void
bb17:
  br label %bb18

bb18:
  %r418 = add i32 %r414, 0
  br label %bb20

bb20:
  %r419 = phi i32 [ %r418, %bb18 ], [ %r446, %bb21 ]
  %r173 = icmp slt i32 %r419, %r415
  br i1 %r173, label %bb21, label %bb22

bb21:
  %r176 = getelementptr i32, i32* %r142, i32 %r419
  %r177 = load i32, i32* %r176
  %r444 = call i32 @getNumPos(i32 %r177, i32 %r413)
  %r182 = getelementptr i32, i32* %r142, i32 %r419
  %r183 = load i32, i32* %r182
  %r445 = call i32 @getNumPos(i32 %r183, i32 %r413)
  %r187 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r444
  %r188 = load i32, i32* %r187
  %r189 = add i32 %r188, 1
  %r191 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r445
  store i32 %r189, i32* %r191
  %r446 = add i32 %r419, 1
  br label %bb20

bb22:
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 0
  store i32 %r414, i32* %r195
  %r197 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r198 = load i32, i32* %r197
  %r199 = add i32 %r414, %r198
  %r200 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r199, i32* %r200
  %r420 = add i32 1, 0
  br label %bb23

bb23:
  %r421 = phi i32 [ %r420, %bb22 ], [ %r443, %bb24 ]
  %r202 = load i32, i32* @base
  %r203 = icmp slt i32 %r421, %r202
  br i1 %r203, label %bb24, label %bb25

bb24:
  %r442 = sub i32 %r421, 1
  %r208 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r442
  %r209 = load i32, i32* %r208
  %r211 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r421
  store i32 %r209, i32* %r211
  %r213 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r421
  %r214 = load i32, i32* %r213
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r421
  %r217 = load i32, i32* %r216
  %r218 = add i32 %r214, %r217
  %r220 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r421
  store i32 %r218, i32* %r220
  %r443 = add i32 %r421, 1
  br label %bb23

bb25:
  %r422 = add i32 0, 0
  br label %bb26

bb26:
  %r423 = phi i32 [ %r422, %bb25 ], [ %r429, %bb31 ]
  %r224 = load i32, i32* @base
  %r225 = icmp slt i32 %r423, %r224
  br i1 %r225, label %bb27, label %bb28

bb27:
  br label %bb29

bb29:
  %r227 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r423
  %r228 = load i32, i32* %r227
  %r230 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r423
  %r231 = load i32, i32* %r230
  %r232 = icmp slt i32 %r228, %r231
  br i1 %r232, label %bb30, label %bb31

bb30:
  %r235 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r423
  %r430 = load i32, i32* %r235
  %r239 = getelementptr i32, i32* %r142, i32 %r430
  %r431 = load i32, i32* %r239
  br label %bb32

bb32:
  %r432 = phi i32 [ %r431, %bb30 ], [ %r437, %bb33 ]
  %r243 = call i32 @getNumPos(i32 %r432, i32 %r413)
  %r245 = icmp ne i32 %r243, %r423
  br i1 %r245, label %bb33, label %bb34

bb33:
  %r434 = add i32 %r432, 0
  %r435 = call i32 @getNumPos(i32 %r434, i32 %r413)
  %r253 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r435
  %r436 = load i32, i32* %r253
  %r256 = getelementptr i32, i32* %r142, i32 %r436
  %r437 = load i32, i32* %r256
  %r438 = call i32 @getNumPos(i32 %r434, i32 %r413)
  %r262 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r438
  %r439 = load i32, i32* %r262
  %r266 = getelementptr i32, i32* %r142, i32 %r439
  store i32 %r434, i32* %r266
  %r440 = call i32 @getNumPos(i32 %r434, i32 %r413)
  %r441 = call i32 @getNumPos(i32 %r434, i32 %r413)
  %r275 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r440
  %r276 = load i32, i32* %r275
  %r277 = add i32 %r276, 1
  %r279 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r441
  store i32 %r277, i32* %r279
  br label %bb32

bb34:
  %r282 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r423
  %r433 = load i32, i32* %r282
  %r286 = getelementptr i32, i32* %r142, i32 %r433
  store i32 %r432, i32* %r286
  %r288 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r423
  %r289 = load i32, i32* %r288
  %r290 = add i32 %r289, 1
  %r292 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r423
  store i32 %r290, i32* %r292
  br label %bb29

bb31:
  %r429 = add i32 %r423, 1
  br label %bb26

bb28:
  %r424 = add i32 %r414, 0
  %r297 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 0
  store i32 %r414, i32* %r297
  %r299 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r300 = load i32, i32* %r299
  %r301 = add i32 %r414, %r300
  %r302 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r301, i32* %r302
  %r425 = add i32 0, 0
  br label %bb35

bb35:
  %r426 = phi i32 [ %r425, %bb28 ], [ %r427, %bb40 ]
  %r304 = load i32, i32* @base
  %r305 = icmp slt i32 %r426, %r304
  br i1 %r305, label %bb36, label %bb37

bb36:
  %r307 = icmp sgt i32 %r426, 0
  br i1 %r307, label %bb38, label %bb39

bb38:
  %r428 = sub i32 %r426, 1
  %r312 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r428
  %r313 = load i32, i32* %r312
  %r315 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r426
  store i32 %r313, i32* %r315
  %r317 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r426
  %r318 = load i32, i32* %r317
  %r320 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r426
  %r321 = load i32, i32* %r320
  %r322 = add i32 %r318, %r321
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r426
  store i32 %r322, i32* %r324
  br label %bb40

bb39:
  br label %bb40

bb40:
  %r326 = sub i32 %r413, 1
  %r328 = getelementptr [16 x i32 ], [16 x i32 ]* %r147, i32 0, i32 %r426
  %r329 = load i32, i32* %r328
  %r331 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r426
  %r332 = load i32, i32* %r331
  call void @radixSort(i32 %r326, i32* %r142, i32 %r329, i32 %r332)
  %r427 = add i32 %r426, 1
  br label %bb35

bb37:
  ret void
}

define i32 @main( ) {
bb41:
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  %r451 = call i32 @getint()
  %r450 = add i32 0, 0
  %r452 = add i32 0, 0
  br label %bb42

bb42:
  %r453 = phi i32 [ %r452, %bb41 ], [ %r457, %bb43 ]
  %r340 = icmp slt i32 %r453, %r451
  br i1 %r340, label %bb43, label %bb44

bb43:
  %r341 = call i32 @getint()
  %r343 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r453
  store i32 %r341, i32* %r343
  %r457 = add i32 %r453, 1
  br label %bb42

bb44:
  call void @_sysy_starttime(i32 97)
  call void @radixSort(i32 8, i32* @a, i32 0, i32 %r451)
  %r454 = add i32 0, 0
  br label %bb45

bb45:
  %r455 = phi i32 [ %r454, %bb44 ], [ %r456, %bb46 ]
  %r350 = icmp slt i32 %r455, %r451
  br i1 %r350, label %bb46, label %bb47

bb46:
  %r351 = load i32, i32* @ans
  %r354 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r455
  %r355 = load i32, i32* %r354
  %r357 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r455
  %r358 = load i32, i32* %r357
  %r360 = add i32 2, %r455
  %r361 = sdiv i32 %r358, %r360
  %r363 = add i32 2, %r455
  %r364 = mul i32 %r361, %r363
  %r365 = sub i32 %r355, %r364
  %r366 = mul i32 %r455, %r365
  %r367 = add i32 %r351, %r366
  store i32 %r367, i32* @ans
  %r456 = add i32 %r455, 1
  br label %bb45

bb47:
  %r370 = load i32, i32* @ans
  %r371 = icmp slt i32 %r370, 0
  br i1 %r371, label %bb48, label %bb49

bb48:
  %r373 = load i32, i32* @ans
  %r372 = sub i32 0, %r373
  store i32 %r372, i32* @ans
  br label %bb50

bb49:
  br label %bb50

bb50:
  call void @_sysy_stoptime(i32 117)
  %r374 = load i32, i32* @ans
  call void @putint(i32 %r374)
  call void @putch(i32 10)
  ret i32 0
}

