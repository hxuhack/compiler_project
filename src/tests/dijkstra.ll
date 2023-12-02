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
  %r144 = alloca i32
  %r123 = alloca i32
  %r122 = alloca i32
  %r120 = alloca i32
  %r100 = alloca i32
  store i32 1, i32* %r100
  br label %bb2

bb2:
  %r101 = load i32, i32* %r100
  %r102 = load i32, i32* @n
  %r103 = icmp sle i32 %r101, %r102
  br i1 %r103, label %bb3, label %bb4

bb3:
  %r104 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r105 = getelementptr %array2D, %array2D* %r104, i32 0, i32 0
  %r106 = load i32, i32* %r100
  %r107 = getelementptr [16 x i32 ], [16 x i32 ]* %r105, i32 0, i32 %r106
  %r108 = load i32, i32* %r107
  %r109 = load i32, i32* %r100
  %r110 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r109
  store i32 %r108, i32* %r110
  %r111 = load i32, i32* %r100
  %r112 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r111
  store i32 0, i32* %r112
  %r113 = load i32, i32* %r100
  %r114 = add i32 %r113, 1
  store i32 %r114, i32* %r100
  br label %bb2

bb4:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  store i32 1, i32* %r100
  br label %bb5

bb5:
  %r116 = load i32, i32* %r100
  %r117 = load i32, i32* @n
  %r118 = sub i32 %r117, 1
  %r119 = icmp sle i32 %r116, %r118
  br i1 %r119, label %bb6, label %bb7

bb6:
  %r121 = load i32, i32* @INF
  store i32 %r121, i32* %r120
  store i32 0, i32* %r122
  store i32 1, i32* %r123
  br label %bb8

bb8:
  %r124 = load i32, i32* %r123
  %r125 = load i32, i32* @n
  %r126 = icmp sle i32 %r124, %r125
  br i1 %r126, label %bb9, label %bb10

bb9:
  %r127 = load i32, i32* %r120
  %r128 = load i32, i32* %r123
  %r129 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r128
  %r130 = load i32, i32* %r129
  %r131 = icmp sgt i32 %r127, %r130
  br i1 %r131, label %bb14, label %bb12

bb14:
  %r132 = load i32, i32* %r123
  %r133 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r132
  %r134 = load i32, i32* %r133
  %r135 = icmp eq i32 %r134, 0
  br i1 %r135, label %bb11, label %bb12

bb11:
  %r136 = load i32, i32* %r123
  %r137 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r136
  %r138 = load i32, i32* %r137
  store i32 %r138, i32* %r120
  %r139 = load i32, i32* %r123
  store i32 %r139, i32* %r122
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r140 = load i32, i32* %r123
  %r141 = add i32 %r140, 1
  store i32 %r141, i32* %r123
  br label %bb8

bb10:
  %r142 = load i32, i32* %r122
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r142
  store i32 1, i32* %r143
  store i32 1, i32* %r144
  br label %bb15

bb15:
  %r145 = load i32, i32* %r144
  %r146 = load i32, i32* @n
  %r147 = icmp sle i32 %r145, %r146
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r148 = load i32, i32* %r122
  %r149 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r148
  %r150 = getelementptr %array2D, %array2D* %r149, i32 0, i32 0
  %r151 = load i32, i32* %r144
  %r152 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r151
  %r153 = load i32, i32* %r152
  %r154 = load i32, i32* @INF
  %r155 = icmp slt i32 %r153, %r154
  br i1 %r155, label %bb18, label %bb19

bb18:
  %r156 = load i32, i32* %r144
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r156
  %r158 = load i32, i32* %r157
  %r159 = load i32, i32* %r122
  %r160 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r159
  %r161 = load i32, i32* %r160
  %r162 = load i32, i32* %r122
  %r163 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r162
  %r164 = getelementptr %array2D, %array2D* %r163, i32 0, i32 0
  %r165 = load i32, i32* %r144
  %r166 = getelementptr [16 x i32 ], [16 x i32 ]* %r164, i32 0, i32 %r165
  %r167 = load i32, i32* %r166
  %r168 = add i32 %r161, %r167
  %r169 = icmp sgt i32 %r158, %r168
  br i1 %r169, label %bb21, label %bb22

bb21:
  %r170 = load i32, i32* %r122
  %r171 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r170
  %r172 = load i32, i32* %r171
  %r173 = load i32, i32* %r122
  %r174 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r173
  %r175 = getelementptr %array2D, %array2D* %r174, i32 0, i32 0
  %r176 = load i32, i32* %r144
  %r177 = getelementptr [16 x i32 ], [16 x i32 ]* %r175, i32 0, i32 %r176
  %r178 = load i32, i32* %r177
  %r179 = add i32 %r172, %r178
  %r180 = load i32, i32* %r144
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r180
  store i32 %r179, i32* %r181
  br label %bb23

bb22:
  br label %bb23

bb23:
  br label %bb20

bb19:
  br label %bb20

bb20:
  %r182 = load i32, i32* %r144
  %r183 = add i32 %r182, 1
  store i32 %r183, i32* %r144
  br label %bb15

bb17:
  %r184 = load i32, i32* %r100
  %r185 = add i32 %r184, 1
  store i32 %r185, i32* %r100
  br label %bb5

bb7:
  ret void
}

define i32 @main( ) {
bb24:
  %r219 = alloca i32
  %r217 = alloca i32
  %r192 = alloca i32
  %r186 = alloca i32
  %r187 = call i32 @getint()
  store i32 %r187, i32* @n
  %r188 = call i32 @getint()
  store i32 %r188, i32* @m
  store i32 1, i32* %r186
  br label %bb25

bb25:
  %r189 = load i32, i32* %r186
  %r190 = load i32, i32* @n
  %r191 = icmp sle i32 %r189, %r190
  br i1 %r191, label %bb26, label %bb27

bb26:
  store i32 1, i32* %r192
  br label %bb28

bb28:
  %r193 = load i32, i32* %r192
  %r194 = load i32, i32* @n
  %r195 = icmp sle i32 %r193, %r194
  br i1 %r195, label %bb29, label %bb30

bb29:
  %r196 = load i32, i32* %r186
  %r197 = load i32, i32* %r192
  %r198 = icmp eq i32 %r196, %r197
  br i1 %r198, label %bb31, label %bb32

bb31:
  %r199 = load i32, i32* %r186
  %r200 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r199
  %r201 = getelementptr %array2D, %array2D* %r200, i32 0, i32 0
  %r202 = load i32, i32* %r192
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r201, i32 0, i32 %r202
  store i32 0, i32* %r203
  br label %bb33

bb32:
  %r204 = load i32, i32* @INF
  %r205 = load i32, i32* %r186
  %r206 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r205
  %r207 = getelementptr %array2D, %array2D* %r206, i32 0, i32 0
  %r208 = load i32, i32* %r192
  %r209 = getelementptr [16 x i32 ], [16 x i32 ]* %r207, i32 0, i32 %r208
  store i32 %r204, i32* %r209
  br label %bb33

bb33:
  %r210 = load i32, i32* %r192
  %r211 = add i32 %r210, 1
  store i32 %r211, i32* %r192
  br label %bb28

bb30:
  %r212 = load i32, i32* %r186
  %r213 = add i32 %r212, 1
  store i32 %r213, i32* %r186
  br label %bb25

bb27:
  store i32 1, i32* %r186
  br label %bb34

bb34:
  %r214 = load i32, i32* %r186
  %r215 = load i32, i32* @m
  %r216 = icmp sle i32 %r214, %r215
  br i1 %r216, label %bb35, label %bb36

bb35:
  %r218 = call i32 @getint()
  store i32 %r218, i32* %r217
  %r220 = call i32 @getint()
  store i32 %r220, i32* %r219
  %r221 = call i32 @getint()
  %r222 = load i32, i32* %r217
  %r223 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r222
  %r224 = getelementptr %array2D, %array2D* %r223, i32 0, i32 0
  %r225 = load i32, i32* %r219
  %r226 = getelementptr [16 x i32 ], [16 x i32 ]* %r224, i32 0, i32 %r225
  store i32 %r221, i32* %r226
  %r227 = load i32, i32* %r186
  %r228 = add i32 %r227, 1
  store i32 %r228, i32* %r186
  br label %bb34

bb36:
  call void @Dijkstra()
  store i32 1, i32* %r186
  br label %bb37

bb37:
  %r229 = load i32, i32* %r186
  %r230 = load i32, i32* @n
  %r231 = icmp sle i32 %r229, %r230
  br i1 %r231, label %bb38, label %bb39

bb38:
  %r232 = load i32, i32* %r186
  %r233 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r232
  %r234 = load i32, i32* %r233
  call void @putint(i32 %r234)
  call void @putch(i32 32)
  %r235 = load i32, i32* %r186
  %r236 = add i32 %r235, 1
  store i32 %r236, i32* %r186
  br label %bb37

bb39:
  call void @putch(i32 10)
  ret i32 0
}

