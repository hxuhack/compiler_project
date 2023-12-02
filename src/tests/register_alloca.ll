declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@a1 = global i32 1
@a2 = global i32 2
@a3 = global i32 3
@a4 = global i32 4
@a5 = global i32 5
@a6 = global i32 6
@a7 = global i32 7
@a8 = global i32 8
@a9 = global i32 9
@a10 = global i32 10
@a11 = global i32 11
@a12 = global i32 12
@a13 = global i32 13
@a14 = global i32 14
@a15 = global i32 15
@a16 = global i32 16
@a17 = global i32 1
@a18 = global i32 2
@a19 = global i32 3
@a20 = global i32 4
@a21 = global i32 5
@a22 = global i32 6
@a23 = global i32 7
@a24 = global i32 8
@a25 = global i32 9
@a26 = global i32 10
@a27 = global i32 11
@a28 = global i32 12
@a29 = global i32 13
@a30 = global i32 14
@a31 = global i32 15
@a32 = global i32 16
define i32 @func( i32 %r100, i32 %r102 ) {
bb3:
  %r143 = alloca i32
  %r142 = alloca i32
  %r141 = alloca i32
  %r140 = alloca i32
  %r139 = alloca i32
  %r138 = alloca i32
  %r137 = alloca i32
  %r136 = alloca i32
  %r135 = alloca i32
  %r134 = alloca i32
  %r133 = alloca i32
  %r132 = alloca i32
  %r131 = alloca i32
  %r130 = alloca i32
  %r129 = alloca i32
  %r128 = alloca i32
  %r127 = alloca i32
  %r126 = alloca i32
  %r125 = alloca i32
  %r124 = alloca i32
  %r123 = alloca i32
  %r122 = alloca i32
  %r121 = alloca i32
  %r120 = alloca i32
  %r119 = alloca i32
  %r118 = alloca i32
  %r117 = alloca i32
  %r116 = alloca i32
  %r115 = alloca i32
  %r114 = alloca i32
  %r113 = alloca i32
  %r112 = alloca i32
  %r111 = alloca i32
  %r110 = alloca i32
  %r109 = alloca i32
  %r108 = alloca i32
  %r104 = alloca i32
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r103 = alloca i32
  store i32 %r102, i32* %r103
  br label %bb1

bb1:
  %r105 = load i32, i32* %r101
  %r106 = load i32, i32* %r103
  %r107 = add i32 %r105, %r106
  store i32 %r107, i32* %r104
  %r144 = call i32 @getint()
  store i32 %r144, i32* %r108
  %r145 = call i32 @getint()
  store i32 %r145, i32* %r109
  %r146 = call i32 @getint()
  store i32 %r146, i32* %r110
  %r147 = call i32 @getint()
  store i32 %r147, i32* %r111
  %r148 = load i32, i32* %r108
  %r149 = add i32 1, %r148
  %r150 = load i32, i32* @a1
  %r151 = add i32 %r149, %r150
  store i32 %r151, i32* %r112
  %r152 = load i32, i32* %r109
  %r153 = add i32 2, %r152
  %r154 = load i32, i32* @a2
  %r155 = add i32 %r153, %r154
  store i32 %r155, i32* %r113
  %r156 = load i32, i32* %r110
  %r157 = add i32 3, %r156
  %r158 = load i32, i32* @a3
  %r159 = add i32 %r157, %r158
  store i32 %r159, i32* %r114
  %r160 = load i32, i32* %r111
  %r161 = add i32 4, %r160
  %r162 = load i32, i32* @a4
  %r163 = add i32 %r161, %r162
  store i32 %r163, i32* %r115
  %r164 = load i32, i32* %r112
  %r165 = add i32 1, %r164
  %r166 = load i32, i32* @a5
  %r167 = add i32 %r165, %r166
  store i32 %r167, i32* %r116
  %r168 = load i32, i32* %r113
  %r169 = add i32 2, %r168
  %r170 = load i32, i32* @a6
  %r171 = add i32 %r169, %r170
  store i32 %r171, i32* %r117
  %r172 = load i32, i32* %r114
  %r173 = add i32 3, %r172
  %r174 = load i32, i32* @a7
  %r175 = add i32 %r173, %r174
  store i32 %r175, i32* %r118
  %r176 = load i32, i32* %r115
  %r177 = add i32 4, %r176
  %r178 = load i32, i32* @a8
  %r179 = add i32 %r177, %r178
  store i32 %r179, i32* %r119
  %r180 = load i32, i32* %r116
  %r181 = add i32 1, %r180
  %r182 = load i32, i32* @a9
  %r183 = add i32 %r181, %r182
  store i32 %r183, i32* %r120
  %r184 = load i32, i32* %r117
  %r185 = add i32 2, %r184
  %r186 = load i32, i32* @a10
  %r187 = add i32 %r185, %r186
  store i32 %r187, i32* %r121
  %r188 = load i32, i32* %r118
  %r189 = add i32 3, %r188
  %r190 = load i32, i32* @a11
  %r191 = add i32 %r189, %r190
  store i32 %r191, i32* %r122
  %r192 = load i32, i32* %r119
  %r193 = add i32 4, %r192
  %r194 = load i32, i32* @a12
  %r195 = add i32 %r193, %r194
  store i32 %r195, i32* %r123
  %r196 = load i32, i32* %r120
  %r197 = add i32 1, %r196
  %r198 = load i32, i32* @a13
  %r199 = add i32 %r197, %r198
  store i32 %r199, i32* %r124
  %r200 = load i32, i32* %r121
  %r201 = add i32 2, %r200
  %r202 = load i32, i32* @a14
  %r203 = add i32 %r201, %r202
  store i32 %r203, i32* %r125
  %r204 = load i32, i32* %r122
  %r205 = add i32 3, %r204
  %r206 = load i32, i32* @a15
  %r207 = add i32 %r205, %r206
  store i32 %r207, i32* %r126
  %r208 = load i32, i32* %r123
  %r209 = add i32 4, %r208
  %r210 = load i32, i32* @a16
  %r211 = add i32 %r209, %r210
  store i32 %r211, i32* %r127
  %r212 = load i32, i32* %r124
  %r213 = add i32 1, %r212
  %r214 = load i32, i32* @a17
  %r215 = add i32 %r213, %r214
  store i32 %r215, i32* %r128
  %r216 = load i32, i32* %r125
  %r217 = add i32 2, %r216
  %r218 = load i32, i32* @a18
  %r219 = add i32 %r217, %r218
  store i32 %r219, i32* %r129
  %r220 = load i32, i32* %r126
  %r221 = add i32 3, %r220
  %r222 = load i32, i32* @a19
  %r223 = add i32 %r221, %r222
  store i32 %r223, i32* %r130
  %r224 = load i32, i32* %r127
  %r225 = add i32 4, %r224
  %r226 = load i32, i32* @a20
  %r227 = add i32 %r225, %r226
  store i32 %r227, i32* %r131
  %r228 = load i32, i32* %r128
  %r229 = add i32 1, %r228
  %r230 = load i32, i32* @a21
  %r231 = add i32 %r229, %r230
  store i32 %r231, i32* %r132
  %r232 = load i32, i32* %r129
  %r233 = add i32 2, %r232
  %r234 = load i32, i32* @a22
  %r235 = add i32 %r233, %r234
  store i32 %r235, i32* %r133
  %r236 = load i32, i32* %r130
  %r237 = add i32 3, %r236
  %r238 = load i32, i32* @a23
  %r239 = add i32 %r237, %r238
  store i32 %r239, i32* %r134
  %r240 = load i32, i32* %r131
  %r241 = add i32 4, %r240
  %r242 = load i32, i32* @a24
  %r243 = add i32 %r241, %r242
  store i32 %r243, i32* %r135
  %r244 = load i32, i32* %r132
  %r245 = add i32 1, %r244
  %r246 = load i32, i32* @a25
  %r247 = add i32 %r245, %r246
  store i32 %r247, i32* %r136
  %r248 = load i32, i32* %r133
  %r249 = add i32 2, %r248
  %r250 = load i32, i32* @a26
  %r251 = add i32 %r249, %r250
  store i32 %r251, i32* %r137
  %r252 = load i32, i32* %r134
  %r253 = add i32 3, %r252
  %r254 = load i32, i32* @a27
  %r255 = add i32 %r253, %r254
  store i32 %r255, i32* %r138
  %r256 = load i32, i32* %r135
  %r257 = add i32 4, %r256
  %r258 = load i32, i32* @a28
  %r259 = add i32 %r257, %r258
  store i32 %r259, i32* %r139
  %r260 = load i32, i32* %r136
  %r261 = add i32 1, %r260
  %r262 = load i32, i32* @a29
  %r263 = add i32 %r261, %r262
  store i32 %r263, i32* %r140
  %r264 = load i32, i32* %r137
  %r265 = add i32 2, %r264
  %r266 = load i32, i32* @a30
  %r267 = add i32 %r265, %r266
  store i32 %r267, i32* %r141
  %r268 = load i32, i32* %r138
  %r269 = add i32 3, %r268
  %r270 = load i32, i32* @a31
  %r271 = add i32 %r269, %r270
  store i32 %r271, i32* %r142
  %r272 = load i32, i32* %r139
  %r273 = add i32 4, %r272
  %r274 = load i32, i32* @a32
  %r275 = add i32 %r273, %r274
  store i32 %r275, i32* %r143
  %r276 = load i32, i32* %r101
  %r277 = load i32, i32* %r103
  %r278 = sub i32 %r276, %r277
  %r279 = add i32 %r278, 10
  store i32 %r279, i32* %r104
  %r280 = load i32, i32* %r136
  %r281 = add i32 1, %r280
  %r282 = load i32, i32* @a29
  %r283 = add i32 %r281, %r282
  store i32 %r283, i32* %r140
  %r284 = load i32, i32* %r137
  %r285 = add i32 2, %r284
  %r286 = load i32, i32* @a30
  %r287 = add i32 %r285, %r286
  store i32 %r287, i32* %r141
  %r288 = load i32, i32* %r138
  %r289 = add i32 3, %r288
  %r290 = load i32, i32* @a31
  %r291 = add i32 %r289, %r290
  store i32 %r291, i32* %r142
  %r292 = load i32, i32* %r139
  %r293 = add i32 4, %r292
  %r294 = load i32, i32* @a32
  %r295 = add i32 %r293, %r294
  store i32 %r295, i32* %r143
  %r296 = load i32, i32* %r132
  %r297 = add i32 1, %r296
  %r298 = load i32, i32* @a25
  %r299 = add i32 %r297, %r298
  store i32 %r299, i32* %r136
  %r300 = load i32, i32* %r133
  %r301 = add i32 2, %r300
  %r302 = load i32, i32* @a26
  %r303 = add i32 %r301, %r302
  store i32 %r303, i32* %r137
  %r304 = load i32, i32* %r134
  %r305 = add i32 3, %r304
  %r306 = load i32, i32* @a27
  %r307 = add i32 %r305, %r306
  store i32 %r307, i32* %r138
  %r308 = load i32, i32* %r135
  %r309 = add i32 4, %r308
  %r310 = load i32, i32* @a28
  %r311 = add i32 %r309, %r310
  store i32 %r311, i32* %r139
  %r312 = load i32, i32* %r128
  %r313 = add i32 1, %r312
  %r314 = load i32, i32* @a21
  %r315 = add i32 %r313, %r314
  store i32 %r315, i32* %r132
  %r316 = load i32, i32* %r129
  %r317 = add i32 2, %r316
  %r318 = load i32, i32* @a22
  %r319 = add i32 %r317, %r318
  store i32 %r319, i32* %r133
  %r320 = load i32, i32* %r130
  %r321 = add i32 3, %r320
  %r322 = load i32, i32* @a23
  %r323 = add i32 %r321, %r322
  store i32 %r323, i32* %r134
  %r324 = load i32, i32* %r131
  %r325 = add i32 4, %r324
  %r326 = load i32, i32* @a24
  %r327 = add i32 %r325, %r326
  store i32 %r327, i32* %r135
  %r328 = load i32, i32* %r124
  %r329 = add i32 1, %r328
  %r330 = load i32, i32* @a17
  %r331 = add i32 %r329, %r330
  store i32 %r331, i32* %r128
  %r332 = load i32, i32* %r125
  %r333 = add i32 2, %r332
  %r334 = load i32, i32* @a18
  %r335 = add i32 %r333, %r334
  store i32 %r335, i32* %r129
  %r336 = load i32, i32* %r126
  %r337 = add i32 3, %r336
  %r338 = load i32, i32* @a19
  %r339 = add i32 %r337, %r338
  store i32 %r339, i32* %r130
  %r340 = load i32, i32* %r127
  %r341 = add i32 4, %r340
  %r342 = load i32, i32* @a20
  %r343 = add i32 %r341, %r342
  store i32 %r343, i32* %r131
  %r344 = load i32, i32* %r120
  %r345 = add i32 1, %r344
  %r346 = load i32, i32* @a13
  %r347 = add i32 %r345, %r346
  store i32 %r347, i32* %r124
  %r348 = load i32, i32* %r121
  %r349 = add i32 2, %r348
  %r350 = load i32, i32* @a14
  %r351 = add i32 %r349, %r350
  store i32 %r351, i32* %r125
  %r352 = load i32, i32* %r122
  %r353 = add i32 3, %r352
  %r354 = load i32, i32* @a15
  %r355 = add i32 %r353, %r354
  store i32 %r355, i32* %r126
  %r356 = load i32, i32* %r123
  %r357 = add i32 4, %r356
  %r358 = load i32, i32* @a16
  %r359 = add i32 %r357, %r358
  store i32 %r359, i32* %r127
  %r360 = load i32, i32* %r116
  %r361 = add i32 1, %r360
  %r362 = load i32, i32* @a9
  %r363 = add i32 %r361, %r362
  store i32 %r363, i32* %r120
  %r364 = load i32, i32* %r117
  %r365 = add i32 2, %r364
  %r366 = load i32, i32* @a10
  %r367 = add i32 %r365, %r366
  store i32 %r367, i32* %r121
  %r368 = load i32, i32* %r118
  %r369 = add i32 3, %r368
  %r370 = load i32, i32* @a11
  %r371 = add i32 %r369, %r370
  store i32 %r371, i32* %r122
  %r372 = load i32, i32* %r119
  %r373 = add i32 4, %r372
  %r374 = load i32, i32* @a12
  %r375 = add i32 %r373, %r374
  store i32 %r375, i32* %r123
  %r376 = load i32, i32* %r112
  %r377 = add i32 1, %r376
  %r378 = load i32, i32* @a5
  %r379 = add i32 %r377, %r378
  store i32 %r379, i32* %r116
  %r380 = load i32, i32* %r113
  %r381 = add i32 2, %r380
  %r382 = load i32, i32* @a6
  %r383 = add i32 %r381, %r382
  store i32 %r383, i32* %r117
  %r384 = load i32, i32* %r114
  %r385 = add i32 3, %r384
  %r386 = load i32, i32* @a7
  %r387 = add i32 %r385, %r386
  store i32 %r387, i32* %r118
  %r388 = load i32, i32* %r115
  %r389 = add i32 4, %r388
  %r390 = load i32, i32* @a8
  %r391 = add i32 %r389, %r390
  store i32 %r391, i32* %r119
  %r392 = load i32, i32* %r108
  %r393 = add i32 1, %r392
  %r394 = load i32, i32* @a1
  %r395 = add i32 %r393, %r394
  store i32 %r395, i32* %r112
  %r396 = load i32, i32* %r109
  %r397 = add i32 2, %r396
  %r398 = load i32, i32* @a2
  %r399 = add i32 %r397, %r398
  store i32 %r399, i32* %r113
  %r400 = load i32, i32* %r110
  %r401 = add i32 3, %r400
  %r402 = load i32, i32* @a3
  %r403 = add i32 %r401, %r402
  store i32 %r403, i32* %r114
  %r404 = load i32, i32* %r111
  %r405 = add i32 4, %r404
  %r406 = load i32, i32* @a4
  %r407 = add i32 %r405, %r406
  store i32 %r407, i32* %r115
  %r408 = load i32, i32* %r108
  %r409 = add i32 1, %r408
  %r410 = load i32, i32* @a1
  %r411 = add i32 %r409, %r410
  store i32 %r411, i32* %r112
  %r412 = load i32, i32* %r109
  %r413 = add i32 2, %r412
  %r414 = load i32, i32* @a2
  %r415 = add i32 %r413, %r414
  store i32 %r415, i32* %r113
  %r416 = load i32, i32* %r110
  %r417 = add i32 3, %r416
  %r418 = load i32, i32* @a3
  %r419 = add i32 %r417, %r418
  store i32 %r419, i32* %r114
  %r420 = load i32, i32* %r111
  %r421 = add i32 4, %r420
  %r422 = load i32, i32* @a4
  %r423 = add i32 %r421, %r422
  store i32 %r423, i32* %r115
  %r424 = load i32, i32* %r104
  %r425 = load i32, i32* %r108
  %r426 = add i32 %r424, %r425
  %r427 = load i32, i32* %r109
  %r428 = add i32 %r426, %r427
  %r429 = load i32, i32* %r110
  %r430 = add i32 %r428, %r429
  %r431 = load i32, i32* %r111
  %r432 = add i32 %r430, %r431
  %r433 = load i32, i32* %r112
  %r434 = sub i32 %r432, %r433
  %r435 = load i32, i32* %r113
  %r436 = sub i32 %r434, %r435
  %r437 = load i32, i32* %r114
  %r438 = sub i32 %r436, %r437
  %r439 = load i32, i32* %r115
  %r440 = sub i32 %r438, %r439
  %r441 = load i32, i32* %r116
  %r442 = add i32 %r440, %r441
  %r443 = load i32, i32* %r117
  %r444 = add i32 %r442, %r443
  %r445 = load i32, i32* %r118
  %r446 = add i32 %r444, %r445
  %r447 = load i32, i32* %r119
  %r448 = add i32 %r446, %r447
  %r449 = load i32, i32* %r120
  %r450 = sub i32 %r448, %r449
  %r451 = load i32, i32* %r121
  %r452 = sub i32 %r450, %r451
  %r453 = load i32, i32* %r122
  %r454 = sub i32 %r452, %r453
  %r455 = load i32, i32* %r123
  %r456 = sub i32 %r454, %r455
  %r457 = load i32, i32* %r124
  %r458 = add i32 %r456, %r457
  %r459 = load i32, i32* %r125
  %r460 = add i32 %r458, %r459
  %r461 = load i32, i32* %r126
  %r462 = add i32 %r460, %r461
  %r463 = load i32, i32* %r127
  %r464 = add i32 %r462, %r463
  %r465 = load i32, i32* %r128
  %r466 = sub i32 %r464, %r465
  %r467 = load i32, i32* %r129
  %r468 = sub i32 %r466, %r467
  %r469 = load i32, i32* %r130
  %r470 = sub i32 %r468, %r469
  %r471 = load i32, i32* %r131
  %r472 = sub i32 %r470, %r471
  %r473 = load i32, i32* %r132
  %r474 = add i32 %r472, %r473
  %r475 = load i32, i32* %r133
  %r476 = add i32 %r474, %r475
  %r477 = load i32, i32* %r134
  %r478 = add i32 %r476, %r477
  %r479 = load i32, i32* %r135
  %r480 = add i32 %r478, %r479
  %r481 = load i32, i32* %r136
  %r482 = sub i32 %r480, %r481
  %r483 = load i32, i32* %r137
  %r484 = sub i32 %r482, %r483
  %r485 = load i32, i32* %r138
  %r486 = sub i32 %r484, %r485
  %r487 = load i32, i32* %r139
  %r488 = sub i32 %r486, %r487
  %r489 = load i32, i32* %r140
  %r490 = add i32 %r488, %r489
  %r491 = load i32, i32* %r141
  %r492 = add i32 %r490, %r491
  %r493 = load i32, i32* %r142
  %r494 = add i32 %r492, %r493
  %r495 = load i32, i32* %r143
  %r496 = add i32 %r494, %r495
  %r497 = load i32, i32* @a1
  %r498 = add i32 %r496, %r497
  %r499 = load i32, i32* @a2
  %r500 = sub i32 %r498, %r499
  %r501 = load i32, i32* @a3
  %r502 = add i32 %r500, %r501
  %r503 = load i32, i32* @a4
  %r504 = sub i32 %r502, %r503
  %r505 = load i32, i32* @a5
  %r506 = add i32 %r504, %r505
  %r507 = load i32, i32* @a6
  %r508 = sub i32 %r506, %r507
  %r509 = load i32, i32* @a7
  %r510 = add i32 %r508, %r509
  %r511 = load i32, i32* @a8
  %r512 = sub i32 %r510, %r511
  %r513 = load i32, i32* @a9
  %r514 = add i32 %r512, %r513
  %r515 = load i32, i32* @a10
  %r516 = sub i32 %r514, %r515
  %r517 = load i32, i32* @a11
  %r518 = add i32 %r516, %r517
  %r519 = load i32, i32* @a12
  %r520 = sub i32 %r518, %r519
  %r521 = load i32, i32* @a13
  %r522 = add i32 %r520, %r521
  %r523 = load i32, i32* @a14
  %r524 = sub i32 %r522, %r523
  %r525 = load i32, i32* @a15
  %r526 = add i32 %r524, %r525
  %r527 = load i32, i32* @a16
  %r528 = sub i32 %r526, %r527
  %r529 = load i32, i32* @a17
  %r530 = add i32 %r528, %r529
  %r531 = load i32, i32* @a18
  %r532 = sub i32 %r530, %r531
  %r533 = load i32, i32* @a19
  %r534 = add i32 %r532, %r533
  %r535 = load i32, i32* @a20
  %r536 = sub i32 %r534, %r535
  %r537 = load i32, i32* @a21
  %r538 = add i32 %r536, %r537
  %r539 = load i32, i32* @a22
  %r540 = sub i32 %r538, %r539
  %r541 = load i32, i32* @a23
  %r542 = add i32 %r540, %r541
  %r543 = load i32, i32* @a24
  %r544 = sub i32 %r542, %r543
  %r545 = load i32, i32* @a25
  %r546 = add i32 %r544, %r545
  %r547 = load i32, i32* @a26
  %r548 = sub i32 %r546, %r547
  %r549 = load i32, i32* @a27
  %r550 = add i32 %r548, %r549
  %r551 = load i32, i32* @a28
  %r552 = sub i32 %r550, %r551
  %r553 = load i32, i32* @a29
  %r554 = add i32 %r552, %r553
  %r555 = load i32, i32* @a30
  %r556 = sub i32 %r554, %r555
  %r557 = load i32, i32* @a31
  %r558 = add i32 %r556, %r557
  %r559 = load i32, i32* @a32
  %r560 = sub i32 %r558, %r559
  ret i32 %r560
}

define i32 @main( ) {
bb2:
  %r561 = alloca i32
  %r562 = alloca i32
  %r563 = call i32 @getint()
  store i32 %r563, i32* %r561
  %r564 = load i32, i32* %r561
  %r565 = mul i32 2, 9
  %r566 = add i32 %r564, %r565
  store i32 %r566, i32* %r562
  %r567 = load i32, i32* %r561
  %r568 = load i32, i32* %r562
  %r569 = call i32 @func(i32 %r567, i32 %r568)
  store i32 %r569, i32* %r561
  %r570 = load i32, i32* %r561
  call void @putint(i32 %r570)
  %r571 = load i32, i32* %r561
  ret i32 %r571
}

