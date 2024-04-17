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
  %r237 = add i32 0, 0
  %r238 = add i32 0, 0
  %r239 = add i32 0, 0
  %r240 = add i32 0, 0
  %r241 = add i32 0, 0
  %r242 = add i32 1, 0
  br label %bb2

bb2:
  %r243 = phi i32 [ %r242, %bb1 ], [ %r261, %bb3 ]
  %r102 = load i32, i32* @n
  %r103 = icmp sle i32 %r243, %r102
  br i1 %r103, label %bb3, label %bb4

bb3:
  %r104 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r105 = getelementptr %array2D, %array2D* %r104, i32 0, i32 0
  %r107 = getelementptr [16 x i32 ], [16 x i32 ]* %r105, i32 0, i32 %r243
  %r108 = load i32, i32* %r107
  %r110 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r243
  store i32 %r108, i32* %r110
  %r112 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r243
  store i32 0, i32* %r112
  %r261 = add i32 %r243, 1
  br label %bb2

bb4:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  %r244 = add i32 1, 0
  br label %bb5

bb5:
  %r245 = phi i32 [ %r244, %bb4 ], [ %r254, %bb17 ]
  %r117 = load i32, i32* @n
  %r118 = sub i32 %r117, 1
  %r119 = icmp sle i32 %r245, %r118
  br i1 %r119, label %bb6, label %bb7

bb6:
  %r246 = load i32, i32* @INF
  %r247 = add i32 0, 0
  %r248 = add i32 1, 0
  br label %bb8

bb8:
  %r249 = phi i32 [ %r248, %bb6 ], [ %r258, %bb13 ]
  %r250 = phi i32 [ %r247, %bb6 ], [ %r256, %bb13 ]
  %r251 = phi i32 [ %r246, %bb6 ], [ %r257, %bb13 ]
  %r125 = load i32, i32* @n
  %r126 = icmp sle i32 %r249, %r125
  br i1 %r126, label %bb9, label %bb10

bb9:
  %r129 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r249
  %r130 = load i32, i32* %r129
  %r131 = icmp sgt i32 %r251, %r130
  br i1 %r131, label %bb14, label %bb12

bb14:
  %r133 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r249
  %r134 = load i32, i32* %r133
  %r135 = icmp eq i32 %r134, 0
  br i1 %r135, label %bb11, label %bb12

bb11:
  %r137 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r249
  %r259 = load i32, i32* %r137
  %r260 = add i32 %r249, 0
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r256 = phi i32 [ %r260, %bb11 ], [ %r250, %bb12 ]
  %r257 = phi i32 [ %r259, %bb11 ], [ %r251, %bb12 ]
  %r258 = add i32 %r249, 1
  br label %bb8

bb10:
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r250
  store i32 1, i32* %r143
  %r252 = add i32 1, 0
  br label %bb15

bb15:
  %r253 = phi i32 [ %r252, %bb10 ], [ %r255, %bb20 ]
  %r146 = load i32, i32* @n
  %r147 = icmp sle i32 %r253, %r146
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r149 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r250
  %r150 = getelementptr %array2D, %array2D* %r149, i32 0, i32 0
  %r152 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r253
  %r153 = load i32, i32* %r152
  %r154 = load i32, i32* @INF
  %r155 = icmp slt i32 %r153, %r154
  br i1 %r155, label %bb18, label %bb19

bb18:
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r253
  %r158 = load i32, i32* %r157
  %r160 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r250
  %r161 = load i32, i32* %r160
  %r163 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r250
  %r164 = getelementptr %array2D, %array2D* %r163, i32 0, i32 0
  %r166 = getelementptr [16 x i32 ], [16 x i32 ]* %r164, i32 0, i32 %r253
  %r167 = load i32, i32* %r166
  %r168 = add i32 %r161, %r167
  %r169 = icmp sgt i32 %r158, %r168
  br i1 %r169, label %bb21, label %bb22

bb21:
  %r171 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r250
  %r172 = load i32, i32* %r171
  %r174 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r250
  %r175 = getelementptr %array2D, %array2D* %r174, i32 0, i32 0
  %r177 = getelementptr [16 x i32 ], [16 x i32 ]* %r175, i32 0, i32 %r253
  %r178 = load i32, i32* %r177
  %r179 = add i32 %r172, %r178
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r253
  store i32 %r179, i32* %r181
  br label %bb23

bb22:
  br label %bb23

bb23:
  br label %bb20

bb19:
  br label %bb20

bb20:
  %r255 = add i32 %r253, 1
  br label %bb15

bb17:
  %r254 = add i32 %r245, 1
  br label %bb5

bb7:
  ret void
}

define i32 @main( ) {
bb24:
  %r262 = add i32 0, 0
  %r263 = add i32 0, 0
  %r264 = add i32 0, 0
  call void @_sysy_starttime(i32 53)
  %r265 = add i32 0, 0
  %r187 = call i32 @getint()
  store i32 %r187, i32* @n
  %r188 = call i32 @getint()
  store i32 %r188, i32* @m
  %r266 = add i32 1, 0
  br label %bb25

bb25:
  %r267 = phi i32 [ %r266, %bb24 ], [ %r278, %bb30 ]
  %r190 = load i32, i32* @n
  %r191 = icmp sle i32 %r267, %r190
  br i1 %r191, label %bb26, label %bb27

bb26:
  %r276 = add i32 1, 0
  br label %bb28

bb28:
  %r277 = phi i32 [ %r276, %bb26 ], [ %r279, %bb33 ]
  %r194 = load i32, i32* @n
  %r195 = icmp sle i32 %r277, %r194
  br i1 %r195, label %bb29, label %bb30

bb29:
  %r198 = icmp eq i32 %r267, %r277
  br i1 %r198, label %bb31, label %bb32

bb31:
  %r200 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r267
  %r201 = getelementptr %array2D, %array2D* %r200, i32 0, i32 0
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r201, i32 0, i32 %r277
  store i32 0, i32* %r203
  br label %bb33

bb32:
  %r204 = load i32, i32* @INF
  %r206 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r267
  %r207 = getelementptr %array2D, %array2D* %r206, i32 0, i32 0
  %r209 = getelementptr [16 x i32 ], [16 x i32 ]* %r207, i32 0, i32 %r277
  store i32 %r204, i32* %r209
  br label %bb33

bb33:
  %r279 = add i32 %r277, 1
  br label %bb28

bb30:
  %r278 = add i32 %r267, 1
  br label %bb25

bb27:
  %r268 = add i32 1, 0
  br label %bb34

bb34:
  %r269 = phi i32 [ %r268, %bb27 ], [ %r275, %bb35 ]
  %r215 = load i32, i32* @m
  %r216 = icmp sle i32 %r269, %r215
  br i1 %r216, label %bb35, label %bb36

bb35:
  %r273 = call i32 @getint()
  %r274 = call i32 @getint()
  %r221 = call i32 @getint()
  %r223 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r273
  %r224 = getelementptr %array2D, %array2D* %r223, i32 0, i32 0
  %r226 = getelementptr [16 x i32 ], [16 x i32 ]* %r224, i32 0, i32 %r274
  store i32 %r221, i32* %r226
  %r275 = add i32 %r269, 1
  br label %bb34

bb36:
  call void @Dijkstra()
  %r270 = add i32 1, 0
  br label %bb37

bb37:
  %r271 = phi i32 [ %r270, %bb36 ], [ %r272, %bb38 ]
  %r230 = load i32, i32* @n
  %r231 = icmp sle i32 %r271, %r230
  br i1 %r231, label %bb38, label %bb39

bb38:
  %r233 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r271
  %r234 = load i32, i32* %r233
  call void @putint(i32 %r234)
  call void @putch(i32 32)
  %r272 = add i32 %r271, 1
  br label %bb37

bb39:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 91)
  ret i32 0
}

