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
@vis = global [ 1005 x i32 ] zeroinitializer
define i32 @quickread( ) {
bb1:
  %r232 = add i32 0, 0
  %r233 = call i32 @getch()
  %r234 = add i32 0, 0
  %r235 = add i32 0, 0
  %r236 = add i32 0, 0
  %r237 = add i32 0, 0
  br label %bb2

bb2:
  %r238 = phi i32 [ %r237, %bb1 ], [ %r240, %bb8 ]
  %r239 = phi i32 [ %r233, %bb1 ], [ %r241, %bb8 ]
  %r105 = icmp slt i32 %r239, 48
  br i1 %r105, label %bb3, label %bb5

bb5:
  %r107 = icmp sgt i32 %r239, 57
  br i1 %r107, label %bb3, label %bb4

bb3:
  %r109 = icmp eq i32 %r239, 45
  br i1 %r109, label %bb6, label %bb7

bb6:
  %r242 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r240 = phi i32 [ %r242, %bb6 ], [ %r238, %bb7 ]
  %r241 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r243 = phi i32 [ %r235, %bb4 ], [ %r248, %bb10 ]
  %r244 = phi i32 [ %r239, %bb4 ], [ %r249, %bb10 ]
  %r112 = icmp sge i32 %r244, 48
  br i1 %r112, label %bb12, label %bb11

bb12:
  %r114 = icmp sle i32 %r244, 57
  br i1 %r114, label %bb10, label %bb11

bb10:
  %r246 = mul i32 %r243, 10
  %r247 = add i32 %r246, %r244
  %r248 = sub i32 %r247, 48
  %r249 = call i32 @getch()
  br label %bb9

bb11:
  %r122 = icmp ne i32 %r238, 0
  br i1 %r122, label %bb13, label %bb14

bb13:
  %r245 = sub i32 0, %r243
  ret i32 %r245
bb14:
  ret i32 %r243
}

define void @addedge( i32 %r126, i32 %r128 ) {
bb49:
  %r252 = add i32 0, 0
  %r253 = add i32 %r126, 0
  %r254 = add i32 0, 0
  %r255 = add i32 %r128, 0
  br label %bb16

bb16:
  %r256 = load i32, i32* @cnt
  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r256
  store i32 %r255, i32* %r132
  %r134 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r253
  %r257 = load i32, i32* %r134
  %r258 = load i32, i32* @cnt
  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r258
  store i32 %r257, i32* %r137
  %r259 = load i32, i32* @cnt
  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r253
  store i32 %r259, i32* %r140
  %r260 = load i32, i32* @cnt
  %r261 = add i32 %r260, 1
  store i32 %r261, i32* @cnt
  %r262 = load i32, i32* @cnt
  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r262
  store i32 %r253, i32* %r145
  %r147 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r255
  %r263 = load i32, i32* %r147
  %r264 = load i32, i32* @cnt
  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r264
  store i32 %r263, i32* %r150
  %r265 = load i32, i32* @cnt
  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r255
  store i32 %r265, i32* %r153
  %r266 = load i32, i32* @cnt
  %r267 = add i32 %r266, 1
  store i32 %r267, i32* @cnt
  ret void
}

define void @init( ) {
bb17:
  %r269 = add i32 0, 0
  %r270 = add i32 0, 0
  br label %bb18

bb18:
  %r271 = phi i32 [ %r270, %bb17 ], [ %r273, %bb19 ]
  %r158 = icmp slt i32 %r271, 1005
  br i1 %r158, label %bb19, label %bb20

bb19:
  %r272 = sub i32 0, 1
  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r271
  store i32 %r272, i32* %r161
  %r273 = add i32 %r271, 1
  br label %bb18

bb20:
  ret void
}

define void @clear( ) {
bb21:
  %r275 = add i32 0, 0
  %r276 = add i32 1, 0
  br label %bb22

bb22:
  %r277 = phi i32 [ %r276, %bb21 ], [ %r279, %bb23 ]
  %r278 = load i32, i32* @n
  %r167 = icmp sle i32 %r277, %r278
  br i1 %r167, label %bb23, label %bb24

bb23:
  %r169 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r277
  store i32 0, i32* %r169
  %r279 = add i32 %r277, 1
  br label %bb22

bb24:
  ret void
}

define i32 @same( i32 %r172, i32 %r174 ) {
bb50:
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r286 = add i32 0, 0
  %r287 = add i32 %r172, 0
  %r288 = add i32 0, 0
  %r289 = add i32 %r174, 0
  br label %bb25

bb25:
  %r177 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r287
  store i32 1, i32* %r177
  %r180 = icmp eq i32 %r287, %r289
  br i1 %r180, label %bb26, label %bb27

bb26:
  ret i32 1
bb27:
  br label %bb28

bb28:
  %r183 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r287
  %r290 = load i32, i32* %r183
  br label %bb29

bb29:
  %r291 = phi i32 [ %r290, %bb28 ], [ %r295, %bb34 ]
  %r292 = sub i32 0, 1
  %r187 = icmp ne i32 %r291, %r292
  br i1 %r187, label %bb30, label %bb31

bb30:
  %r190 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r291
  %r293 = load i32, i32* %r190
  %r193 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r293
  %r294 = load i32, i32* %r193
  %r195 = icmp eq i32 %r294, 0
  br i1 %r195, label %bb35, label %bb33

bb35:
  %r296 = call i32 @same(i32 %r293, i32 %r289)
  %r199 = icmp ne i32 %r296, 0
  br i1 %r199, label %bb32, label %bb33

bb32:
  ret i32 1
bb33:
  br label %bb34

bb34:
  %r201 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r291
  %r295 = load i32, i32* %r201
  br label %bb29

bb31:
  ret i32 0
}

define i32 @main( ) {
bb36:
  call void @_sysy_starttime(i32 74)
  %r300 = call i32 @quickread()
  store i32 %r300, i32* @n
  %r301 = call i32 @quickread()
  store i32 %r301, i32* @m
  call void @init()
  %r302 = add i32 0, 0
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 0, 0
  %r306 = add i32 0, 0
  %r307 = add i32 0, 0
  br label %bb37

bb37:
  %r308 = load i32, i32* @m
  %r209 = icmp ne i32 %r308, 0
  br i1 %r209, label %bb38, label %bb39

bb38:
  %r309 = call i32 @getch()
  br label %bb40

bb40:
  %r310 = phi i32 [ %r309, %bb38 ], [ %r318, %bb41 ]
  %r212 = icmp ne i32 %r310, 81
  br i1 %r212, label %bb43, label %bb42

bb43:
  %r214 = icmp ne i32 %r310, 85
  br i1 %r214, label %bb41, label %bb42

bb41:
  %r318 = call i32 @getch()
  br label %bb40

bb42:
  %r217 = icmp eq i32 %r310, 81
  br i1 %r217, label %bb44, label %bb45

bb44:
  %r315 = call i32 @quickread()
  %r316 = call i32 @quickread()
  call void @clear()
  %r317 = call i32 @same(i32 %r315, i32 %r316)
  call void @putint(i32 %r317)
  call void @putch(i32 10)
  br label %bb46

bb45:
  %r313 = call i32 @quickread()
  %r314 = call i32 @quickread()
  call void @addedge(i32 %r313, i32 %r314)
  br label %bb46

bb46:
  %r311 = load i32, i32* @m
  %r312 = sub i32 %r311, 1
  store i32 %r312, i32* @m
  br label %bb37

bb39:
  call void @_sysy_stoptime(i32 96)
  ret i32 0
}

