declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @main( ) {
bb1:
  %r230 = add i32 0, 0
  %r231 = add i32 0, 0
  call void @_sysy_starttime(i32 4)
  %r232 = add i32 0, 0
  %r233 = add i32 0, 0
  %r234 = add i32 0, 0
  %r235 = add i32 0, 0
  %r236 = add i32 0, 0
  %r237 = add i32 0, 0
  %r238 = add i32 0, 0
  %r239 = add i32 0, 0
  %r240 = add i32 0, 0
  %r241 = add i32 0, 0
  %r242 = add i32 0, 0
  %r243 = add i32 0, 0
  %r244 = add i32 0, 0
  %r245 = add i32 0, 0
  %r246 = add i32 0, 0
  %r247 = add i32 0, 0
  %r248 = add i32 0, 0
  %r249 = add i32 0, 0
  %r250 = add i32 0, 0
  %r251 = add i32 0, 0
  %r252 = add i32 0, 0
  %r253 = add i32 0, 0
  %r254 = add i32 0, 0
  %r255 = add i32 0, 0
  %r256 = add i32 0, 0
  %r257 = add i32 0, 0
  %r258 = add i32 0, 0
  %r259 = add i32 0, 0
  %r260 = add i32 0, 0
  %r261 = add i32 0, 0
  %r262 = add i32 0, 0
  %r263 = call i32 @getint()
  br label %bb2

bb2:
  %r264 = phi i32 [ %r263, %bb1 ], [ %r296, %bb3 ]
  %r133 = icmp eq i32 %r264, 5
  br i1 %r133, label %bb3, label %bb4

bb3:
  %r296 = add i32 %r264, 1
  br label %bb2

bb4:
  %r265 = add i32 0, 0
  %r266 = add i32 %r265, 1
  %r267 = add i32 %r266, 1
  %r268 = add i32 %r267, 1
  %r269 = add i32 %r268, 1
  %r270 = add i32 %r269, 1
  %r271 = add i32 %r270, 1
  %r272 = add i32 %r271, 1
  %r273 = add i32 %r272, 1
  %r274 = add i32 %r273, 1
  %r275 = add i32 %r274, 1
  %r276 = add i32 %r275, 1
  %r277 = add i32 %r276, 1
  %r278 = add i32 %r277, 1
  %r279 = add i32 %r278, 1
  %r280 = add i32 %r279, 1
  %r281 = add i32 %r280, 1
  %r282 = add i32 %r281, 1
  %r283 = add i32 %r282, 1
  %r284 = add i32 %r283, 1
  %r285 = add i32 %r284, 1
  %r286 = add i32 %r285, 1
  %r287 = add i32 %r286, 1
  %r288 = add i32 %r287, 1
  %r289 = add i32 %r288, 1
  %r290 = add i32 %r289, 1
  %r291 = add i32 %r290, 1
  %r292 = add i32 %r291, 1
  %r293 = add i32 %r292, 1
  %r294 = add i32 %r293, 1
  call void @putint(i32 %r265)
  call void @putint(i32 %r266)
  call void @putint(i32 %r267)
  call void @putint(i32 %r268)
  call void @putint(i32 %r269)
  call void @putint(i32 %r270)
  call void @putint(i32 %r271)
  call void @putint(i32 %r272)
  call void @putint(i32 %r273)
  call void @putint(i32 %r274)
  call void @putint(i32 %r275)
  call void @putint(i32 %r276)
  call void @putint(i32 %r277)
  call void @putint(i32 %r278)
  call void @putint(i32 %r279)
  call void @putint(i32 %r280)
  call void @putint(i32 %r281)
  call void @putint(i32 %r282)
  call void @putint(i32 %r283)
  call void @putint(i32 %r284)
  call void @putint(i32 %r285)
  call void @putint(i32 %r286)
  call void @putint(i32 %r287)
  call void @putint(i32 %r288)
  call void @putint(i32 %r289)
  call void @putint(i32 %r290)
  call void @putint(i32 %r291)
  call void @putint(i32 %r292)
  call void @putint(i32 %r293)
  call void @putint(i32 %r294)
  %r295 = add i32 10, 0
  call void @putch(i32 %r295)
  call void @putint(i32 %r264)
  call void @putch(i32 %r295)
  call void @_sysy_stoptime(i32 312)
  ret i32 %r290
}

