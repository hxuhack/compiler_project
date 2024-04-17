declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@M = global i32 0
@L = global i32 0
@N = global i32 0
define i32 @mul( i32* %r100, i32* %r101, i32* %r102, i32* %r103, i32* %r104, i32* %r105, i32* %r106, i32* %r107, i32* %r108 ) {
bb1:
  %r337 = add i32 0, 0
  %r338 = add i32 0, 0
  %r110 = getelementptr i32, i32* %r100, i32 0
  %r111 = load i32, i32* %r110
  %r112 = getelementptr i32, i32* %r103, i32 0
  %r113 = load i32, i32* %r112
  %r114 = mul i32 %r111, %r113
  %r115 = getelementptr i32, i32* %r100, i32 1
  %r116 = load i32, i32* %r115
  %r117 = getelementptr i32, i32* %r104, i32 0
  %r118 = load i32, i32* %r117
  %r119 = mul i32 %r116, %r118
  %r120 = add i32 %r114, %r119
  %r121 = getelementptr i32, i32* %r100, i32 2
  %r122 = load i32, i32* %r121
  %r123 = getelementptr i32, i32* %r105, i32 0
  %r124 = load i32, i32* %r123
  %r125 = mul i32 %r122, %r124
  %r126 = add i32 %r120, %r125
  %r127 = getelementptr i32, i32* %r106, i32 0
  store i32 %r126, i32* %r127
  %r128 = getelementptr i32, i32* %r100, i32 0
  %r129 = load i32, i32* %r128
  %r130 = getelementptr i32, i32* %r103, i32 1
  %r131 = load i32, i32* %r130
  %r132 = mul i32 %r129, %r131
  %r133 = getelementptr i32, i32* %r100, i32 1
  %r134 = load i32, i32* %r133
  %r135 = getelementptr i32, i32* %r104, i32 1
  %r136 = load i32, i32* %r135
  %r137 = mul i32 %r134, %r136
  %r138 = add i32 %r132, %r137
  %r139 = getelementptr i32, i32* %r100, i32 2
  %r140 = load i32, i32* %r139
  %r141 = getelementptr i32, i32* %r105, i32 1
  %r142 = load i32, i32* %r141
  %r143 = mul i32 %r140, %r142
  %r144 = add i32 %r138, %r143
  %r145 = getelementptr i32, i32* %r106, i32 1
  store i32 %r144, i32* %r145
  %r146 = getelementptr i32, i32* %r100, i32 0
  %r147 = load i32, i32* %r146
  %r148 = getelementptr i32, i32* %r103, i32 2
  %r149 = load i32, i32* %r148
  %r150 = mul i32 %r147, %r149
  %r151 = getelementptr i32, i32* %r100, i32 1
  %r152 = load i32, i32* %r151
  %r153 = getelementptr i32, i32* %r104, i32 2
  %r154 = load i32, i32* %r153
  %r155 = mul i32 %r152, %r154
  %r156 = add i32 %r150, %r155
  %r157 = getelementptr i32, i32* %r100, i32 2
  %r158 = load i32, i32* %r157
  %r159 = getelementptr i32, i32* %r105, i32 2
  %r160 = load i32, i32* %r159
  %r161 = mul i32 %r158, %r160
  %r162 = add i32 %r156, %r161
  %r163 = getelementptr i32, i32* %r106, i32 2
  store i32 %r162, i32* %r163
  %r164 = getelementptr i32, i32* %r101, i32 0
  %r165 = load i32, i32* %r164
  %r166 = getelementptr i32, i32* %r103, i32 0
  %r167 = load i32, i32* %r166
  %r168 = mul i32 %r165, %r167
  %r169 = getelementptr i32, i32* %r101, i32 1
  %r170 = load i32, i32* %r169
  %r171 = getelementptr i32, i32* %r104, i32 0
  %r172 = load i32, i32* %r171
  %r173 = mul i32 %r170, %r172
  %r174 = add i32 %r168, %r173
  %r175 = getelementptr i32, i32* %r101, i32 2
  %r176 = load i32, i32* %r175
  %r177 = getelementptr i32, i32* %r105, i32 0
  %r178 = load i32, i32* %r177
  %r179 = mul i32 %r176, %r178
  %r180 = add i32 %r174, %r179
  %r181 = getelementptr i32, i32* %r107, i32 0
  store i32 %r180, i32* %r181
  %r182 = getelementptr i32, i32* %r101, i32 0
  %r183 = load i32, i32* %r182
  %r184 = getelementptr i32, i32* %r103, i32 1
  %r185 = load i32, i32* %r184
  %r186 = mul i32 %r183, %r185
  %r187 = getelementptr i32, i32* %r101, i32 1
  %r188 = load i32, i32* %r187
  %r189 = getelementptr i32, i32* %r104, i32 1
  %r190 = load i32, i32* %r189
  %r191 = mul i32 %r188, %r190
  %r192 = add i32 %r186, %r191
  %r193 = getelementptr i32, i32* %r101, i32 2
  %r194 = load i32, i32* %r193
  %r195 = getelementptr i32, i32* %r105, i32 1
  %r196 = load i32, i32* %r195
  %r197 = mul i32 %r194, %r196
  %r198 = add i32 %r192, %r197
  %r199 = getelementptr i32, i32* %r107, i32 1
  store i32 %r198, i32* %r199
  %r200 = getelementptr i32, i32* %r101, i32 0
  %r201 = load i32, i32* %r200
  %r202 = getelementptr i32, i32* %r103, i32 2
  %r203 = load i32, i32* %r202
  %r204 = mul i32 %r201, %r203
  %r205 = getelementptr i32, i32* %r101, i32 1
  %r206 = load i32, i32* %r205
  %r207 = getelementptr i32, i32* %r104, i32 2
  %r208 = load i32, i32* %r207
  %r209 = mul i32 %r206, %r208
  %r210 = add i32 %r204, %r209
  %r211 = getelementptr i32, i32* %r101, i32 2
  %r212 = load i32, i32* %r211
  %r213 = getelementptr i32, i32* %r105, i32 2
  %r214 = load i32, i32* %r213
  %r215 = mul i32 %r212, %r214
  %r216 = add i32 %r210, %r215
  %r217 = getelementptr i32, i32* %r107, i32 2
  store i32 %r216, i32* %r217
  %r218 = getelementptr i32, i32* %r102, i32 0
  %r219 = load i32, i32* %r218
  %r220 = getelementptr i32, i32* %r103, i32 0
  %r221 = load i32, i32* %r220
  %r222 = mul i32 %r219, %r221
  %r223 = getelementptr i32, i32* %r102, i32 1
  %r224 = load i32, i32* %r223
  %r225 = getelementptr i32, i32* %r104, i32 0
  %r226 = load i32, i32* %r225
  %r227 = mul i32 %r224, %r226
  %r228 = add i32 %r222, %r227
  %r229 = getelementptr i32, i32* %r102, i32 2
  %r230 = load i32, i32* %r229
  %r231 = getelementptr i32, i32* %r105, i32 0
  %r232 = load i32, i32* %r231
  %r233 = mul i32 %r230, %r232
  %r234 = add i32 %r228, %r233
  %r235 = getelementptr i32, i32* %r108, i32 0
  store i32 %r234, i32* %r235
  %r236 = getelementptr i32, i32* %r102, i32 0
  %r237 = load i32, i32* %r236
  %r238 = getelementptr i32, i32* %r103, i32 1
  %r239 = load i32, i32* %r238
  %r240 = mul i32 %r237, %r239
  %r241 = getelementptr i32, i32* %r102, i32 1
  %r242 = load i32, i32* %r241
  %r243 = getelementptr i32, i32* %r104, i32 1
  %r244 = load i32, i32* %r243
  %r245 = mul i32 %r242, %r244
  %r246 = add i32 %r240, %r245
  %r247 = getelementptr i32, i32* %r102, i32 2
  %r248 = load i32, i32* %r247
  %r249 = getelementptr i32, i32* %r105, i32 1
  %r250 = load i32, i32* %r249
  %r251 = mul i32 %r248, %r250
  %r252 = add i32 %r246, %r251
  %r253 = getelementptr i32, i32* %r108, i32 1
  store i32 %r252, i32* %r253
  %r254 = getelementptr i32, i32* %r102, i32 0
  %r255 = load i32, i32* %r254
  %r256 = getelementptr i32, i32* %r103, i32 2
  %r257 = load i32, i32* %r256
  %r258 = mul i32 %r255, %r257
  %r259 = getelementptr i32, i32* %r102, i32 1
  %r260 = load i32, i32* %r259
  %r261 = getelementptr i32, i32* %r104, i32 2
  %r262 = load i32, i32* %r261
  %r263 = mul i32 %r260, %r262
  %r264 = add i32 %r258, %r263
  %r265 = getelementptr i32, i32* %r102, i32 2
  %r266 = load i32, i32* %r265
  %r267 = getelementptr i32, i32* %r105, i32 2
  %r268 = load i32, i32* %r267
  %r269 = mul i32 %r266, %r268
  %r270 = add i32 %r264, %r269
  %r271 = getelementptr i32, i32* %r108, i32 2
  store i32 %r270, i32* %r271
  ret i32 0
}

define i32 @main( ) {
bb2:
  %r339 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %r272 = alloca [ 3 x i32 ]
  %r273 = alloca [ 3 x i32 ]
  %r274 = alloca [ 3 x i32 ]
  %r275 = alloca [ 3 x i32 ]
  %r276 = alloca [ 3 x i32 ]
  %r277 = alloca [ 3 x i32 ]
  %r278 = alloca [ 6 x i32 ]
  %r279 = alloca [ 3 x i32 ]
  %r280 = alloca [ 3 x i32 ]
  %r340 = add i32 0, 0
  %r341 = add i32 0, 0
  br label %bb3

bb3:
  %r342 = phi i32 [ %r341, %bb2 ], [ %r358, %bb4 ]
  %r283 = load i32, i32* @M
  %r284 = icmp slt i32 %r342, %r283
  br i1 %r284, label %bb4, label %bb5

bb4:
  %r287 = getelementptr [3 x i32 ], [3 x i32 ]* %r272, i32 0, i32 %r342
  store i32 %r342, i32* %r287
  %r290 = getelementptr [3 x i32 ], [3 x i32 ]* %r273, i32 0, i32 %r342
  store i32 %r342, i32* %r290
  %r293 = getelementptr [3 x i32 ], [3 x i32 ]* %r274, i32 0, i32 %r342
  store i32 %r342, i32* %r293
  %r296 = getelementptr [3 x i32 ], [3 x i32 ]* %r275, i32 0, i32 %r342
  store i32 %r342, i32* %r296
  %r299 = getelementptr [3 x i32 ], [3 x i32 ]* %r276, i32 0, i32 %r342
  store i32 %r342, i32* %r299
  %r302 = getelementptr [3 x i32 ], [3 x i32 ]* %r277, i32 0, i32 %r342
  store i32 %r342, i32* %r302
  %r358 = add i32 %r342, 1
  br label %bb3

bb5:
  %r343 = call i32 @mul(i32* %r272, i32* %r273, i32* %r274, i32* %r275, i32* %r276, i32* %r277, i32* %r278, i32* %r279, i32* %r280)
  br label %bb6

bb6:
  %r344 = phi i32 [ %r343, %bb5 ], [ %r357, %bb7 ]
  %r308 = load i32, i32* @N
  %r309 = icmp slt i32 %r344, %r308
  br i1 %r309, label %bb7, label %bb8

bb7:
  %r311 = getelementptr [6 x i32 ], [6 x i32 ]* %r278, i32 0, i32 %r344
  %r356 = load i32, i32* %r311
  call void @putint(i32 %r356)
  %r357 = add i32 %r344, 1
  br label %bb6

bb8:
  %r345 = add i32 10, 0
  %r346 = add i32 0, 0
  call void @putch(i32 %r345)
  br label %bb9

bb9:
  %r347 = phi i32 [ %r346, %bb8 ], [ %r355, %bb10 ]
  %r318 = load i32, i32* @N
  %r319 = icmp slt i32 %r347, %r318
  br i1 %r319, label %bb10, label %bb11

bb10:
  %r321 = getelementptr [3 x i32 ], [3 x i32 ]* %r279, i32 0, i32 %r347
  %r354 = load i32, i32* %r321
  call void @putint(i32 %r354)
  %r355 = add i32 %r347, 1
  br label %bb9

bb11:
  %r348 = add i32 10, 0
  %r349 = add i32 0, 0
  call void @putch(i32 %r348)
  br label %bb12

bb12:
  %r350 = phi i32 [ %r349, %bb11 ], [ %r353, %bb13 ]
  %r328 = load i32, i32* @N
  %r329 = icmp slt i32 %r350, %r328
  br i1 %r329, label %bb13, label %bb14

bb13:
  %r331 = getelementptr [3 x i32 ], [3 x i32 ]* %r280, i32 0, i32 %r350
  %r352 = load i32, i32* %r331
  call void @putint(i32 %r352)
  %r353 = add i32 %r350, 1
  br label %bb12

bb14:
  %r351 = add i32 10, 0
  call void @putch(i32 %r351)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

