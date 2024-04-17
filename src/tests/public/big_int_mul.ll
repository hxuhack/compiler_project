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
  %r253 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r254 = add i32 0, 0
  %r255 = add i32 0, 0
  %r256 = add i32 0, 0
  %r257 = add i32 0, 0
  %r258 = add i32 0, 0
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
  %r259 = add i32 0, 0
  %r261 = load i32, i32* @len
  %r260 = add i32 0, 0
  %r262 = load i32, i32* @len
  %r151 = alloca [ 25 x i32 ]
  %r152 = alloca [ 25 x i32 ]
  %r153 = alloca [ 40 x i32 ]
  %r154 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0
  store i32 0, i32* %r154
  %r263 = add i32 0, 0
  br label %bb2

bb2:
  %r264 = phi i32 [ %r263, %bb1 ], [ %r289, %bb3 ]
  %r157 = icmp slt i32 %r264, %r261
  br i1 %r157, label %bb3, label %bb4

bb3:
  %r159 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 %r264
  %r160 = load i32, i32* %r159
  %r162 = getelementptr [25 x i32 ], [25 x i32 ]* %r151, i32 0, i32 %r264
  store i32 %r160, i32* %r162
  %r289 = add i32 %r264, 1
  br label %bb2

bb4:
  %r265 = add i32 0, 0
  br label %bb5

bb5:
  %r266 = phi i32 [ %r265, %bb4 ], [ %r288, %bb6 ]
  %r167 = icmp slt i32 %r266, %r262
  br i1 %r167, label %bb6, label %bb7

bb6:
  %r169 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 %r266
  %r170 = load i32, i32* %r169
  %r172 = getelementptr [25 x i32 ], [25 x i32 ]* %r152, i32 0, i32 %r266
  store i32 %r170, i32* %r172
  %r288 = add i32 %r266, 1
  br label %bb5

bb7:
  %r177 = add i32 %r261, %r262
  %r267 = sub i32 %r177, 1
  %r268 = add i32 0, 0
  br label %bb8

bb8:
  %r269 = phi i32 [ %r268, %bb7 ], [ %r287, %bb9 ]
  %r181 = icmp sle i32 %r269, %r267
  br i1 %r181, label %bb9, label %bb10

bb9:
  %r183 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r269
  store i32 0, i32* %r183
  %r287 = add i32 %r269, 1
  br label %bb8

bb10:
  %r270 = add i32 0, 0
  %r271 = sub i32 %r262, 1
  br label %bb11

bb11:
  %r272 = phi i32 [ %r267, %bb10 ], [ %r281, %bb16 ]
  %r273 = phi i32 [ %r271, %bb10 ], [ %r282, %bb16 ]
  %r189 = sub i32 0, 1
  %r190 = icmp sgt i32 %r273, %r189
  br i1 %r190, label %bb12, label %bb13

bb12:
  %r192 = getelementptr [25 x i32 ], [25 x i32 ]* %r152, i32 0, i32 %r273
  %r277 = load i32, i32* %r192
  %r278 = sub i32 %r261, 1
  br label %bb14

bb14:
  %r279 = phi i32 [ %r272, %bb12 ], [ %r285, %bb19 ]
  %r280 = phi i32 [ %r278, %bb12 ], [ %r284, %bb19 ]
  %r197 = sub i32 0, 1
  %r198 = icmp sgt i32 %r280, %r197
  br i1 %r198, label %bb15, label %bb16

bb15:
  %r200 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r279
  %r201 = load i32, i32* %r200
  %r204 = getelementptr [25 x i32 ], [25 x i32 ]* %r151, i32 0, i32 %r280
  %r205 = load i32, i32* %r204
  %r206 = mul i32 %r277, %r205
  %r283 = add i32 %r201, %r206
  %r209 = icmp sge i32 %r283, 10
  br i1 %r209, label %bb17, label %bb18

bb17:
  %r212 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r279
  store i32 %r283, i32* %r212
  %r286 = sub i32 %r279, 1
  %r217 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r286
  %r218 = load i32, i32* %r217
  %r220 = sdiv i32 %r283, 10
  %r221 = add i32 %r218, %r220
  %r223 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r286
  store i32 %r221, i32* %r223
  br label %bb19

bb18:
  %r226 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r279
  store i32 %r283, i32* %r226
  br label %bb19

bb19:
  %r284 = sub i32 %r280, 1
  %r285 = sub i32 %r279, 1
  br label %bb14

bb16:
  %r233 = add i32 %r279, %r261
  %r281 = sub i32 %r233, 1
  %r282 = sub i32 %r273, 1
  br label %bb11

bb13:
  %r237 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0
  %r238 = load i32, i32* %r237
  %r239 = icmp ne i32 %r238, 0
  br i1 %r239, label %bb20, label %bb21

bb20:
  %r240 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0
  %r241 = load i32, i32* %r240
  call void @putint(i32 %r241)
  br label %bb22

bb21:
  br label %bb22

bb22:
  %r274 = add i32 1, 0
  br label %bb23

bb23:
  %r275 = phi i32 [ %r274, %bb22 ], [ %r276, %bb24 ]
  %r245 = add i32 %r261, %r262
  %r246 = sub i32 %r245, 1
  %r247 = icmp sle i32 %r275, %r246
  br i1 %r247, label %bb24, label %bb25

bb24:
  %r249 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r275
  %r250 = load i32, i32* %r249
  call void @putint(i32 %r250)
  %r276 = add i32 %r275, 1
  br label %bb23

bb25:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

