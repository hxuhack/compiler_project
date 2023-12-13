declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @func1( i32 %r100, i32 %r102, i32 %r104 ) {
bb31:
  %r274 = add i32 0, 0
  %r275 = add i32 %r100, 0
  %r276 = add i32 0, 0
  %r277 = add i32 %r102, 0
  %r278 = add i32 0, 0
  %r279 = add i32 %r104, 0
  br label %bb1

bb1:
  %r107 = icmp eq i32 %r279, 0
  br i1 %r107, label %bb2, label %bb3

bb2:
  %r282 = mul i32 %r275, %r277
  ret i32 %r282
bb3:
  %r280 = sub i32 %r277, %r279
  %r281 = call i32 @func1(i32 %r275, i32 %r280, i32 0)
  ret i32 %r281
}

define i32 @func2( i32 %r116, i32 %r118 ) {
bb34:
  %r285 = add i32 0, 0
  %r286 = add i32 %r116, 0
  %r287 = add i32 0, 0
  %r288 = add i32 %r118, 0
  br label %bb5

bb5:
  %r121 = icmp ne i32 %r288, 0
  br i1 %r121, label %bb6, label %bb7

bb6:
  %r289 = sdiv i32 %r286, %r288
  %r290 = mul i32 %r289, %r288
  %r291 = sub i32 %r286, %r290
  %r292 = call i32 @func2(i32 %r291, i32 0)
  ret i32 %r292
bb7:
  ret i32 %r286
}

define i32 @func3( i32 %r131, i32 %r133 ) {
bb37:
  %r295 = add i32 0, 0
  %r296 = add i32 %r131, 0
  %r297 = add i32 0, 0
  %r298 = add i32 %r133, 0
  br label %bb9

bb9:
  %r136 = icmp eq i32 %r298, 0
  br i1 %r136, label %bb10, label %bb11

bb10:
  %r301 = add i32 %r296, 1
  ret i32 %r301
bb11:
  %r299 = add i32 %r296, %r298
  %r300 = call i32 @func3(i32 %r299, i32 0)
  ret i32 %r300
}

define i32 @func4( i32 %r143, i32 %r145, i32 %r147 ) {
bb40:
  %r305 = add i32 0, 0
  %r306 = add i32 %r143, 0
  %r307 = add i32 0, 0
  %r308 = add i32 %r145, 0
  %r309 = add i32 0, 0
  %r310 = add i32 %r147, 0
  br label %bb13

bb13:
  %r150 = icmp ne i32 %r306, 0
  br i1 %r150, label %bb14, label %bb15

bb14:
  ret i32 %r308
bb15:
  ret i32 %r310
}

define i32 @func5( i32 %r153 ) {
bb43:
  %r312 = add i32 0, 0
  %r313 = add i32 %r153, 0
  br label %bb17

bb17:
  %r314 = sub i32 0, %r313
  ret i32 %r314
}

define i32 @func6( i32 %r157, i32 %r159 ) {
bb44:
  %r317 = add i32 0, 0
  %r318 = add i32 %r157, 0
  %r319 = add i32 0, 0
  %r320 = add i32 %r159, 0
  br label %bb18

bb18:
  %r162 = icmp ne i32 %r318, 0
  br i1 %r162, label %bb22, label %bb20

bb22:
  %r164 = icmp ne i32 %r320, 0
  br i1 %r164, label %bb19, label %bb20

bb19:
  ret i32 1
bb20:
  ret i32 0
}

define i32 @func7( i32 %r165 ) {
bb47:
  %r322 = add i32 0, 0
  %r323 = add i32 %r165, 0
  br label %bb23

bb23:
  %r168 = icmp ne i32 %r323, 0
  br i1 %r168, label %bb25, label %bb24

bb24:
  ret i32 1
bb25:
  ret i32 0
}

define i32 @main( ) {
bb27:
  %r330 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r331 = add i32 0, 0
  %r332 = call i32 @getint()
  %r333 = add i32 0, 0
  %r334 = call i32 @getint()
  %r335 = add i32 0, 0
  %r336 = call i32 @getint()
  %r337 = add i32 0, 0
  %r338 = call i32 @getint()
  %r177 = alloca [ 10 x i32 ]
  %r339 = add i32 0, 0
  %r340 = add i32 0, 0
  br label %bb28

bb28:
  %r341 = phi i32 [ %r340, %bb27 ], [ %r397, %bb29 ]
  %r180 = icmp slt i32 %r341, 10
  br i1 %r180, label %bb29, label %bb30

bb29:
  %r396 = call i32 @getint()
  %r183 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 %r341
  store i32 %r396, i32* %r183
  %r397 = add i32 %r341, 1
  br label %bb28

bb30:
  %r342 = call i32 @func7(i32 %r332)
  %r343 = call i32 @func5(i32 %r334)
  %r344 = call i32 @func6(i32 %r342, i32 %r343)
  %r345 = call i32 @func2(i32 %r344, i32 %r336)
  %r346 = call i32 @func3(i32 %r345, i32 %r338)
  %r347 = call i32 @func5(i32 %r346)
  %r197 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 0
  %r348 = load i32, i32* %r197
  %r199 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 1
  %r349 = load i32, i32* %r199
  %r350 = call i32 @func5(i32 %r349)
  %r202 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 2
  %r351 = load i32, i32* %r202
  %r204 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 3
  %r352 = load i32, i32* %r204
  %r353 = call i32 @func7(i32 %r352)
  %r354 = call i32 @func6(i32 %r351, i32 %r353)
  %r208 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 4
  %r355 = load i32, i32* %r208
  %r210 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 5
  %r356 = load i32, i32* %r210
  %r357 = call i32 @func7(i32 %r356)
  %r358 = call i32 @func2(i32 %r355, i32 %r357)
  %r359 = call i32 @func4(i32 %r350, i32 %r354, i32 %r358)
  %r215 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 6
  %r360 = load i32, i32* %r215
  %r361 = call i32 @func3(i32 %r359, i32 %r360)
  %r218 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 7
  %r362 = load i32, i32* %r218
  %r363 = call i32 @func2(i32 %r361, i32 %r362)
  %r221 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 8
  %r364 = load i32, i32* %r221
  %r223 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 9
  %r365 = load i32, i32* %r223
  %r366 = call i32 @func7(i32 %r365)
  %r367 = call i32 @func3(i32 %r364, i32 %r366)
  %r368 = call i32 @func1(i32 %r363, i32 %r367, i32 %r332)
  %r369 = call i32 @func4(i32 %r347, i32 %r348, i32 %r368)
  %r370 = call i32 @func7(i32 %r336)
  %r371 = call i32 @func3(i32 %r370, i32 %r338)
  %r372 = call i32 @func2(i32 %r334, i32 %r371)
  %r373 = call i32 @func3(i32 %r369, i32 %r372)
  %r237 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 0
  %r374 = load i32, i32* %r237
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 1
  %r375 = load i32, i32* %r239
  %r376 = call i32 @func1(i32 %r373, i32 %r374, i32 %r375)
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 2
  %r377 = load i32, i32* %r242
  %r378 = call i32 @func2(i32 %r376, i32 %r377)
  %r245 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 3
  %r379 = load i32, i32* %r245
  %r247 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 4
  %r380 = load i32, i32* %r247
  %r249 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 5
  %r381 = load i32, i32* %r249
  %r382 = call i32 @func5(i32 %r381)
  %r383 = call i32 @func3(i32 %r380, i32 %r382)
  %r253 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 6
  %r384 = load i32, i32* %r253
  %r385 = call i32 @func5(i32 %r384)
  %r386 = call i32 @func2(i32 %r383, i32 %r385)
  %r257 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 7
  %r387 = load i32, i32* %r257
  %r259 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 8
  %r388 = load i32, i32* %r259
  %r389 = call i32 @func7(i32 %r388)
  %r390 = call i32 @func1(i32 %r386, i32 %r387, i32 %r389)
  %r263 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 9
  %r391 = load i32, i32* %r263
  %r392 = call i32 @func5(i32 %r391)
  %r393 = call i32 @func2(i32 %r390, i32 %r392)
  %r394 = call i32 @func3(i32 %r393, i32 %r332)
  %r395 = call i32 @func1(i32 %r378, i32 %r379, i32 %r394)
  call void @_sysy_stoptime(i32 117)
  ret i32 %r395
}

