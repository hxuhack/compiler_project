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
  %r260 = add i32 0, 0
  %r261 = add i32 0, 0
  %r262 = add i32 0, 0
  %r263 = add i32 0, 0
  %r117 = alloca [ 10 x i32 ]
  %r116 = alloca [ 10 x i32 ]
  %r264 = add i32 0, 0
  %r265 = add i32 0, 0
  %r266 = add i32 0, 0
  %r269 = add i32 %r101, 0
  %r267 = add i32 0, 0
  %r270 = add i32 %r103, 0
  %r268 = add i32 0, 0
  %r271 = add i32 %r105, 0
  br label %bb1

bb1:
  %r110 = sub i32 %r270, %r269
  %r272 = add i32 %r110, 1
  %r273 = sub i32 %r271, %r270
  %r274 = add i32 0, 0
  %r275 = add i32 0, 0
  br label %bb2

bb2:
  %r276 = phi i32 [ %r274, %bb1 ], [ %r302, %bb3 ]
  %r123 = icmp slt i32 %r276, %r272
  br i1 %r123, label %bb3, label %bb4

bb3:
  %r301 = add i32 %r276, %r269
  %r128 = getelementptr i32, i32* %r100, i32 %r301
  %r129 = load i32, i32* %r128
  %r131 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r276
  store i32 %r129, i32* %r131
  %r302 = add i32 %r276, 1
  br label %bb2

bb4:
  br label %bb5

bb5:
  %r277 = phi i32 [ %r275, %bb4 ], [ %r300, %bb6 ]
  %r136 = icmp slt i32 %r277, %r273
  br i1 %r136, label %bb6, label %bb7

bb6:
  %r139 = add i32 %r277, %r270
  %r299 = add i32 %r139, 1
  %r142 = getelementptr i32, i32* %r100, i32 %r299
  %r143 = load i32, i32* %r142
  %r145 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r277
  store i32 %r143, i32* %r145
  %r300 = add i32 %r277, 1
  br label %bb5

bb7:
  %r278 = add i32 0, 0
  %r279 = add i32 0, 0
  %r280 = add i32 %r269, 0
  br label %bb8

bb8:
  %r281 = phi i32 [ %r279, %bb7 ], [ %r292, %bb14 ]
  %r282 = phi i32 [ %r280, %bb7 ], [ %r293, %bb14 ]
  %r283 = phi i32 [ %r278, %bb7 ], [ %r294, %bb14 ]
  %r152 = icmp ne i32 %r283, %r272
  br i1 %r152, label %bb11, label %bb10

bb11:
  %r155 = icmp ne i32 %r281, %r273
  br i1 %r155, label %bb9, label %bb10

bb9:
  %r157 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r283
  %r158 = load i32, i32* %r157
  %r160 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r281
  %r161 = load i32, i32* %r160
  %r162 = add i32 %r161, 1
  %r163 = icmp slt i32 %r158, %r162
  br i1 %r163, label %bb12, label %bb13

bb12:
  %r165 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r283
  %r166 = load i32, i32* %r165
  %r168 = getelementptr i32, i32* %r100, i32 %r282
  store i32 %r166, i32* %r168
  %r297 = add i32 %r282, 1
  %r298 = add i32 %r283, 1
  br label %bb14

bb13:
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r281
  %r175 = load i32, i32* %r174
  %r177 = getelementptr i32, i32* %r100, i32 %r282
  store i32 %r175, i32* %r177
  %r295 = add i32 %r282, 1
  %r296 = add i32 %r281, 1
  br label %bb14

bb14:
  %r292 = phi i32 [ %r281, %bb12 ], [ %r296, %bb13 ]
  %r293 = phi i32 [ %r297, %bb12 ], [ %r295, %bb13 ]
  %r294 = phi i32 [ %r298, %bb12 ], [ %r283, %bb13 ]
  br label %bb8

bb10:
  br label %bb15

bb15:
  %r284 = phi i32 [ %r282, %bb10 ], [ %r290, %bb16 ]
  %r285 = phi i32 [ %r283, %bb10 ], [ %r291, %bb16 ]
  %r184 = icmp slt i32 %r285, %r272
  br i1 %r184, label %bb16, label %bb17

bb16:
  %r186 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r285
  %r187 = load i32, i32* %r186
  %r189 = getelementptr i32, i32* %r100, i32 %r284
  store i32 %r187, i32* %r189
  %r290 = add i32 %r284, 1
  %r291 = add i32 %r285, 1
  br label %bb15

bb17:
  br label %bb18

bb18:
  %r286 = phi i32 [ %r281, %bb17 ], [ %r289, %bb19 ]
  %r287 = phi i32 [ %r284, %bb17 ], [ %r288, %bb19 ]
  %r196 = icmp slt i32 %r286, %r273
  br i1 %r196, label %bb19, label %bb20

bb19:
  %r198 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r286
  %r199 = load i32, i32* %r198
  %r201 = getelementptr i32, i32* %r100, i32 %r287
  store i32 %r199, i32* %r201
  %r288 = add i32 %r287, 1
  %r289 = add i32 %r286, 1
  br label %bb18

bb20:
  ret i32 0
}

define i32 @MergeSort( i32* %r206, i32 %r207, i32 %r209 ) {
bb30:
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 0, 0
  %r307 = add i32 %r207, 0
  %r306 = add i32 0, 0
  %r308 = add i32 %r209, 0
  br label %bb21

bb21:
  %r213 = icmp slt i32 %r307, %r308
  br i1 %r213, label %bb22, label %bb23

bb22:
  %r217 = add i32 %r307, %r308
  %r309 = sdiv i32 %r217, 2
  %r310 = call i32 @MergeSort(i32* %r206, i32 %r307, i32 %r309)
  %r311 = add i32 %r309, 1
  %r312 = call i32 @MergeSort(i32* %r206, i32 %r311, i32 %r308)
  %r313 = call i32 @Merge(i32* %r206, i32 %r307, i32 %r309, i32 %r308)
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
  %r314 = add i32 0, 0
  %r316 = add i32 0, 0
  %r315 = add i32 0, 0
  %r245 = load i32, i32* @n
  %r317 = sub i32 %r245, 1
  %r318 = call i32 @MergeSort(i32* %r232, i32 %r316, i32 %r317)
  br label %bb26

bb26:
  %r319 = phi i32 [ %r318, %bb25 ], [ %r322, %bb27 ]
  %r251 = load i32, i32* @n
  %r252 = icmp slt i32 %r319, %r251
  br i1 %r252, label %bb27, label %bb28

bb27:
  %r254 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 %r319
  %r320 = load i32, i32* %r254
  call void @putint(i32 %r320)
  %r321 = add i32 10, 0
  call void @putch(i32 %r321)
  %r322 = add i32 %r319, 1
  br label %bb26

bb28:
  call void @_sysy_stoptime(i32 97)
  ret i32 0
}

