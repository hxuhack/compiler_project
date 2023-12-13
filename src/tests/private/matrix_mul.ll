declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@M = global i32 0
@L = global i32 0
@N = global i32 0
define i32 @mul( i32* %r100, i32* %r101, i32* %r102, i32* %r103, i32* %r104, i32* %r105, i32* %r106, i32* %r107, i32* %r108 ) {
bb1:
  %r338 = add i32 0, 0
  %r339 = add i32 0, 0
  %r110 = getelementptr i32, i32* %r100, i32 0
  %r340 = load i32, i32* %r110
  %r112 = getelementptr i32, i32* %r103, i32 0
  %r341 = load i32, i32* %r112
  %r342 = mul i32 %r340, %r341
  %r115 = getelementptr i32, i32* %r100, i32 1
  %r343 = load i32, i32* %r115
  %r117 = getelementptr i32, i32* %r104, i32 0
  %r344 = load i32, i32* %r117
  %r345 = mul i32 %r343, %r344
  %r346 = add i32 %r342, %r345
  %r121 = getelementptr i32, i32* %r100, i32 2
  %r347 = load i32, i32* %r121
  %r123 = getelementptr i32, i32* %r105, i32 0
  %r348 = load i32, i32* %r123
  %r349 = mul i32 %r347, %r348
  %r350 = add i32 %r346, %r349
  %r127 = getelementptr i32, i32* %r106, i32 0
  store i32 %r350, i32* %r127
  %r128 = getelementptr i32, i32* %r100, i32 0
  %r351 = load i32, i32* %r128
  %r130 = getelementptr i32, i32* %r103, i32 1
  %r352 = load i32, i32* %r130
  %r353 = mul i32 %r351, %r352
  %r133 = getelementptr i32, i32* %r100, i32 1
  %r354 = load i32, i32* %r133
  %r135 = getelementptr i32, i32* %r104, i32 1
  %r355 = load i32, i32* %r135
  %r356 = mul i32 %r354, %r355
  %r357 = add i32 %r353, %r356
  %r139 = getelementptr i32, i32* %r100, i32 2
  %r358 = load i32, i32* %r139
  %r141 = getelementptr i32, i32* %r105, i32 1
  %r359 = load i32, i32* %r141
  %r360 = mul i32 %r358, %r359
  %r361 = add i32 %r357, %r360
  %r145 = getelementptr i32, i32* %r106, i32 1
  store i32 %r361, i32* %r145
  %r146 = getelementptr i32, i32* %r100, i32 0
  %r362 = load i32, i32* %r146
  %r148 = getelementptr i32, i32* %r103, i32 2
  %r363 = load i32, i32* %r148
  %r364 = mul i32 %r362, %r363
  %r151 = getelementptr i32, i32* %r100, i32 1
  %r365 = load i32, i32* %r151
  %r153 = getelementptr i32, i32* %r104, i32 2
  %r366 = load i32, i32* %r153
  %r367 = mul i32 %r365, %r366
  %r368 = add i32 %r364, %r367
  %r157 = getelementptr i32, i32* %r100, i32 2
  %r369 = load i32, i32* %r157
  %r159 = getelementptr i32, i32* %r105, i32 2
  %r370 = load i32, i32* %r159
  %r371 = mul i32 %r369, %r370
  %r372 = add i32 %r368, %r371
  %r163 = getelementptr i32, i32* %r106, i32 2
  store i32 %r372, i32* %r163
  %r164 = getelementptr i32, i32* %r101, i32 0
  %r373 = load i32, i32* %r164
  %r166 = getelementptr i32, i32* %r103, i32 0
  %r374 = load i32, i32* %r166
  %r375 = mul i32 %r373, %r374
  %r169 = getelementptr i32, i32* %r101, i32 1
  %r376 = load i32, i32* %r169
  %r171 = getelementptr i32, i32* %r104, i32 0
  %r377 = load i32, i32* %r171
  %r378 = mul i32 %r376, %r377
  %r379 = add i32 %r375, %r378
  %r175 = getelementptr i32, i32* %r101, i32 2
  %r380 = load i32, i32* %r175
  %r177 = getelementptr i32, i32* %r105, i32 0
  %r381 = load i32, i32* %r177
  %r382 = mul i32 %r380, %r381
  %r383 = add i32 %r379, %r382
  %r181 = getelementptr i32, i32* %r107, i32 0
  store i32 %r383, i32* %r181
  %r182 = getelementptr i32, i32* %r101, i32 0
  %r384 = load i32, i32* %r182
  %r184 = getelementptr i32, i32* %r103, i32 1
  %r385 = load i32, i32* %r184
  %r386 = mul i32 %r384, %r385
  %r187 = getelementptr i32, i32* %r101, i32 1
  %r387 = load i32, i32* %r187
  %r189 = getelementptr i32, i32* %r104, i32 1
  %r388 = load i32, i32* %r189
  %r389 = mul i32 %r387, %r388
  %r390 = add i32 %r386, %r389
  %r193 = getelementptr i32, i32* %r101, i32 2
  %r391 = load i32, i32* %r193
  %r195 = getelementptr i32, i32* %r105, i32 1
  %r392 = load i32, i32* %r195
  %r393 = mul i32 %r391, %r392
  %r394 = add i32 %r390, %r393
  %r199 = getelementptr i32, i32* %r107, i32 1
  store i32 %r394, i32* %r199
  %r200 = getelementptr i32, i32* %r101, i32 0
  %r395 = load i32, i32* %r200
  %r202 = getelementptr i32, i32* %r103, i32 2
  %r396 = load i32, i32* %r202
  %r397 = mul i32 %r395, %r396
  %r205 = getelementptr i32, i32* %r101, i32 1
  %r398 = load i32, i32* %r205
  %r207 = getelementptr i32, i32* %r104, i32 2
  %r399 = load i32, i32* %r207
  %r400 = mul i32 %r398, %r399
  %r401 = add i32 %r397, %r400
  %r211 = getelementptr i32, i32* %r101, i32 2
  %r402 = load i32, i32* %r211
  %r213 = getelementptr i32, i32* %r105, i32 2
  %r403 = load i32, i32* %r213
  %r404 = mul i32 %r402, %r403
  %r405 = add i32 %r401, %r404
  %r217 = getelementptr i32, i32* %r107, i32 2
  store i32 %r405, i32* %r217
  %r218 = getelementptr i32, i32* %r102, i32 0
  %r406 = load i32, i32* %r218
  %r220 = getelementptr i32, i32* %r103, i32 0
  %r407 = load i32, i32* %r220
  %r408 = mul i32 %r406, %r407
  %r223 = getelementptr i32, i32* %r102, i32 1
  %r409 = load i32, i32* %r223
  %r225 = getelementptr i32, i32* %r104, i32 0
  %r410 = load i32, i32* %r225
  %r411 = mul i32 %r409, %r410
  %r412 = add i32 %r408, %r411
  %r229 = getelementptr i32, i32* %r102, i32 2
  %r413 = load i32, i32* %r229
  %r231 = getelementptr i32, i32* %r105, i32 0
  %r414 = load i32, i32* %r231
  %r415 = mul i32 %r413, %r414
  %r416 = add i32 %r412, %r415
  %r235 = getelementptr i32, i32* %r108, i32 0
  store i32 %r416, i32* %r235
  %r236 = getelementptr i32, i32* %r102, i32 0
  %r417 = load i32, i32* %r236
  %r238 = getelementptr i32, i32* %r103, i32 1
  %r418 = load i32, i32* %r238
  %r419 = mul i32 %r417, %r418
  %r241 = getelementptr i32, i32* %r102, i32 1
  %r420 = load i32, i32* %r241
  %r243 = getelementptr i32, i32* %r104, i32 1
  %r421 = load i32, i32* %r243
  %r422 = mul i32 %r420, %r421
  %r423 = add i32 %r419, %r422
  %r247 = getelementptr i32, i32* %r102, i32 2
  %r424 = load i32, i32* %r247
  %r249 = getelementptr i32, i32* %r105, i32 1
  %r425 = load i32, i32* %r249
  %r426 = mul i32 %r424, %r425
  %r427 = add i32 %r423, %r426
  %r253 = getelementptr i32, i32* %r108, i32 1
  store i32 %r427, i32* %r253
  %r254 = getelementptr i32, i32* %r102, i32 0
  %r428 = load i32, i32* %r254
  %r256 = getelementptr i32, i32* %r103, i32 2
  %r429 = load i32, i32* %r256
  %r430 = mul i32 %r428, %r429
  %r259 = getelementptr i32, i32* %r102, i32 1
  %r431 = load i32, i32* %r259
  %r261 = getelementptr i32, i32* %r104, i32 2
  %r432 = load i32, i32* %r261
  %r433 = mul i32 %r431, %r432
  %r434 = add i32 %r430, %r433
  %r265 = getelementptr i32, i32* %r102, i32 2
  %r435 = load i32, i32* %r265
  %r267 = getelementptr i32, i32* %r105, i32 2
  %r436 = load i32, i32* %r267
  %r437 = mul i32 %r435, %r436
  %r438 = add i32 %r434, %r437
  %r271 = getelementptr i32, i32* %r108, i32 2
  store i32 %r438, i32* %r271
  ret i32 0
}

define i32 @main( ) {
bb2:
  %r441 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %r272 = alloca [ 3 x i32 ]
  %r273 = alloca [ 3 x i32 ]
  %r274 = alloca [ 3 x i32 ]
  %r275 = alloca [ 3 x i32 ]
  %r276 = alloca [ 3 x i32 ]
  %r277 = alloca [ 3 x i32 ]
  %r278 = alloca [ 6 x i32 ]
  %r279 = alloca [ 3 x i32 ]
  %r280 = alloca [ 3 x i32 ]
  %r442 = add i32 0, 0
  %r443 = add i32 0, 0
  br label %bb3

bb3:
  %r444 = phi i32 [ %r443, %bb2 ], [ %r464, %bb4 ]
  %r445 = load i32, i32* @M
  %r284 = icmp slt i32 %r444, %r445
  br i1 %r284, label %bb4, label %bb5

bb4:
  %r287 = getelementptr [3 x i32 ], [3 x i32 ]* %r272, i32 0, i32 %r444
  store i32 %r444, i32* %r287
  %r290 = getelementptr [3 x i32 ], [3 x i32 ]* %r273, i32 0, i32 %r444
  store i32 %r444, i32* %r290
  %r293 = getelementptr [3 x i32 ], [3 x i32 ]* %r274, i32 0, i32 %r444
  store i32 %r444, i32* %r293
  %r296 = getelementptr [3 x i32 ], [3 x i32 ]* %r275, i32 0, i32 %r444
  store i32 %r444, i32* %r296
  %r299 = getelementptr [3 x i32 ], [3 x i32 ]* %r276, i32 0, i32 %r444
  store i32 %r444, i32* %r299
  %r302 = getelementptr [3 x i32 ], [3 x i32 ]* %r277, i32 0, i32 %r444
  store i32 %r444, i32* %r302
  %r464 = add i32 %r444, 1
  br label %bb3

bb5:
  %r446 = call i32 @mul(i32* %r272, i32* %r273, i32* %r274, i32* %r275, i32* %r276, i32* %r277, i32* %r278, i32* %r279, i32* %r280)
  br label %bb6

bb6:
  %r447 = phi i32 [ %r446, %bb5 ], [ %r463, %bb7 ]
  %r448 = load i32, i32* @N
  %r309 = icmp slt i32 %r447, %r448
  br i1 %r309, label %bb7, label %bb8

bb7:
  %r311 = getelementptr [6 x i32 ], [6 x i32 ]* %r278, i32 0, i32 %r447
  %r462 = load i32, i32* %r311
  call void @putint(i32 %r462)
  %r463 = add i32 %r447, 1
  br label %bb6

bb8:
  %r449 = add i32 10, 0
  %r450 = add i32 0, 0
  call void @putch(i32 %r449)
  br label %bb9

bb9:
  %r451 = phi i32 [ %r450, %bb8 ], [ %r461, %bb10 ]
  %r452 = load i32, i32* @N
  %r319 = icmp slt i32 %r451, %r452
  br i1 %r319, label %bb10, label %bb11

bb10:
  %r321 = getelementptr [3 x i32 ], [3 x i32 ]* %r279, i32 0, i32 %r451
  %r460 = load i32, i32* %r321
  call void @putint(i32 %r460)
  %r461 = add i32 %r451, 1
  br label %bb9

bb11:
  %r453 = add i32 10, 0
  %r454 = add i32 0, 0
  call void @putch(i32 %r453)
  br label %bb12

bb12:
  %r455 = phi i32 [ %r454, %bb11 ], [ %r459, %bb13 ]
  %r456 = load i32, i32* @N
  %r329 = icmp slt i32 %r455, %r456
  br i1 %r329, label %bb13, label %bb14

bb13:
  %r331 = getelementptr [3 x i32 ], [3 x i32 ]* %r280, i32 0, i32 %r455
  %r458 = load i32, i32* %r331
  call void @putint(i32 %r458)
  %r459 = add i32 %r455, 1
  br label %bb12

bb14:
  %r457 = add i32 10, 0
  call void @putch(i32 %r457)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

