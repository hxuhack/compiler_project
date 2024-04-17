declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @func1( i32 %r100, i32 %r102, i32 %r104 ) {
bb31:
  %r271 = add i32 0, 0
  %r274 = add i32 %r100, 0
  %r272 = add i32 0, 0
  %r275 = add i32 %r102, 0
  %r273 = add i32 0, 0
  %r276 = add i32 %r104, 0
  br label %bb1

bb1:
  %r107 = icmp eq i32 %r276, 0
  br i1 %r107, label %bb2, label %bb3

bb2:
  %r110 = mul i32 %r274, %r275
  ret i32 %r110
bb3:
  %r114 = sub i32 %r275, %r276
  %r115 = call i32 @func1(i32 %r274, i32 %r114, i32 0)
  ret i32 %r115
}

define i32 @func2( i32 %r116, i32 %r118 ) {
bb34:
  %r277 = add i32 0, 0
  %r279 = add i32 %r116, 0
  %r278 = add i32 0, 0
  %r280 = add i32 %r118, 0
  br label %bb5

bb5:
  %r121 = icmp ne i32 %r280, 0
  br i1 %r121, label %bb6, label %bb7

bb6:
  %r125 = sdiv i32 %r279, %r280
  %r127 = mul i32 %r125, %r280
  %r128 = sub i32 %r279, %r127
  %r129 = call i32 @func2(i32 %r128, i32 0)
  ret i32 %r129
bb7:
  ret i32 %r279
}

define i32 @func3( i32 %r131, i32 %r133 ) {
bb37:
  %r281 = add i32 0, 0
  %r283 = add i32 %r131, 0
  %r282 = add i32 0, 0
  %r284 = add i32 %r133, 0
  br label %bb9

bb9:
  %r136 = icmp eq i32 %r284, 0
  br i1 %r136, label %bb10, label %bb11

bb10:
  %r138 = add i32 %r283, 1
  ret i32 %r138
bb11:
  %r141 = add i32 %r283, %r284
  %r142 = call i32 @func3(i32 %r141, i32 0)
  ret i32 %r142
}

define i32 @func4( i32 %r143, i32 %r145, i32 %r147 ) {
bb40:
  %r285 = add i32 0, 0
  %r288 = add i32 %r143, 0
  %r286 = add i32 0, 0
  %r289 = add i32 %r145, 0
  %r287 = add i32 0, 0
  %r290 = add i32 %r147, 0
  br label %bb13

bb13:
  %r150 = icmp ne i32 %r288, 0
  br i1 %r150, label %bb14, label %bb15

bb14:
  ret i32 %r289
bb15:
  ret i32 %r290
}

define i32 @func5( i32 %r153 ) {
bb43:
  %r291 = add i32 0, 0
  %r292 = add i32 %r153, 0
  br label %bb17

bb17:
  %r155 = sub i32 0, %r292
  ret i32 %r155
}

define i32 @func6( i32 %r157, i32 %r159 ) {
bb44:
  %r293 = add i32 0, 0
  %r295 = add i32 %r157, 0
  %r294 = add i32 0, 0
  %r296 = add i32 %r159, 0
  br label %bb18

bb18:
  %r162 = icmp ne i32 %r295, 0
  br i1 %r162, label %bb22, label %bb20

bb22:
  %r164 = icmp ne i32 %r296, 0
  br i1 %r164, label %bb19, label %bb20

bb19:
  ret i32 1
bb20:
  ret i32 0
}

define i32 @func7( i32 %r165 ) {
bb47:
  %r297 = add i32 0, 0
  %r298 = add i32 %r165, 0
  br label %bb23

bb23:
  %r168 = icmp ne i32 %r298, 0
  br i1 %r168, label %bb25, label %bb24

bb24:
  ret i32 1
bb25:
  ret i32 0
}

define i32 @main( ) {
bb27:
  %r299 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r300 = add i32 0, 0
  %r305 = call i32 @getint()
  %r301 = add i32 0, 0
  %r306 = call i32 @getint()
  %r302 = add i32 0, 0
  %r307 = call i32 @getint()
  %r303 = add i32 0, 0
  %r308 = call i32 @getint()
  %r177 = alloca [ 10 x i32 ]
  %r304 = add i32 0, 0
  %r309 = add i32 0, 0
  br label %bb28

bb28:
  %r310 = phi i32 [ %r309, %bb27 ], [ %r312, %bb29 ]
  %r180 = icmp slt i32 %r310, 10
  br i1 %r180, label %bb29, label %bb30

bb29:
  %r181 = call i32 @getint()
  %r183 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 %r310
  store i32 %r181, i32* %r183
  %r312 = add i32 %r310, 1
  br label %bb28

bb30:
  %r188 = call i32 @func7(i32 %r305)
  %r190 = call i32 @func5(i32 %r306)
  %r191 = call i32 @func6(i32 %r188, i32 %r190)
  %r193 = call i32 @func2(i32 %r191, i32 %r307)
  %r195 = call i32 @func3(i32 %r193, i32 %r308)
  %r196 = call i32 @func5(i32 %r195)
  %r197 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 0
  %r198 = load i32, i32* %r197
  %r199 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 1
  %r200 = load i32, i32* %r199
  %r201 = call i32 @func5(i32 %r200)
  %r202 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 2
  %r203 = load i32, i32* %r202
  %r204 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 3
  %r205 = load i32, i32* %r204
  %r206 = call i32 @func7(i32 %r205)
  %r207 = call i32 @func6(i32 %r203, i32 %r206)
  %r208 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 4
  %r209 = load i32, i32* %r208
  %r210 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 5
  %r211 = load i32, i32* %r210
  %r212 = call i32 @func7(i32 %r211)
  %r213 = call i32 @func2(i32 %r209, i32 %r212)
  %r214 = call i32 @func4(i32 %r201, i32 %r207, i32 %r213)
  %r215 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 6
  %r216 = load i32, i32* %r215
  %r217 = call i32 @func3(i32 %r214, i32 %r216)
  %r218 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 7
  %r219 = load i32, i32* %r218
  %r220 = call i32 @func2(i32 %r217, i32 %r219)
  %r221 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 8
  %r222 = load i32, i32* %r221
  %r223 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 9
  %r224 = load i32, i32* %r223
  %r225 = call i32 @func7(i32 %r224)
  %r226 = call i32 @func3(i32 %r222, i32 %r225)
  %r228 = call i32 @func1(i32 %r220, i32 %r226, i32 %r305)
  %r229 = call i32 @func4(i32 %r196, i32 %r198, i32 %r228)
  %r232 = call i32 @func7(i32 %r307)
  %r234 = call i32 @func3(i32 %r232, i32 %r308)
  %r235 = call i32 @func2(i32 %r306, i32 %r234)
  %r236 = call i32 @func3(i32 %r229, i32 %r235)
  %r237 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 0
  %r238 = load i32, i32* %r237
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 1
  %r240 = load i32, i32* %r239
  %r241 = call i32 @func1(i32 %r236, i32 %r238, i32 %r240)
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 2
  %r243 = load i32, i32* %r242
  %r244 = call i32 @func2(i32 %r241, i32 %r243)
  %r245 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 3
  %r246 = load i32, i32* %r245
  %r247 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 4
  %r248 = load i32, i32* %r247
  %r249 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 5
  %r250 = load i32, i32* %r249
  %r251 = call i32 @func5(i32 %r250)
  %r252 = call i32 @func3(i32 %r248, i32 %r251)
  %r253 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 6
  %r254 = load i32, i32* %r253
  %r255 = call i32 @func5(i32 %r254)
  %r256 = call i32 @func2(i32 %r252, i32 %r255)
  %r257 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 7
  %r258 = load i32, i32* %r257
  %r259 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 8
  %r260 = load i32, i32* %r259
  %r261 = call i32 @func7(i32 %r260)
  %r262 = call i32 @func1(i32 %r256, i32 %r258, i32 %r261)
  %r263 = getelementptr [10 x i32 ], [10 x i32 ]* %r177, i32 0, i32 9
  %r264 = load i32, i32* %r263
  %r265 = call i32 @func5(i32 %r264)
  %r266 = call i32 @func2(i32 %r262, i32 %r265)
  %r268 = call i32 @func3(i32 %r266, i32 %r305)
  %r311 = call i32 @func1(i32 %r244, i32 %r246, i32 %r268)
  call void @_sysy_stoptime(i32 117)
  ret i32 %r311
}

