declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @swap( i32* %r100, i32 %r101, i32 %r103 ) {
bb24:
  %r222 = add i32 0, 0
  %r223 = add i32 0, 0
  %r224 = add i32 %r101, 0
  %r225 = add i32 0, 0
  %r226 = add i32 %r103, 0
  br label %bb1

bb1:
  %r107 = getelementptr i32, i32* %r100, i32 %r224
  %r227 = load i32, i32* %r107
  %r110 = getelementptr i32, i32* %r100, i32 %r226
  %r228 = load i32, i32* %r110
  %r113 = getelementptr i32, i32* %r100, i32 %r224
  store i32 %r228, i32* %r113
  %r116 = getelementptr i32, i32* %r100, i32 %r226
  store i32 %r227, i32* %r116
  ret i32 0
}

define i32 @heap_ajust( i32* %r117, i32 %r118, i32 %r120 ) {
bb25:
  %r234 = add i32 0, 0
  %r235 = add i32 0, 0
  %r236 = add i32 0, 0
  %r237 = add i32 0, 0
  %r238 = add i32 %r118, 0
  %r239 = add i32 0, 0
  %r240 = add i32 %r120, 0
  br label %bb2

bb2:
  %r241 = add i32 %r238, 0
  %r242 = mul i32 %r241, 2
  %r243 = add i32 %r242, 1
  br label %bb3

bb3:
  %r244 = phi i32 [ %r243, %bb2 ], [ %r254, %bb12 ]
  %r245 = phi i32 [ %r241, %bb2 ], [ %r252, %bb12 ]
  %r246 = add i32 %r240, 1
  %r131 = icmp slt i32 %r244, %r246
  br i1 %r131, label %bb4, label %bb5

bb4:
  %r247 = add i32 %r244, 1
  %r137 = icmp slt i32 %r244, %r240
  br i1 %r137, label %bb9, label %bb7

bb9:
  %r139 = getelementptr i32, i32* %r117, i32 %r244
  %r255 = load i32, i32* %r139
  %r142 = getelementptr i32, i32* %r117, i32 %r247
  %r256 = load i32, i32* %r142
  %r144 = icmp slt i32 %r255, %r256
  br i1 %r144, label %bb6, label %bb7

bb6:
  %r257 = add i32 %r244, 1
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r248 = phi i32 [ %r257, %bb6 ], [ %r244, %bb7 ]
  %r148 = getelementptr i32, i32* %r117, i32 %r245
  %r249 = load i32, i32* %r148
  %r151 = getelementptr i32, i32* %r117, i32 %r248
  %r250 = load i32, i32* %r151
  %r153 = icmp sgt i32 %r249, %r250
  br i1 %r153, label %bb10, label %bb11

bb10:
  ret i32 0
bb11:
  %r251 = call i32 @swap(i32* %r117, i32 %r245, i32 %r248)
  %r252 = add i32 %r248, 0
  %r253 = mul i32 %r252, 2
  %r254 = add i32 %r253, 1
  br label %bb12

bb12:
  br label %bb3

bb5:
  ret i32 0
}

define i32 @heap_sort( i32* %r161, i32 %r162 ) {
bb27:
  %r262 = add i32 0, 0
  %r263 = add i32 0, 0
  %r264 = add i32 0, 0
  %r265 = add i32 0, 0
  %r266 = add i32 %r162, 0
  br label %bb13

bb13:
  %r267 = sdiv i32 %r266, 2
  %r268 = sub i32 %r267, 1
  br label %bb14

bb14:
  %r269 = phi i32 [ %r268, %bb13 ], [ %r280, %bb15 ]
  %r270 = sub i32 0, 1
  %r171 = icmp sgt i32 %r269, %r270
  br i1 %r171, label %bb15, label %bb16

bb15:
  %r278 = sub i32 %r266, 1
  %r279 = call i32 @heap_ajust(i32* %r161, i32 %r269, i32 %r278)
  %r280 = sub i32 %r269, 1
  br label %bb14

bb16:
  %r271 = sub i32 %r266, 1
  br label %bb17

bb17:
  %r272 = phi i32 [ %r271, %bb16 ], [ %r277, %bb18 ]
  %r182 = icmp sgt i32 %r272, 0
  br i1 %r182, label %bb18, label %bb19

bb18:
  %r273 = add i32 0, 0
  %r274 = call i32 @swap(i32* %r161, i32 %r273, i32 %r272)
  %r275 = sub i32 %r272, 1
  %r276 = call i32 @heap_ajust(i32* %r161, i32 %r273, i32 %r275)
  %r277 = sub i32 %r272, 1
  br label %bb17

bb19:
  ret i32 0
}

define i32 @main( ) {
bb20:
  %r283 = add i32 0, 0
  call void @_sysy_starttime(i32 50)
  store i32 10, i32* @n
  %r194 = alloca [ 10 x i32 ]
  %r195 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 0
  store i32 4, i32* %r195
  %r196 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 1
  store i32 3, i32* %r196
  %r197 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 2
  store i32 9, i32* %r197
  %r198 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 3
  store i32 2, i32* %r198
  %r199 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 4
  store i32 0, i32* %r199
  %r200 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 5
  store i32 1, i32* %r200
  %r201 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 6
  store i32 6, i32* %r201
  %r202 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 7
  store i32 5, i32* %r202
  %r203 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 8
  store i32 7, i32* %r203
  %r204 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 9
  store i32 8, i32* %r204
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r286 = load i32, i32* @n
  %r287 = call i32 @heap_sort(i32* %r194, i32 %r286)
  br label %bb21

bb21:
  %r288 = phi i32 [ %r287, %bb20 ], [ %r292, %bb22 ]
  %r289 = load i32, i32* @n
  %r210 = icmp slt i32 %r288, %r289
  br i1 %r210, label %bb22, label %bb23

bb22:
  %r213 = getelementptr [10 x i32 ], [10 x i32 ]* %r194, i32 0, i32 %r288
  %r290 = load i32, i32* %r213
  call void @putint(i32 %r290)
  %r291 = add i32 10, 0
  call void @putch(i32 %r291)
  %r292 = add i32 %r288, 1
  br label %bb21

bb23:
  call void @_sysy_stoptime(i32 66)
  ret i32 0
}

