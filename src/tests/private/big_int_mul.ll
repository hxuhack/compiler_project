declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@len = global i32 20
define i32 @main( ) {
bb1:
  %r261 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r262 = add i32 0, 0
  %r263 = add i32 0, 0
  %r264 = add i32 0, 0
  %r265 = add i32 0, 0
  %r266 = add i32 0, 0
  %r105 = alloca [ 20 x i32 ]
  %r106 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 0
  store i32 1, i32* %r106
  %r107 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 1
  store i32 2, i32* %r107
  %r108 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 2
  store i32 3, i32* %r108
  %r109 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 3
  store i32 4, i32* %r109
  %r110 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 4
  store i32 5, i32* %r110
  %r111 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 5
  store i32 6, i32* %r111
  %r112 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 6
  store i32 7, i32* %r112
  %r113 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 7
  store i32 8, i32* %r113
  %r114 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 8
  store i32 9, i32* %r114
  %r115 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 9
  store i32 0, i32* %r115
  %r116 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 10
  store i32 1, i32* %r116
  %r117 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 11
  store i32 2, i32* %r117
  %r118 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 12
  store i32 3, i32* %r118
  %r119 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 13
  store i32 4, i32* %r119
  %r120 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 14
  store i32 5, i32* %r120
  %r121 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 15
  store i32 6, i32* %r121
  %r122 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 16
  store i32 7, i32* %r122
  %r123 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 17
  store i32 8, i32* %r123
  %r124 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 18
  store i32 9, i32* %r124
  %r125 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 19
  store i32 0, i32* %r125
  %r126 = alloca [ 20 x i32 ]
  %r127 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 0
  store i32 2, i32* %r127
  %r128 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 1
  store i32 3, i32* %r128
  %r129 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 2
  store i32 4, i32* %r129
  %r130 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 3
  store i32 2, i32* %r130
  %r131 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 4
  store i32 5, i32* %r131
  %r132 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 5
  store i32 7, i32* %r132
  %r133 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 6
  store i32 9, i32* %r133
  %r134 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 7
  store i32 9, i32* %r134
  %r135 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 8
  store i32 0, i32* %r135
  %r136 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 9
  store i32 1, i32* %r136
  %r137 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 10
  store i32 9, i32* %r137
  %r138 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 11
  store i32 8, i32* %r138
  %r139 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 12
  store i32 7, i32* %r139
  %r140 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 13
  store i32 6, i32* %r140
  %r141 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 14
  store i32 4, i32* %r141
  %r142 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 15
  store i32 3, i32* %r142
  %r143 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 16
  store i32 2, i32* %r143
  %r144 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 17
  store i32 1, i32* %r144
  %r145 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 18
  store i32 2, i32* %r145
  %r146 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 19
  store i32 2, i32* %r146
  %r267 = add i32 0, 0
  %r268 = load i32, i32* @len
  %r269 = add i32 0, 0
  %r270 = load i32, i32* @len
  %r151 = alloca [ 25 x i32 ]
  %r152 = alloca [ 25 x i32 ]
  %r153 = alloca [ 40 x i32 ]
  %r154 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0
  store i32 0, i32* %r154
  %r271 = add i32 0, 0
  br label %bb2

bb2:
  %r272 = phi i32 [ %r271, %bb1 ], [ %r314, %bb3 ]
  %r157 = icmp slt i32 %r272, %r268
  br i1 %r157, label %bb3, label %bb4

bb3:
  %r159 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 %r272
  %r313 = load i32, i32* %r159
  %r162 = getelementptr [25 x i32 ], [25 x i32 ]* %r151, i32 0, i32 %r272
  store i32 %r313, i32* %r162
  %r314 = add i32 %r272, 1
  br label %bb2

bb4:
  %r273 = add i32 0, 0
  br label %bb5

bb5:
  %r274 = phi i32 [ %r273, %bb4 ], [ %r312, %bb6 ]
  %r167 = icmp slt i32 %r274, %r270
  br i1 %r167, label %bb6, label %bb7

bb6:
  %r169 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 %r274
  %r311 = load i32, i32* %r169
  %r172 = getelementptr [25 x i32 ], [25 x i32 ]* %r152, i32 0, i32 %r274
  store i32 %r311, i32* %r172
  %r312 = add i32 %r274, 1
  br label %bb5

bb7:
  %r275 = add i32 %r268, %r270
  %r276 = sub i32 %r275, 1
  %r277 = add i32 0, 0
  br label %bb8

bb8:
  %r278 = phi i32 [ %r277, %bb7 ], [ %r310, %bb9 ]
  %r181 = icmp sle i32 %r278, %r276
  br i1 %r181, label %bb9, label %bb10

bb9:
  %r183 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r278
  store i32 0, i32* %r183
  %r310 = add i32 %r278, 1
  br label %bb8

bb10:
  %r279 = add i32 0, 0
  %r280 = sub i32 %r270, 1
  br label %bb11

bb11:
  %r281 = phi i32 [ %r276, %bb10 ], [ %r298, %bb16 ]
  %r282 = phi i32 [ %r280, %bb10 ], [ %r299, %bb16 ]
  %r283 = sub i32 0, 1
  %r190 = icmp sgt i32 %r282, %r283
  br i1 %r190, label %bb12, label %bb13

bb12:
  %r192 = getelementptr [25 x i32 ], [25 x i32 ]* %r152, i32 0, i32 %r282
  %r292 = load i32, i32* %r192
  %r293 = sub i32 %r268, 1
  br label %bb14

bb14:
  %r294 = phi i32 [ %r281, %bb12 ], [ %r305, %bb19 ]
  %r295 = phi i32 [ %r293, %bb12 ], [ %r304, %bb19 ]
  %r296 = sub i32 0, 1
  %r198 = icmp sgt i32 %r295, %r296
  br i1 %r198, label %bb15, label %bb16

bb15:
  %r200 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r294
  %r300 = load i32, i32* %r200
  %r204 = getelementptr [25 x i32 ], [25 x i32 ]* %r151, i32 0, i32 %r295
  %r301 = load i32, i32* %r204
  %r302 = mul i32 %r292, %r301
  %r303 = add i32 %r300, %r302
  %r209 = icmp sge i32 %r303, 10
  br i1 %r209, label %bb17, label %bb18

bb17:
  %r212 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r294
  store i32 %r303, i32* %r212
  %r306 = sub i32 %r294, 1
  %r217 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r306
  %r307 = load i32, i32* %r217
  %r308 = sdiv i32 %r303, 10
  %r309 = add i32 %r307, %r308
  %r223 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r306
  store i32 %r309, i32* %r223
  br label %bb19

bb18:
  %r226 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r294
  store i32 %r303, i32* %r226
  br label %bb19

bb19:
  %r304 = sub i32 %r295, 1
  %r305 = sub i32 %r294, 1
  br label %bb14

bb16:
  %r297 = add i32 %r294, %r268
  %r298 = sub i32 %r297, 1
  %r299 = sub i32 %r282, 1
  br label %bb11

bb13:
  %r237 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0
  %r284 = load i32, i32* %r237
  %r239 = icmp ne i32 %r284, 0
  br i1 %r239, label %bb20, label %bb21

bb20:
  %r240 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0
  %r291 = load i32, i32* %r240
  call void @putint(i32 %r291)
  br label %bb22

bb21:
  br label %bb22

bb22:
  %r285 = add i32 1, 0
  br label %bb23

bb23:
  %r286 = phi i32 [ %r285, %bb22 ], [ %r290, %bb24 ]
  %r287 = add i32 %r268, %r270
  %r288 = sub i32 %r287, 1
  %r247 = icmp sle i32 %r286, %r288
  br i1 %r247, label %bb24, label %bb25

bb24:
  %r249 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r286
  %r289 = load i32, i32* %r249
  call void @putint(i32 %r289)
  %r290 = add i32 %r286, 1
  br label %bb23

bb25:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

