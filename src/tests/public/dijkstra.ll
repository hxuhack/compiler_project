declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@INF = global i32 65535
%array2D = type { [16 x i32 ] }
@e = global [ 16 x %array2D ] zeroinitializer
@book = global [ 16 x i32 ] zeroinitializer
@dis = global [ 16 x i32 ] zeroinitializer
@n = global i32 0
@m = global i32 0
@v1 = global i32 0
@v2 = global i32 0
@w = global i32 0
define void @Dijkstra( ) {
bb1:
  %r242 = add i32 0, 0
  %r243 = add i32 0, 0
  %r244 = add i32 0, 0
  %r245 = add i32 0, 0
  %r246 = add i32 0, 0
  %r247 = add i32 1, 0
  br label %bb2

bb2:
  %r248 = phi i32 [ %r247, %bb1 ], [ %r283, %bb3 ]
  %r249 = load i32, i32* @n
  %r103 = icmp sle i32 %r248, %r249
  br i1 %r103, label %bb3, label %bb4

bb3:
  %r104 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r105 = getelementptr %array2D, %array2D* %r104, i32 0, i32 0
  %r107 = getelementptr [16 x i32 ], [16 x i32 ]* %r105, i32 0, i32 %r248
  %r282 = load i32, i32* %r107
  %r110 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r248
  store i32 %r282, i32* %r110
  %r112 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r248
  store i32 0, i32* %r112
  %r283 = add i32 %r248, 1
  br label %bb2

bb4:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  %r250 = add i32 1, 0
  br label %bb5

bb5:
  %r251 = phi i32 [ %r250, %bb4 ], [ %r264, %bb17 ]
  %r252 = load i32, i32* @n
  %r253 = sub i32 %r252, 1
  %r119 = icmp sle i32 %r251, %r253
  br i1 %r119, label %bb6, label %bb7

bb6:
  %r254 = load i32, i32* @INF
  %r255 = add i32 0, 0
  %r256 = add i32 1, 0
  br label %bb8

bb8:
  %r257 = phi i32 [ %r256, %bb6 ], [ %r278, %bb13 ]
  %r258 = phi i32 [ %r255, %bb6 ], [ %r276, %bb13 ]
  %r259 = phi i32 [ %r254, %bb6 ], [ %r277, %bb13 ]
  %r260 = load i32, i32* @n
  %r126 = icmp sle i32 %r257, %r260
  br i1 %r126, label %bb9, label %bb10

bb9:
  %r129 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r257
  %r275 = load i32, i32* %r129
  %r131 = icmp sgt i32 %r259, %r275
  br i1 %r131, label %bb14, label %bb12

bb14:
  %r133 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r257
  %r279 = load i32, i32* %r133
  %r135 = icmp eq i32 %r279, 0
  br i1 %r135, label %bb11, label %bb12

bb11:
  %r137 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r257
  %r280 = load i32, i32* %r137
  %r281 = add i32 %r257, 0
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r276 = phi i32 [ %r281, %bb11 ], [ %r258, %bb12 ]
  %r277 = phi i32 [ %r280, %bb11 ], [ %r259, %bb12 ]
  %r278 = add i32 %r257, 1
  br label %bb8

bb10:
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r258
  store i32 1, i32* %r143
  %r261 = add i32 1, 0
  br label %bb15

bb15:
  %r262 = phi i32 [ %r261, %bb10 ], [ %r267, %bb20 ]
  %r263 = load i32, i32* @n
  %r147 = icmp sle i32 %r262, %r263
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r149 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r258
  %r150 = getelementptr %array2D, %array2D* %r149, i32 0, i32 0
  %r152 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r262
  %r265 = load i32, i32* %r152
  %r266 = load i32, i32* @INF
  %r155 = icmp slt i32 %r265, %r266
  br i1 %r155, label %bb18, label %bb19

bb18:
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r262
  %r268 = load i32, i32* %r157
  %r160 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r258
  %r269 = load i32, i32* %r160
  %r163 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r258
  %r164 = getelementptr %array2D, %array2D* %r163, i32 0, i32 0
  %r166 = getelementptr [16 x i32 ], [16 x i32 ]* %r164, i32 0, i32 %r262
  %r270 = load i32, i32* %r166
  %r271 = add i32 %r269, %r270
  %r169 = icmp sgt i32 %r268, %r271
  br i1 %r169, label %bb21, label %bb22

bb21:
  %r171 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r258
  %r272 = load i32, i32* %r171
  %r174 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r258
  %r175 = getelementptr %array2D, %array2D* %r174, i32 0, i32 0
  %r177 = getelementptr [16 x i32 ], [16 x i32 ]* %r175, i32 0, i32 %r262
  %r273 = load i32, i32* %r177
  %r274 = add i32 %r272, %r273
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r262
  store i32 %r274, i32* %r181
  br label %bb23

bb22:
  br label %bb23

bb23:
  br label %bb20

bb19:
  br label %bb20

bb20:
  %r267 = add i32 %r262, 1
  br label %bb15

bb17:
  %r264 = add i32 %r251, 1
  br label %bb5

bb7:
  ret void
}

define i32 @main( ) {
bb24:
  %r288 = add i32 0, 0
  %r289 = add i32 0, 0
  %r290 = add i32 0, 0
  call void @_sysy_starttime(i32 53)
  %r291 = add i32 0, 0
  %r292 = call i32 @getint()
  store i32 %r292, i32* @n
  %r293 = call i32 @getint()
  store i32 %r293, i32* @m
  %r294 = add i32 1, 0
  br label %bb25

bb25:
  %r295 = phi i32 [ %r294, %bb24 ], [ %r312, %bb30 ]
  %r296 = load i32, i32* @n
  %r191 = icmp sle i32 %r295, %r296
  br i1 %r191, label %bb26, label %bb27

bb26:
  %r309 = add i32 1, 0
  br label %bb28

bb28:
  %r310 = phi i32 [ %r309, %bb26 ], [ %r313, %bb33 ]
  %r311 = load i32, i32* @n
  %r195 = icmp sle i32 %r310, %r311
  br i1 %r195, label %bb29, label %bb30

bb29:
  %r198 = icmp eq i32 %r295, %r310
  br i1 %r198, label %bb31, label %bb32

bb31:
  %r200 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r295
  %r201 = getelementptr %array2D, %array2D* %r200, i32 0, i32 0
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r201, i32 0, i32 %r310
  store i32 0, i32* %r203
  br label %bb33

bb32:
  %r314 = load i32, i32* @INF
  %r206 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r295
  %r207 = getelementptr %array2D, %array2D* %r206, i32 0, i32 0
  %r209 = getelementptr [16 x i32 ], [16 x i32 ]* %r207, i32 0, i32 %r310
  store i32 %r314, i32* %r209
  br label %bb33

bb33:
  %r313 = add i32 %r310, 1
  br label %bb28

bb30:
  %r312 = add i32 %r295, 1
  br label %bb25

bb27:
  %r297 = add i32 1, 0
  br label %bb34

bb34:
  %r298 = phi i32 [ %r297, %bb27 ], [ %r308, %bb35 ]
  %r299 = load i32, i32* @m
  %r216 = icmp sle i32 %r298, %r299
  br i1 %r216, label %bb35, label %bb36

bb35:
  %r305 = call i32 @getint()
  %r306 = call i32 @getint()
  %r307 = call i32 @getint()
  %r223 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r305
  %r224 = getelementptr %array2D, %array2D* %r223, i32 0, i32 0
  %r226 = getelementptr [16 x i32 ], [16 x i32 ]* %r224, i32 0, i32 %r306
  store i32 %r307, i32* %r226
  %r308 = add i32 %r298, 1
  br label %bb34

bb36:
  call void @Dijkstra()
  %r300 = add i32 1, 0
  br label %bb37

bb37:
  %r301 = phi i32 [ %r300, %bb36 ], [ %r304, %bb38 ]
  %r302 = load i32, i32* @n
  %r231 = icmp sle i32 %r301, %r302
  br i1 %r231, label %bb38, label %bb39

bb38:
  %r233 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r301
  %r303 = load i32, i32* %r233
  call void @putint(i32 %r303)
  call void @putch(i32 32)
  %r304 = add i32 %r301, 1
  br label %bb37

bb39:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 91)
  ret i32 0
}

