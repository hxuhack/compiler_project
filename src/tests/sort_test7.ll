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
  %r148 = alloca i32
  %r120 = alloca i32
  %r119 = alloca i32
  %r118 = alloca i32
  %r117 = alloca [ 10 x i32 ]
  %r116 = alloca [ 10 x i32 ]
  %r112 = alloca i32
  %r107 = alloca i32
  %r102 = alloca i32
  store i32 %r101, i32* %r102
  %r104 = alloca i32
  store i32 %r103, i32* %r104
  %r106 = alloca i32
  store i32 %r105, i32* %r106
  br label %bb1

bb1:
  %r108 = load i32, i32* %r104
  %r109 = load i32, i32* %r102
  %r110 = sub i32 %r108, %r109
  %r111 = add i32 %r110, 1
  store i32 %r111, i32* %r107
  %r113 = load i32, i32* %r106
  %r114 = load i32, i32* %r104
  %r115 = sub i32 %r113, %r114
  store i32 %r115, i32* %r112
  store i32 0, i32* %r118
  store i32 0, i32* %r119
  br label %bb2

bb2:
  %r121 = load i32, i32* %r118
  %r122 = load i32, i32* %r107
  %r123 = icmp slt i32 %r121, %r122
  br i1 %r123, label %bb3, label %bb4

bb3:
  %r124 = load i32, i32* %r118
  %r125 = load i32, i32* %r102
  %r126 = add i32 %r124, %r125
  store i32 %r126, i32* %r120
  %r127 = load i32, i32* %r120
  %r128 = getelementptr i32, i32* %r100, i32 %r127
  %r129 = load i32, i32* %r128
  %r130 = load i32, i32* %r118
  %r131 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r130
  store i32 %r129, i32* %r131
  %r132 = load i32, i32* %r118
  %r133 = add i32 %r132, 1
  store i32 %r133, i32* %r118
  br label %bb2

bb4:
  br label %bb5

bb5:
  %r134 = load i32, i32* %r119
  %r135 = load i32, i32* %r112
  %r136 = icmp slt i32 %r134, %r135
  br i1 %r136, label %bb6, label %bb7

bb6:
  %r137 = load i32, i32* %r119
  %r138 = load i32, i32* %r104
  %r139 = add i32 %r137, %r138
  %r140 = add i32 %r139, 1
  store i32 %r140, i32* %r120
  %r141 = load i32, i32* %r120
  %r142 = getelementptr i32, i32* %r100, i32 %r141
  %r143 = load i32, i32* %r142
  %r144 = load i32, i32* %r119
  %r145 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r144
  store i32 %r143, i32* %r145
  %r146 = load i32, i32* %r119
  %r147 = add i32 %r146, 1
  store i32 %r147, i32* %r119
  br label %bb5

bb7:
  store i32 0, i32* %r118
  store i32 0, i32* %r119
  %r149 = load i32, i32* %r102
  store i32 %r149, i32* %r148
  br label %bb8

bb8:
  %r150 = load i32, i32* %r118
  %r151 = load i32, i32* %r107
  %r152 = icmp ne i32 %r150, %r151
  br i1 %r152, label %bb11, label %bb10

bb11:
  %r153 = load i32, i32* %r119
  %r154 = load i32, i32* %r112
  %r155 = icmp ne i32 %r153, %r154
  br i1 %r155, label %bb9, label %bb10

bb9:
  %r156 = load i32, i32* %r118
  %r157 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r156
  %r158 = load i32, i32* %r157
  %r159 = load i32, i32* %r119
  %r160 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r159
  %r161 = load i32, i32* %r160
  %r162 = add i32 %r161, 1
  %r163 = icmp slt i32 %r158, %r162
  br i1 %r163, label %bb12, label %bb13

bb12:
  %r164 = load i32, i32* %r118
  %r165 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r164
  %r166 = load i32, i32* %r165
  %r167 = load i32, i32* %r148
  %r168 = getelementptr i32, i32* %r100, i32 %r167
  store i32 %r166, i32* %r168
  %r169 = load i32, i32* %r148
  %r170 = add i32 %r169, 1
  store i32 %r170, i32* %r148
  %r171 = load i32, i32* %r118
  %r172 = add i32 %r171, 1
  store i32 %r172, i32* %r118
  br label %bb14

bb13:
  %r173 = load i32, i32* %r119
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r173
  %r175 = load i32, i32* %r174
  %r176 = load i32, i32* %r148
  %r177 = getelementptr i32, i32* %r100, i32 %r176
  store i32 %r175, i32* %r177
  %r178 = load i32, i32* %r148
  %r179 = add i32 %r178, 1
  store i32 %r179, i32* %r148
  %r180 = load i32, i32* %r119
  %r181 = add i32 %r180, 1
  store i32 %r181, i32* %r119
  br label %bb14

bb14:
  br label %bb8

bb10:
  br label %bb15

bb15:
  %r182 = load i32, i32* %r118
  %r183 = load i32, i32* %r107
  %r184 = icmp slt i32 %r182, %r183
  br i1 %r184, label %bb16, label %bb17

bb16:
  %r185 = load i32, i32* %r118
  %r186 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r185
  %r187 = load i32, i32* %r186
  %r188 = load i32, i32* %r148
  %r189 = getelementptr i32, i32* %r100, i32 %r188
  store i32 %r187, i32* %r189
  %r190 = load i32, i32* %r148
  %r191 = add i32 %r190, 1
  store i32 %r191, i32* %r148
  %r192 = load i32, i32* %r118
  %r193 = add i32 %r192, 1
  store i32 %r193, i32* %r118
  br label %bb15

bb17:
  br label %bb18

bb18:
  %r194 = load i32, i32* %r119
  %r195 = load i32, i32* %r112
  %r196 = icmp slt i32 %r194, %r195
  br i1 %r196, label %bb19, label %bb20

bb19:
  %r197 = load i32, i32* %r119
  %r198 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r197
  %r199 = load i32, i32* %r198
  %r200 = load i32, i32* %r148
  %r201 = getelementptr i32, i32* %r100, i32 %r200
  store i32 %r199, i32* %r201
  %r202 = load i32, i32* %r148
  %r203 = add i32 %r202, 1
  store i32 %r203, i32* %r148
  %r204 = load i32, i32* %r119
  %r205 = add i32 %r204, 1
  store i32 %r205, i32* %r119
  br label %bb18

bb20:
  ret i32 0
}

define i32 @MergeSort( i32* %r206, i32 %r207, i32 %r209 ) {
bb30:
  %r219 = alloca i32
  %r214 = alloca i32
  %r208 = alloca i32
  store i32 %r207, i32* %r208
  %r210 = alloca i32
  store i32 %r209, i32* %r210
  br label %bb21

bb21:
  %r211 = load i32, i32* %r208
  %r212 = load i32, i32* %r210
  %r213 = icmp slt i32 %r211, %r212
  br i1 %r213, label %bb22, label %bb23

bb22:
  %r215 = load i32, i32* %r208
  %r216 = load i32, i32* %r210
  %r217 = add i32 %r215, %r216
  %r218 = sdiv i32 %r217, 2
  store i32 %r218, i32* %r214
  %r220 = load i32, i32* %r208
  %r221 = load i32, i32* %r214
  %r222 = call i32 @MergeSort(i32* %r206, i32 %r220, i32 %r221)
  store i32 %r222, i32* %r219
  %r223 = load i32, i32* %r214
  %r224 = add i32 %r223, 1
  store i32 %r224, i32* %r219
  %r225 = load i32, i32* %r219
  %r226 = load i32, i32* %r210
  %r227 = call i32 @MergeSort(i32* %r206, i32 %r225, i32 %r226)
  store i32 %r227, i32* %r219
  %r228 = load i32, i32* %r208
  %r229 = load i32, i32* %r214
  %r230 = load i32, i32* %r210
  %r231 = call i32 @Merge(i32* %r206, i32 %r228, i32 %r229, i32 %r230)
  store i32 %r231, i32* %r219
  br label %bb24

bb23:
  br label %bb24

bb24:
  ret i32 0
}

define i32 @main( ) {
bb25:
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
  %r243 = alloca i32
  store i32 0, i32* %r243
  %r244 = alloca i32
  %r245 = load i32, i32* @n
  %r246 = sub i32 %r245, 1
  store i32 %r246, i32* %r244
  %r247 = load i32, i32* %r243
  %r248 = load i32, i32* %r244
  %r249 = call i32 @MergeSort(i32* %r232, i32 %r247, i32 %r248)
  store i32 %r249, i32* %r243
  br label %bb26

bb26:
  %r250 = load i32, i32* %r243
  %r251 = load i32, i32* @n
  %r252 = icmp slt i32 %r250, %r251
  br i1 %r252, label %bb27, label %bb28

bb27:
  %r253 = load i32, i32* %r243
  %r254 = getelementptr [10 x i32 ], [10 x i32 ]* %r232, i32 0, i32 %r253
  %r255 = load i32, i32* %r254
  store i32 %r255, i32* %r244
  %r256 = load i32, i32* %r244
  call void @putint(i32 %r256)
  store i32 10, i32* %r244
  %r257 = load i32, i32* %r244
  call void @putch(i32 %r257)
  %r258 = load i32, i32* %r243
  %r259 = add i32 %r258, 1
  store i32 %r259, i32* %r243
  br label %bb26

bb28:
  ret i32 0
}

