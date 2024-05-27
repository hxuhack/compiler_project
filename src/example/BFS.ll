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
  %r254 = add i32 0, 0
  %r257 = call i32 @getch()
  %r255 = add i32 0, 0
  %r258 = add i32 0, 0
  %r256 = add i32 0, 0
  %r259 = add i32 0, 0
  br label %bb2

bb2:
  %r260 = phi i32 [ %r259, %bb1 ], [ %r262, %bb8 ]
  %r261 = phi i32 [ %r257, %bb1 ], [ %r263, %bb8 ]
  %r105 = icmp slt i32 %r261, 48
  br i1 %r105, label %bb3, label %bb5

bb5:
  %r107 = icmp sgt i32 %r261, 57
  br i1 %r107, label %bb3, label %bb4

bb3:
  %r109 = icmp eq i32 %r261, 45
  br i1 %r109, label %bb6, label %bb7

bb6:
  %r264 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r262 = phi i32 [ %r264, %bb6 ], [ %r260, %bb7 ]
  %r263 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r265 = phi i32 [ %r258, %bb4 ], [ %r267, %bb10 ]
  %r266 = phi i32 [ %r261, %bb4 ], [ %r268, %bb10 ]
  %r112 = icmp sge i32 %r266, 48
  br i1 %r112, label %bb12, label %bb11

bb12:
  %r114 = icmp sle i32 %r266, 57
  br i1 %r114, label %bb10, label %bb11

bb10:
  %r116 = mul i32 %r265, 10
  %r118 = add i32 %r116, %r266
  %r267 = sub i32 %r118, 48
  %r268 = call i32 @getch()
  br label %bb9

bb11:
  %r122 = icmp ne i32 %r260, 0
  br i1 %r122, label %bb13, label %bb14

bb13:
  %r123 = sub i32 0, %r265
  ret i32 %r123
bb14:
  ret i32 %r265
}

define void @addedge( i32 %r126, i32 %r128 ) {
bb52:
  %r269 = add i32 0, 0
  %r271 = add i32 %r126, 0
  %r270 = add i32 0, 0
  %r272 = add i32 %r128, 0
  %r131 = load i32, i32* @cnt
  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r131
  store i32 %r272, i32* %r132
  %r134 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r271
  %r135 = load i32, i32* %r134
  %r136 = load i32, i32* @cnt
  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r136
  store i32 %r135, i32* %r137
  %r138 = load i32, i32* @cnt
  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r271
  store i32 %r138, i32* %r140
  %r141 = load i32, i32* @cnt
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* @cnt
  %r144 = load i32, i32* @cnt
  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r144
  store i32 %r271, i32* %r145
  %r147 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r272
  %r148 = load i32, i32* %r147
  %r149 = load i32, i32* @cnt
  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r149
  store i32 %r148, i32* %r150
  %r151 = load i32, i32* @cnt
  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r272
  store i32 %r151, i32* %r153
  %r154 = load i32, i32* @cnt
  %r155 = add i32 %r154, 1
  store i32 %r155, i32* @cnt
  ret void
}

define void @init( ) {
bb17:
  %r273 = add i32 0, 0
  %r274 = add i32 0, 0
  br label %bb18

bb18:
  %r275 = phi i32 [ %r274, %bb17 ], [ %r276, %bb19 ]
  %r158 = icmp slt i32 %r275, 1005
  br i1 %r158, label %bb19, label %bb20

bb19:
  %r159 = sub i32 0, 1
  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r275
  store i32 %r159, i32* %r161
  %r276 = add i32 %r275, 1
  br label %bb18

bb20:
  ret void
}

define void @inqueue( i32 %r164 ) {
bb53:
  %r277 = add i32 0, 0
  %r278 = add i32 %r164, 0
  %r167 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r278
  store i32 1, i32* %r167
  %r168 = load i32, i32* @tail
  %r169 = add i32 %r168, 1
  store i32 %r169, i32* @tail
  %r171 = load i32, i32* @tail
  %r172 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r171
  store i32 %r278, i32* %r172
  ret void
}

define i32 @popqueue( ) {
bb22:
  %r173 = load i32, i32* @h
  %r174 = add i32 %r173, 1
  store i32 %r174, i32* @h
  %r279 = add i32 0, 0
  %r176 = load i32, i32* @h
  %r177 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r176
  %r280 = load i32, i32* %r177
  %r179 = load i32, i32* @h
  %r180 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r179
  %r181 = load i32, i32* %r180
  ret i32 %r181
}

define i32 @same( i32 %r182, i32 %r184 ) {
bb54:
  %r281 = add i32 0, 0
  %r282 = add i32 0, 0
  %r283 = add i32 0, 0
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r287 = add i32 %r182, 0
  %r286 = add i32 0, 0
  %r288 = add i32 %r184, 0
  store i32 0, i32* @h
  store i32 0, i32* @tail
  call void @inqueue(i32 %r287)
  %r289 = add i32 0, 0
  %r290 = add i32 0, 0
  %r291 = add i32 0, 0
  %r292 = add i32 0, 0
  br label %bb24

bb24:
  %r293 = phi i32 [ %r289, %bb54 ], [ %r299, %bb32 ]
  %r191 = load i32, i32* @h
  %r192 = load i32, i32* @tail
  %r193 = icmp slt i32 %r191, %r192
  br i1 %r193, label %bb25, label %bb26

bb25:
  %r298 = call i32 @popqueue()
  %r197 = icmp eq i32 %r298, %r288
  br i1 %r197, label %bb27, label %bb28

bb27:
  %r304 = add i32 1, 0
  br label %bb29

bb28:
  br label %bb29

bb29:
  %r299 = phi i32 [ %r304, %bb27 ], [ %r293, %bb28 ]
  %r199 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r298
  %r300 = load i32, i32* %r199
  br label %bb30

bb30:
  %r301 = phi i32 [ %r300, %bb29 ], [ %r303, %bb35 ]
  %r202 = sub i32 0, 1
  %r203 = icmp ne i32 %r301, %r202
  br i1 %r203, label %bb31, label %bb32

bb31:
  %r205 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r301
  %r302 = load i32, i32* %r205
  %r208 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r302
  %r209 = load i32, i32* %r208
  %r210 = icmp eq i32 %r209, 0
  br i1 %r210, label %bb33, label %bb34

bb33:
  %r212 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r301
  %r213 = load i32, i32* %r212
  call void @inqueue(i32 %r213)
  br label %bb35

bb34:
  br label %bb35

bb35:
  %r215 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r301
  %r303 = load i32, i32* %r215
  br label %bb30

bb32:
  br label %bb24

bb26:
  %r294 = add i32 0, 0
  br label %bb36

bb36:
  %r295 = phi i32 [ %r294, %bb26 ], [ %r297, %bb37 ]
  %r218 = load i32, i32* @tail
  %r219 = icmp sle i32 %r295, %r218
  br i1 %r219, label %bb37, label %bb38

bb37:
  %r221 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r295
  %r296 = load i32, i32* %r221
  %r224 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r296
  store i32 0, i32* %r224
  %r297 = add i32 %r295, 1
  br label %bb36

bb38:
  ret i32 %r293
}

define i32 @main( ) {
bb39:
  %r228 = call i32 @quickread()
  store i32 %r228, i32* @n
  %r229 = call i32 @quickread()
  store i32 %r229, i32* @m
  call void @_sysy_starttime(i32 97)
  call void @init()
  %r305 = add i32 0, 0
  %r308 = add i32 0, 0
  %r306 = add i32 0, 0
  %r309 = add i32 0, 0
  %r307 = add i32 0, 0
  %r310 = add i32 0, 0
  br label %bb40

bb40:
  %r233 = load i32, i32* @m
  %r234 = icmp ne i32 %r233, 0
  br i1 %r234, label %bb41, label %bb42

bb41:
  %r311 = call i32 @getch()
  br label %bb43

bb43:
  %r312 = phi i32 [ %r311, %bb41 ], [ %r317, %bb44 ]
  %r237 = icmp ne i32 %r312, 81
  br i1 %r237, label %bb46, label %bb45

bb46:
  %r239 = icmp ne i32 %r312, 85
  br i1 %r239, label %bb44, label %bb45

bb44:
  %r317 = call i32 @getch()
  br label %bb43

bb45:
  %r242 = icmp eq i32 %r312, 81
  br i1 %r242, label %bb47, label %bb48

bb47:
  %r315 = call i32 @quickread()
  %r316 = call i32 @quickread()
  %r247 = call i32 @same(i32 %r315, i32 %r316)
  call void @putint(i32 %r247)
  call void @putch(i32 10)
  br label %bb49

bb48:
  %r313 = call i32 @quickread()
  %r314 = call i32 @quickread()
  call void @addedge(i32 %r313, i32 %r314)
  br label %bb49

bb49:
  %r252 = load i32, i32* @m
  %r253 = sub i32 %r252, 1
  store i32 %r253, i32* @m
  br label %bb40

bb42:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

