declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @Merge( i32* %r100, i32 %r101, i32 %r103, i32 %r105 ) {
bb29:
  %r269 = add i32 0, 0
  %r270 = add i32 0, 0
  %r271 = add i32 0, 0
  %r272 = add i32 0, 0
  %r117 = alloca [ 10 x i32 ]
  %r116 = alloca [ 10 x i32 ]
  %r273 = add i32 0, 0
  %r274 = add i32 0, 0
  %r275 = add i32 0, 0
  %r276 = add i32 %r101, 0
  %r277 = add i32 0, 0
  %r278 = add i32 %r103, 0
  %r279 = add i32 0, 0
  %r280 = add i32 %r105, 0
  br label %bb1

bb1:
  %r281 = sub i32 %r278, %r276
  %r282 = add i32 %r281, 1
  %r283 = sub i32 %r280, %r278
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  br label %bb2

bb2:
  %r286 = phi i32 [ %r284, %bb1 ], [ %r322, %bb3 ]
  %r123 = icmp slt i32 %r286, %r282
  br i1 %r123, label %bb3, label %bb4

bb3:
  %r320 = add i32 %r286, %r276
  %r128 = getelementptr i32, i32* %r100, i32 %r320
  %r321 = load i32, i32* %r128
  %r131 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r286
  store i32 %r321, i32* %r131
  %r322 = add i32 %r286, 1
  br label %bb2

bb4:
  br label %bb5

bb5:
  %r287 = phi i32 [ %r285, %bb4 ], [ %r319, %bb6 ]
  %r136 = icmp slt i32 %r287, %r283
  br i1 %r136, label %bb6, label %bb7

bb6:
  %r316 = add i32 %r287, %r278
  %r317 = add i32 %r316, 1
  %r142 = getelementptr i32, i32* %r100, i32 %r317
  %r318 = load i32, i32* %r142
  %r145 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r287
  store i32 %r318, i32* %r145
  %r319 = add i32 %r287, 1
  br label %bb5

bb7:
  %r288 = add i32 0, 0
  %r289 = add i32 0, 0
  %r290 = add i32 %r276, 0
  br label %bb8

bb8:
  %r291 = phi i32 [ %r289, %bb7 ], [ %r307, %bb14 ]
  %r292 = phi i32 [ %r290, %bb7 ], [ %r308, %bb14 ]
  %r293 = phi i32 [ %r288, %bb7 ], [ %r309, %bb14 ]
  %r152 = icmp ne i32 %r293, %r282
  br i1 %r152, label %bb11, label %bb10

bb11:
  %r155 = icmp ne i32 %r291, %r283
  br i1 %r155, label %bb9, label %bb10

bb9:
  %r157 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r293
  %r304 = load i32, i32* %r157
  %r160 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r291
  %r305 = load i32, i32* %r160
  %r306 = add i32 %r305, 1
  %r163 = icmp slt i32 %r304, %r306
  br i1 %r163, label %bb12, label %bb13

bb12:
  %r165 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r293
  %r313 = load i32, i32* %r165
  %r168 = getelementptr i32, i32* %r100, i32 %r292
  store i32 %r313, i32* %r168
  %r314 = add i32 %r292, 1
  %r315 = add i32 %r293, 1
  br label %bb14

bb13:
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r291
  %r310 = load i32, i32* %r174
  %r177 = getelementptr i32, i32* %r100, i32 %r292
  store i32 %r310, i32* %r177
  %r311 = add i32 %r292, 1
  %r312 = add i32 %r291, 1
  br label %bb14

bb14:
  %r307 = phi i32 [ %r291, %bb12 ], [ %r312, %bb13 ]
  %r308 = phi i32 [ %r314, %bb12 ], [ %r311, %bb13 ]
  %r309 = phi i32 [ %r315, %bb12 ], [ %r293, %bb13 ]
  br label %bb8

bb10:
  br label %bb15

bb15:
  %r294 = phi i32 [ %r292, %bb10 ], [ %r302, %bb16 ]
  %r295 = phi i32 [ %r293, %bb10 ], [ %r303, %bb16 ]
  %r184 = icmp slt i32 %r295, %r282
  br i1 %r184, label %bb16, label %bb17

bb16:
  %r186 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r295
  %r301 = load i32, i32* %r186
  %r189 = getelementptr i32, i32* %r100, i32 %r294
  store i32 %r301, i32* %r189
  %r302 = add i32 %r294, 1
  %r303 = add i32 %r295, 1
  br label %bb15

bb17:
  br label %bb18

bb18:
  %r296 = phi i32 [ %r291, %bb17 ], [ %r300, %bb19 ]
  %r297 = phi i32 [ %r294, %bb17 ], [ %r299, %bb19 ]
  %r196 = icmp slt i32 %r296, %r283
  br i1 %r196, label %bb19, label %bb20

bb19:
  %r198 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r296
  %r298 = load i32, i32* %r198
  %r201 = getelementptr i32, i32* %r100, i32 %r297
  store i32 %r298, i32* %r201
  %r299 = add i32 %r297, 1
  %r300 = add i32 %r296, 1
  br label %bb18

bb20:
  ret i32 0
}

define i32 @MergeSort( i32* %r206, i32 %r207, i32 %r209 ) {
bb30:
  %r327 = add i32 0, 0
  %r328 = add i32 0, 0
  %r329 = add i32 0, 0
  %r330 = add i32 %r207, 0
  %r331 = add i32 0, 0
  %r332 = add i32 %r209, 0
  br label %bb21

bb21:
  %r213 = icmp slt i32 %r330, %r332
  br i1 %r213, label %bb22, label %bb23

bb22:
  %r333 = add i32 %r330, %r332
  %r334 = sdiv i32 %r333, 2
  %r335 = call i32 @MergeSort(i32* %r206, i32 %r330, i32 %r334)
  %r336 = add i32 %r334, 1
  %r337 = call i32 @MergeSort(i32* %r206, i32 %r336, i32 %r332)
  %r338 = call i32 @Merge(i32* %r206, i32 %r330, i32 %r334, i32 %r332)
  br label %bb24

bb23:
  br label %bb24

bb24:
  ret i32 0
}

define i32 @main( ) {
bb25:
  call void @_sysy_starttime(i32 71)
  store i32 10, i32* @n
  %r232 = alloca [ 10 x i32 ]
  %r233 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 0
  store i32 4, i32* %r233
  %r234 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 1
  store i32 3, i32* %r234
  %r235 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 2
  store i32 9, i32* %r235
  %r236 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 3
  store i32 2, i32* %r236
  %r237 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 4
  store i32 0, i32* %r237
  %r238 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 5
  store i32 1, i32* %r238
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 6
  store i32 6, i32* %r239
  %r240 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 7
  store i32 5, i32* %r240
  %r241 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 8
  store i32 7, i32* %r241
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 9
  store i32 8, i32* %r242
  %r341 = add i32 0, 0
  %r342 = add i32 0, 0
  %r343 = add i32 0, 0
  %r344 = load i32, i32* @n
  %r345 = sub i32 %r344, 1
  %r346 = call i32 @MergeSort(i32* %r232, i32 %r342, i32 %r345)
  br label %bb26

bb26:
  %r347 = phi i32 [ %r346, %bb25 ], [ %r351, %bb27 ]
  %r348 = load i32, i32* @n
  %r252 = icmp slt i32 %r347, %r348
  br i1 %r252, label %bb27, label %bb28

bb27:
  %r254 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 %r347
  %r349 = load i32, i32* %r254
  call void @putint(i32 %r349)
  %r350 = add i32 10, 0
  call void @putch(i32 %r350)
  %r351 = add i32 %r347, 1
  br label %bb26

bb28:
  call void @_sysy_stoptime(i32 97)
  ret i32 0
}

