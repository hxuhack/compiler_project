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
  %r263 = add i32 0, 0
  %r264 = add i32 0, 0
  call void @_sysy_starttime(i32 4)
  %r265 = add i32 0, 0
  %r266 = add i32 0, 0
  %r267 = add i32 0, 0
  %r268 = add i32 0, 0
  %r269 = add i32 0, 0
  %r270 = add i32 0, 0
  %r271 = add i32 0, 0
  %r272 = add i32 0, 0
  %r273 = add i32 0, 0
  %r274 = add i32 0, 0
  %r275 = add i32 0, 0
  %r276 = add i32 0, 0
  %r277 = add i32 0, 0
  %r278 = add i32 0, 0
  %r279 = add i32 0, 0
  %r280 = add i32 0, 0
  %r281 = add i32 0, 0
  %r282 = add i32 0, 0
  %r283 = add i32 0, 0
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r286 = add i32 0, 0
  %r287 = add i32 0, 0
  %r288 = add i32 0, 0
  %r289 = add i32 0, 0
  %r290 = add i32 0, 0
  %r291 = add i32 0, 0
  %r292 = add i32 0, 0
  %r293 = add i32 0, 0
  %r294 = add i32 0, 0
  %r295 = add i32 0, 0
  %r296 = call i32 @getint()
  br label %bb2

bb2:
  %r297 = phi i32 [ %r296, %bb1 ], [ %r329, %bb3 ]
  %r133 = icmp eq i32 %r297, 5
  br i1 %r133, label %bb3, label %bb4

bb3:
  %r329 = add i32 %r297, 1
  br label %bb2

bb4:
  %r298 = add i32 0, 0
  %r299 = add i32 %r298, 1
  %r300 = add i32 %r299, 1
  %r301 = add i32 %r300, 1
  %r302 = add i32 %r301, 1
  %r303 = add i32 %r302, 1
  %r304 = add i32 %r303, 1
  %r305 = add i32 %r304, 1
  %r306 = add i32 %r305, 1
  %r307 = add i32 %r306, 1
  %r308 = add i32 %r307, 1
  %r309 = add i32 %r308, 1
  %r310 = add i32 %r309, 1
  %r311 = add i32 %r310, 1
  %r312 = add i32 %r311, 1
  %r313 = add i32 %r312, 1
  %r314 = add i32 %r313, 1
  %r315 = add i32 %r314, 1
  %r316 = add i32 %r315, 1
  %r317 = add i32 %r316, 1
  %r318 = add i32 %r317, 1
  %r319 = add i32 %r318, 1
  %r320 = add i32 %r319, 1
  %r321 = add i32 %r320, 1
  %r322 = add i32 %r321, 1
  %r323 = add i32 %r322, 1
  %r324 = add i32 %r323, 1
  %r325 = add i32 %r324, 1
  %r326 = add i32 %r325, 1
  %r327 = add i32 %r326, 1
  call void @putint(i32 %r298)
  call void @putint(i32 %r299)
  call void @putint(i32 %r300)
  call void @putint(i32 %r301)
  call void @putint(i32 %r302)
  call void @putint(i32 %r303)
  call void @putint(i32 %r304)
  call void @putint(i32 %r305)
  call void @putint(i32 %r306)
  call void @putint(i32 %r307)
  call void @putint(i32 %r308)
  call void @putint(i32 %r309)
  call void @putint(i32 %r310)
  call void @putint(i32 %r311)
  call void @putint(i32 %r312)
  call void @putint(i32 %r313)
  call void @putint(i32 %r314)
  call void @putint(i32 %r315)
  call void @putint(i32 %r316)
  call void @putint(i32 %r317)
  call void @putint(i32 %r318)
  call void @putint(i32 %r319)
  call void @putint(i32 %r320)
  call void @putint(i32 %r321)
  call void @putint(i32 %r322)
  call void @putint(i32 %r323)
  call void @putint(i32 %r324)
  call void @putint(i32 %r325)
  call void @putint(i32 %r326)
  call void @putint(i32 %r327)
  %r328 = add i32 10, 0
  call void @putch(i32 %r328)
  call void @putint(i32 %r297)
  call void @putch(i32 %r328)
  call void @_sysy_stoptime(i32 312)
  ret i32 %r323
}

