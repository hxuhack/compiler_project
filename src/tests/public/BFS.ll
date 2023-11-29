declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
@m = global i32 0
@to = global [ 5005 x i32 ] zeroinitializer
@next = global [ 5005 x i32 ] zeroinitializer
@head = global [ 1005 x i32 ] zeroinitializer
@cnt = global i32 0
@que = global [ 1005 x i32 ] zeroinitializer
@h = global i32 0
@tail = global i32 0
@inq = global [ 1005 x i32 ] zeroinitializer
define i32 @quickread( ) {
bb1:
  %r257 = add i32 0, 0
  %r258 = call i32 @getch()
  %r259 = add i32 0, 0
  %r260 = add i32 0, 0
  %r261 = add i32 0, 0
  %r262 = add i32 0, 0
  br label %bb2

bb2:
  %r263 = phi i32 [ %r262, %bb1 ], [ %r265, %bb8 ]
  %r264 = phi i32 [ %r258, %bb1 ], [ %r266, %bb8 ]
  %r105 = icmp slt i32 %r264, 48
  br i1 %r105, label %bb3, label %bb5

bb5:
  %r107 = icmp sgt i32 %r264, 57
  br i1 %r107, label %bb3, label %bb4

bb3:
  %r109 = icmp eq i32 %r264, 45
  br i1 %r109, label %bb6, label %bb7

bb6:
  %r267 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r265 = phi i32 [ %r267, %bb6 ], [ %r263, %bb7 ]
  %r266 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r268 = phi i32 [ %r260, %bb4 ], [ %r273, %bb10 ]
  %r269 = phi i32 [ %r264, %bb4 ], [ %r274, %bb10 ]
  %r112 = icmp sge i32 %r269, 48
  br i1 %r112, label %bb12, label %bb11

bb12:
  %r114 = icmp sle i32 %r269, 57
  br i1 %r114, label %bb10, label %bb11

bb10:
  %r271 = mul i32 %r268, 10
  %r272 = add i32 %r271, %r269
  %r273 = sub i32 %r272, 48
  %r274 = call i32 @getch()
  br label %bb9

bb11:
  %r122 = icmp ne i32 %r263, 0
  br i1 %r122, label %bb13, label %bb14

bb13:
  %r270 = sub i32 0, %r268
  ret i32 %r270
bb14:
  ret i32 %r268
}

define void @addedge( i32 %r126, i32 %r128 ) {
bb52:
  %r277 = add i32 0, 0
  %r278 = add i32 %r126, 0
  %r279 = add i32 0, 0
  %r280 = add i32 %r128, 0
  br label %bb16

bb16:
  %r281 = load i32, i32* @cnt
  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r281
  store i32 %r280, i32* %r132
  %r134 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r278
  %r282 = load i32, i32* %r134
  %r283 = load i32, i32* @cnt
  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r283
  store i32 %r282, i32* %r137
  %r284 = load i32, i32* @cnt
  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r278
  store i32 %r284, i32* %r140
  %r285 = load i32, i32* @cnt
  %r286 = add i32 %r285, 1
  store i32 %r286, i32* @cnt
  %r287 = load i32, i32* @cnt
  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r287
  store i32 %r278, i32* %r145
  %r147 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r280
  %r288 = load i32, i32* %r147
  %r289 = load i32, i32* @cnt
  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r289
  store i32 %r288, i32* %r150
  %r290 = load i32, i32* @cnt
  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r280
  store i32 %r290, i32* %r153
  %r291 = load i32, i32* @cnt
  %r292 = add i32 %r291, 1
  store i32 %r292, i32* @cnt
  ret void
}

define void @init( ) {
bb17:
  %r294 = add i32 0, 0
  %r295 = add i32 0, 0
  br label %bb18

bb18:
  %r296 = phi i32 [ %r295, %bb17 ], [ %r298, %bb19 ]
  %r158 = icmp slt i32 %r296, 1005
  br i1 %r158, label %bb19, label %bb20

bb19:
  %r297 = sub i32 0, 1
  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r296
  store i32 %r297, i32* %r161
  %r298 = add i32 %r296, 1
  br label %bb18

bb20:
  ret void
}

define void @inqueue( i32 %r164 ) {
bb53:
  %r300 = add i32 0, 0
  %r301 = add i32 %r164, 0
  br label %bb21

bb21:
  %r167 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r301
  store i32 1, i32* %r167
  %r302 = load i32, i32* @tail
  %r303 = add i32 %r302, 1
  store i32 %r303, i32* @tail
  %r304 = load i32, i32* @tail
  %r172 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r304
  store i32 %r301, i32* %r172
  ret void
}

define i32 @popqueue( ) {
bb22:
  %r306 = load i32, i32* @h
  %r307 = add i32 %r306, 1
  store i32 %r307, i32* @h
  %r308 = add i32 0, 0
  %r309 = load i32, i32* @h
  %r177 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r309
  %r310 = load i32, i32* %r177
  %r311 = load i32, i32* @h
  %r180 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r311
  %r312 = load i32, i32* %r180
  ret i32 %r312
}

define i32 @same( i32 %r182, i32 %r184 ) {
bb54:
  %r319 = add i32 0, 0
  %r320 = add i32 0, 0
  %r321 = add i32 0, 0
  %r322 = add i32 0, 0
  %r323 = add i32 0, 0
  %r324 = add i32 %r182, 0
  %r325 = add i32 0, 0
  %r326 = add i32 %r184, 0
  br label %bb23

bb23:
  store i32 0, i32* @h
  store i32 0, i32* @tail
  call void @inqueue(i32 %r324)
  %r327 = add i32 0, 0
  %r328 = add i32 0, 0
  %r329 = add i32 0, 0
  %r330 = add i32 0, 0
  br label %bb24

bb24:
  %r331 = phi i32 [ %r327, %bb23 ], [ %r340, %bb32 ]
  %r332 = load i32, i32* @h
  %r333 = load i32, i32* @tail
  %r193 = icmp slt i32 %r332, %r333
  br i1 %r193, label %bb25, label %bb26

bb25:
  %r339 = call i32 @popqueue()
  %r197 = icmp eq i32 %r339, %r326
  br i1 %r197, label %bb27, label %bb28

bb27:
  %r348 = add i32 1, 0
  br label %bb29

bb28:
  br label %bb29

bb29:
  %r340 = phi i32 [ %r348, %bb27 ], [ %r331, %bb28 ]
  %r199 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r339
  %r341 = load i32, i32* %r199
  br label %bb30

bb30:
  %r342 = phi i32 [ %r341, %bb29 ], [ %r346, %bb35 ]
  %r343 = sub i32 0, 1
  %r203 = icmp ne i32 %r342, %r343
  br i1 %r203, label %bb31, label %bb32

bb31:
  %r205 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r342
  %r344 = load i32, i32* %r205
  %r208 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r344
  %r345 = load i32, i32* %r208
  %r210 = icmp eq i32 %r345, 0
  br i1 %r210, label %bb33, label %bb34

bb33:
  %r212 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r342
  %r347 = load i32, i32* %r212
  call void @inqueue(i32 %r347)
  br label %bb35

bb34:
  br label %bb35

bb35:
  %r215 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r342
  %r346 = load i32, i32* %r215
  br label %bb30

bb32:
  br label %bb24

bb26:
  %r334 = add i32 0, 0
  br label %bb36

bb36:
  %r335 = phi i32 [ %r334, %bb26 ], [ %r338, %bb37 ]
  %r336 = load i32, i32* @tail
  %r219 = icmp sle i32 %r335, %r336
  br i1 %r219, label %bb37, label %bb38

bb37:
  %r221 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r335
  %r337 = load i32, i32* %r221
  %r224 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r337
  store i32 0, i32* %r224
  %r338 = add i32 %r335, 1
  br label %bb36

bb38:
  ret i32 %r331
}

define i32 @main( ) {
bb39:
  %r352 = call i32 @quickread()
  store i32 %r352, i32* @n
  %r353 = call i32 @quickread()
  store i32 %r353, i32* @m
  call void @_sysy_starttime(i32 97)
  call void @init()
  %r354 = add i32 0, 0
  %r355 = add i32 0, 0
  %r356 = add i32 0, 0
  %r357 = add i32 0, 0
  %r358 = add i32 0, 0
  %r359 = add i32 0, 0
  br label %bb40

bb40:
  %r360 = load i32, i32* @m
  %r234 = icmp ne i32 %r360, 0
  br i1 %r234, label %bb41, label %bb42

bb41:
  %r361 = call i32 @getch()
  br label %bb43

bb43:
  %r362 = phi i32 [ %r361, %bb41 ], [ %r370, %bb44 ]
  %r237 = icmp ne i32 %r362, 81
  br i1 %r237, label %bb46, label %bb45

bb46:
  %r239 = icmp ne i32 %r362, 85
  br i1 %r239, label %bb44, label %bb45

bb44:
  %r370 = call i32 @getch()
  br label %bb43

bb45:
  %r242 = icmp eq i32 %r362, 81
  br i1 %r242, label %bb47, label %bb48

bb47:
  %r367 = call i32 @quickread()
  %r368 = call i32 @quickread()
  %r369 = call i32 @same(i32 %r367, i32 %r368)
  call void @putint(i32 %r369)
  call void @putch(i32 10)
  br label %bb49

bb48:
  %r365 = call i32 @quickread()
  %r366 = call i32 @quickread()
  call void @addedge(i32 %r365, i32 %r366)
  br label %bb49

bb49:
  %r363 = load i32, i32* @m
  %r364 = sub i32 %r363, 1
  store i32 %r364, i32* @m
  br label %bb40

bb42:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

