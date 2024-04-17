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
  %r229 = add i32 0, 0
  %r232 = call i32 @getch()
  %r230 = add i32 0, 0
  %r233 = add i32 0, 0
  %r231 = add i32 0, 0
  %r234 = add i32 0, 0
  br label %bb2

bb2:
  %r235 = phi i32 [ %r234, %bb1 ], [ %r237, %bb8 ]
  %r236 = phi i32 [ %r232, %bb1 ], [ %r238, %bb8 ]
  %r105 = icmp slt i32 %r236, 48
  br i1 %r105, label %bb3, label %bb5

bb5:
  %r107 = icmp sgt i32 %r236, 57
  br i1 %r107, label %bb3, label %bb4

bb3:
  %r109 = icmp eq i32 %r236, 45
  br i1 %r109, label %bb6, label %bb7

bb6:
  %r239 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r237 = phi i32 [ %r239, %bb6 ], [ %r235, %bb7 ]
  %r238 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r240 = phi i32 [ %r233, %bb4 ], [ %r242, %bb10 ]
  %r241 = phi i32 [ %r236, %bb4 ], [ %r243, %bb10 ]
  %r112 = icmp sge i32 %r241, 48
  br i1 %r112, label %bb12, label %bb11

bb12:
  %r114 = icmp sle i32 %r241, 57
  br i1 %r114, label %bb10, label %bb11

bb10:
  %r116 = mul i32 %r240, 10
  %r118 = add i32 %r116, %r241
  %r242 = sub i32 %r118, 48
  %r243 = call i32 @getch()
  br label %bb9

bb11:
  %r122 = icmp ne i32 %r235, 0
  br i1 %r122, label %bb13, label %bb14

bb13:
  %r123 = sub i32 0, %r240
  ret i32 %r123
bb14:
  ret i32 %r240
}

define void @addedge( i32 %r126, i32 %r128 ) {
bb49:
  %r244 = add i32 0, 0
  %r246 = add i32 %r126, 0
  %r245 = add i32 0, 0
  %r247 = add i32 %r128, 0
  br label %bb16

bb16:
  %r131 = load i32, i32* @cnt
  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r131
  store i32 %r247, i32* %r132
  %r134 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r246
  %r135 = load i32, i32* %r134
  %r136 = load i32, i32* @cnt
  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r136
  store i32 %r135, i32* %r137
  %r138 = load i32, i32* @cnt
  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r246
  store i32 %r138, i32* %r140
  %r141 = load i32, i32* @cnt
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* @cnt
  %r144 = load i32, i32* @cnt
  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r144
  store i32 %r246, i32* %r145
  %r147 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r247
  %r148 = load i32, i32* %r147
  %r149 = load i32, i32* @cnt
  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r149
  store i32 %r148, i32* %r150
  %r151 = load i32, i32* @cnt
  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r247
  store i32 %r151, i32* %r153
  %r154 = load i32, i32* @cnt
  %r155 = add i32 %r154, 1
  store i32 %r155, i32* @cnt
  ret void
}

define void @init( ) {
bb17:
  %r248 = add i32 0, 0
  %r249 = add i32 0, 0
  br label %bb18

bb18:
  %r250 = phi i32 [ %r249, %bb17 ], [ %r251, %bb19 ]
  %r158 = icmp slt i32 %r250, 1005
  br i1 %r158, label %bb19, label %bb20

bb19:
  %r159 = sub i32 0, 1
  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r250
  store i32 %r159, i32* %r161
  %r251 = add i32 %r250, 1
  br label %bb18

bb20:
  ret void
}

define void @clear( ) {
bb21:
  %r252 = add i32 0, 0
  %r253 = add i32 1, 0
  br label %bb22

bb22:
  %r254 = phi i32 [ %r253, %bb21 ], [ %r255, %bb23 ]
  %r166 = load i32, i32* @n
  %r167 = icmp sle i32 %r254, %r166
  br i1 %r167, label %bb23, label %bb24

bb23:
  %r169 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r254
  store i32 0, i32* %r169
  %r255 = add i32 %r254, 1
  br label %bb22

bb24:
  ret void
}

define i32 @same( i32 %r172, i32 %r174 ) {
bb50:
  %r256 = add i32 0, 0
  %r257 = add i32 0, 0
  %r258 = add i32 0, 0
  %r260 = add i32 %r172, 0
  %r259 = add i32 0, 0
  %r261 = add i32 %r174, 0
  br label %bb25

bb25:
  %r177 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r260
  store i32 1, i32* %r177
  %r180 = icmp eq i32 %r260, %r261
  br i1 %r180, label %bb26, label %bb27

bb26:
  ret i32 1
bb27:
  br label %bb28

bb28:
  %r183 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r260
  %r262 = load i32, i32* %r183
  br label %bb29

bb29:
  %r263 = phi i32 [ %r262, %bb28 ], [ %r265, %bb34 ]
  %r186 = sub i32 0, 1
  %r187 = icmp ne i32 %r263, %r186
  br i1 %r187, label %bb30, label %bb31

bb30:
  %r190 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r263
  %r264 = load i32, i32* %r190
  %r193 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r264
  %r194 = load i32, i32* %r193
  %r195 = icmp eq i32 %r194, 0
  br i1 %r195, label %bb35, label %bb33

bb35:
  %r198 = call i32 @same(i32 %r264, i32 %r261)
  %r199 = icmp ne i32 %r198, 0
  br i1 %r199, label %bb32, label %bb33

bb32:
  ret i32 1
bb33:
  br label %bb34

bb34:
  %r201 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r263
  %r265 = load i32, i32* %r201
  br label %bb29

bb31:
  ret i32 0
}

define i32 @main( ) {
bb36:
  call void @_sysy_starttime(i32 74)
  %r203 = call i32 @quickread()
  store i32 %r203, i32* @n
  %r204 = call i32 @quickread()
  store i32 %r204, i32* @m
  call void @init()
  %r266 = add i32 0, 0
  %r269 = add i32 0, 0
  %r267 = add i32 0, 0
  %r270 = add i32 0, 0
  %r268 = add i32 0, 0
  %r271 = add i32 0, 0
  br label %bb37

bb37:
  %r208 = load i32, i32* @m
  %r209 = icmp ne i32 %r208, 0
  br i1 %r209, label %bb38, label %bb39

bb38:
  %r272 = call i32 @getch()
  br label %bb40

bb40:
  %r273 = phi i32 [ %r272, %bb38 ], [ %r278, %bb41 ]
  %r212 = icmp ne i32 %r273, 81
  br i1 %r212, label %bb43, label %bb42

bb43:
  %r214 = icmp ne i32 %r273, 85
  br i1 %r214, label %bb41, label %bb42

bb41:
  %r278 = call i32 @getch()
  br label %bb40

bb42:
  %r217 = icmp eq i32 %r273, 81
  br i1 %r217, label %bb44, label %bb45

bb44:
  %r276 = call i32 @quickread()
  %r277 = call i32 @quickread()
  call void @clear()
  %r222 = call i32 @same(i32 %r276, i32 %r277)
  call void @putint(i32 %r222)
  call void @putch(i32 10)
  br label %bb46

bb45:
  %r274 = call i32 @quickread()
  %r275 = call i32 @quickread()
  call void @addedge(i32 %r274, i32 %r275)
  br label %bb46

bb46:
  %r227 = load i32, i32* @m
  %r228 = sub i32 %r227, 1
  store i32 %r228, i32* @m
  br label %bb37

bb39:
  call void @_sysy_stoptime(i32 96)
  ret i32 0
}

