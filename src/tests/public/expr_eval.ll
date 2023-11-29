declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@TOKEN_NUM = global i32 0
@TOKEN_OTHER = global i32 1
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
define i32 @next_char( ) {
bb1:
  %r292 = call i32 @getch()
  store i32 %r292, i32* @last_char
  %r293 = load i32, i32* @last_char
  ret i32 %r293
}

define i32 @is_space( i32 %r102 ) {
bb81:
  %r295 = add i32 0, 0
  %r296 = add i32 %r102, 0
  br label %bb2

bb2:
  %r105 = icmp eq i32 %r296, 32
  br i1 %r105, label %bb3, label %bb6

bb6:
  %r107 = icmp eq i32 %r296, 10
  br i1 %r107, label %bb3, label %bb4

bb3:
  ret i32 1
bb4:
  ret i32 0
}

define i32 @is_num( i32 %r108 ) {
bb84:
  %r298 = add i32 0, 0
  %r299 = add i32 %r108, 0
  br label %bb7

bb7:
  %r111 = icmp sge i32 %r299, 48
  br i1 %r111, label %bb11, label %bb9

bb11:
  %r113 = icmp sle i32 %r299, 57
  br i1 %r113, label %bb8, label %bb9

bb8:
  ret i32 1
bb9:
  ret i32 0
}

define i32 @next_token( ) {
bb12:
  br label %bb13

bb13:
  %r300 = load i32, i32* @last_char
  %r301 = call i32 @is_space(i32 %r300)
  %r116 = icmp ne i32 %r301, 0
  br i1 %r116, label %bb14, label %bb15

bb14:
  call void @next_char()
  br label %bb13

bb15:
  %r302 = load i32, i32* @last_char
  %r303 = call i32 @is_num(i32 %r302)
  %r119 = icmp ne i32 %r303, 0
  br i1 %r119, label %bb16, label %bb17

bb16:
  %r307 = load i32, i32* @last_char
  %r308 = sub i32 %r307, 48
  store i32 %r308, i32* @num
  br label %bb19

bb19:
  %r309 = call i32 @next_char()
  %r310 = call i32 @is_num(i32 %r309)
  %r124 = icmp ne i32 %r310, 0
  br i1 %r124, label %bb20, label %bb21

bb20:
  %r312 = load i32, i32* @num
  %r313 = mul i32 %r312, 10
  %r314 = load i32, i32* @last_char
  %r315 = add i32 %r313, %r314
  %r316 = sub i32 %r315, 48
  store i32 %r316, i32* @num
  br label %bb19

bb21:
  %r311 = load i32, i32* @TOKEN_NUM
  store i32 %r311, i32* @cur_token
  br label %bb18

bb17:
  %r305 = load i32, i32* @last_char
  store i32 %r305, i32* @other
  call void @next_char()
  %r306 = load i32, i32* @TOKEN_OTHER
  store i32 %r306, i32* @cur_token
  br label %bb18

bb18:
  %r304 = load i32, i32* @cur_token
  ret i32 %r304
}

define i32 @panic( ) {
bb22:
  call void @putch(i32 112)
  call void @putch(i32 97)
  call void @putch(i32 110)
  call void @putch(i32 105)
  call void @putch(i32 99)
  call void @putch(i32 33)
  call void @putch(i32 10)
  %r317 = sub i32 0, 1
  ret i32 %r317
}

define i32 @get_op_prec( i32 %r135 ) {
bb87:
  %r319 = add i32 0, 0
  %r320 = add i32 %r135, 0
  br label %bb23

bb23:
  %r138 = icmp eq i32 %r320, 43
  br i1 %r138, label %bb24, label %bb27

bb27:
  %r140 = icmp eq i32 %r320, 45
  br i1 %r140, label %bb24, label %bb25

bb24:
  ret i32 10
bb25:
  br label %bb26

bb26:
  %r142 = icmp eq i32 %r320, 42
  br i1 %r142, label %bb28, label %bb32

bb32:
  %r144 = icmp eq i32 %r320, 47
  br i1 %r144, label %bb28, label %bb31

bb31:
  %r146 = icmp eq i32 %r320, 37
  br i1 %r146, label %bb28, label %bb29

bb28:
  ret i32 20
bb29:
  br label %bb30

bb30:
  ret i32 0
}

define void @stack_push( i32* %r147, i32 %r148 ) {
bb90:
  %r323 = add i32 0, 0
  %r324 = add i32 0, 0
  %r325 = add i32 %r148, 0
  br label %bb33

bb33:
  %r150 = getelementptr i32, i32* %r147, i32 0
  %r326 = load i32, i32* %r150
  %r327 = add i32 %r326, 1
  %r153 = getelementptr i32, i32* %r147, i32 0
  store i32 %r327, i32* %r153
  %r155 = getelementptr i32, i32* %r147, i32 0
  %r328 = load i32, i32* %r155
  %r159 = getelementptr i32, i32* %r147, i32 %r328
  store i32 %r325, i32* %r159
  ret void
}

define i32 @stack_pop( i32* %r160 ) {
bb34:
  %r331 = add i32 0, 0
  %r162 = getelementptr i32, i32* %r160, i32 0
  %r332 = load i32, i32* %r162
  %r333 = add i32 0, 0
  %r166 = getelementptr i32, i32* %r160, i32 %r332
  %r334 = load i32, i32* %r166
  %r168 = getelementptr i32, i32* %r160, i32 0
  %r335 = load i32, i32* %r168
  %r336 = sub i32 %r335, 1
  %r171 = getelementptr i32, i32* %r160, i32 0
  store i32 %r336, i32* %r171
  ret i32 %r334
}

define i32 @stack_peek( i32* %r173 ) {
bb35:
  %r338 = add i32 0, 0
  %r175 = getelementptr i32, i32* %r173, i32 0
  %r339 = load i32, i32* %r175
  %r178 = getelementptr i32, i32* %r173, i32 %r339
  %r340 = load i32, i32* %r178
  ret i32 %r340
}

define i32 @stack_size( i32* %r180 ) {
bb36:
  %r181 = getelementptr i32, i32* %r180, i32 0
  %r341 = load i32, i32* %r181
  ret i32 %r341
}

define i32 @mod( i32 %r183, i32 %r185 ) {
bb91:
  %r344 = add i32 0, 0
  %r345 = add i32 %r183, 0
  %r346 = add i32 0, 0
  %r347 = add i32 %r185, 0
  br label %bb37

bb37:
  %r348 = sdiv i32 %r345, %r347
  %r349 = mul i32 %r348, %r347
  %r350 = sub i32 %r345, %r349
  ret i32 %r350
}

define i32 @eval_op( i32 %r194, i32 %r196, i32 %r198 ) {
bb92:
  %r354 = add i32 0, 0
  %r355 = add i32 %r194, 0
  %r356 = add i32 0, 0
  %r357 = add i32 %r196, 0
  %r358 = add i32 0, 0
  %r359 = add i32 %r198, 0
  br label %bb38

bb38:
  %r201 = icmp eq i32 %r355, 43
  br i1 %r201, label %bb39, label %bb40

bb39:
  %r364 = add i32 %r357, %r359
  ret i32 %r364
bb40:
  br label %bb41

bb41:
  %r206 = icmp eq i32 %r355, 45
  br i1 %r206, label %bb42, label %bb43

bb42:
  %r363 = sub i32 %r357, %r359
  ret i32 %r363
bb43:
  br label %bb44

bb44:
  %r211 = icmp eq i32 %r355, 42
  br i1 %r211, label %bb45, label %bb46

bb45:
  %r362 = mul i32 %r357, %r359
  ret i32 %r362
bb46:
  br label %bb47

bb47:
  %r216 = icmp eq i32 %r355, 47
  br i1 %r216, label %bb48, label %bb49

bb48:
  %r361 = sdiv i32 %r357, %r359
  ret i32 %r361
bb49:
  br label %bb50

bb50:
  %r221 = icmp eq i32 %r355, 37
  br i1 %r221, label %bb51, label %bb52

bb51:
  %r360 = call i32 @mod(i32 %r357, i32 %r359)
  ret i32 %r360
bb52:
  br label %bb53

bb53:
  ret i32 0
}

define i32 @eval( ) {
bb54:
  %r373 = add i32 0, 0
  %r374 = add i32 0, 0
  %r375 = add i32 0, 0
  %r376 = add i32 0, 0
  %r377 = add i32 0, 0
  %r378 = add i32 0, 0
  %r379 = add i32 0, 0
  %r225 = alloca [ 256 x i32 ]
  %r226 = alloca [ 256 x i32 ]
  %r380 = add i32 0, 0
  %r381 = add i32 0, 0
  br label %bb55

bb55:
  %r382 = phi i32 [ %r381, %bb54 ], [ %r409, %bb56 ]
  %r229 = icmp slt i32 %r382, 256
  br i1 %r229, label %bb56, label %bb57

bb56:
  %r231 = getelementptr [256 x i32 ], [256 x i32 ]* %r225, i32 0, i32 %r382
  store i32 0, i32* %r231
  %r233 = getelementptr [256 x i32 ], [256 x i32 ]* %r226, i32 0, i32 %r382
  store i32 0, i32* %r233
  %r409 = add i32 %r382, 1
  br label %bb55

bb57:
  %r383 = load i32, i32* @cur_token
  %r384 = load i32, i32* @TOKEN_NUM
  %r238 = icmp ne i32 %r383, %r384
  br i1 %r238, label %bb58, label %bb59

bb58:
  %r408 = call i32 @panic()
  ret i32 %r408
bb59:
  br label %bb60

bb60:
  %r385 = load i32, i32* @num
  call void @stack_push(i32* %r225, i32 %r385)
  call void @next_token()
  br label %bb61

bb61:
  %r386 = load i32, i32* @cur_token
  %r387 = load i32, i32* @TOKEN_OTHER
  %r243 = icmp eq i32 %r386, %r387
  br i1 %r243, label %bb62, label %bb63

bb62:
  %r394 = load i32, i32* @other
  %r395 = call i32 @get_op_prec(i32 %r394)
  %r248 = icmp eq i32 %r395, 0
  br i1 %r248, label %bb64, label %bb65

bb64:
  br label %bb63

bb65:
  br label %bb66

bb66:
  call void @next_token()
  br label %bb67

bb67:
  %r396 = call i32 @stack_size(i32* %r226)
  %r250 = icmp ne i32 %r396, 0
  br i1 %r250, label %bb70, label %bb69

bb70:
  %r401 = call i32 @stack_peek(i32* %r226)
  %r402 = call i32 @get_op_prec(i32 %r401)
  %r403 = call i32 @get_op_prec(i32 %r394)
  %r255 = icmp sge i32 %r402, %r403
  br i1 %r255, label %bb68, label %bb69

bb68:
  %r404 = call i32 @stack_pop(i32* %r226)
  %r405 = call i32 @stack_pop(i32* %r225)
  %r406 = call i32 @stack_pop(i32* %r225)
  %r407 = call i32 @eval_op(i32 %r404, i32 %r406, i32 %r405)
  call void @stack_push(i32* %r225, i32 %r407)
  br label %bb67

bb69:
  call void @stack_push(i32* %r226, i32 %r394)
  %r397 = load i32, i32* @cur_token
  %r398 = load i32, i32* @TOKEN_NUM
  %r269 = icmp ne i32 %r397, %r398
  br i1 %r269, label %bb71, label %bb72

bb71:
  %r400 = call i32 @panic()
  ret i32 %r400
bb72:
  br label %bb73

bb73:
  %r399 = load i32, i32* @num
  call void @stack_push(i32* %r225, i32 %r399)
  call void @next_token()
  br label %bb61

bb63:
  call void @next_token()
  br label %bb74

bb74:
  %r388 = call i32 @stack_size(i32* %r226)
  %r273 = icmp ne i32 %r388, 0
  br i1 %r273, label %bb75, label %bb76

bb75:
  %r390 = call i32 @stack_pop(i32* %r226)
  %r391 = call i32 @stack_pop(i32* %r225)
  %r392 = call i32 @stack_pop(i32* %r225)
  %r393 = call i32 @eval_op(i32 %r390, i32 %r392, i32 %r391)
  call void @stack_push(i32* %r225, i32 %r393)
  br label %bb74

bb76:
  %r389 = call i32 @stack_peek(i32* %r225)
  ret i32 %r389
}

define i32 @main( ) {
bb77:
  call void @_sysy_starttime(i32 205)
  %r411 = add i32 0, 0
  %r412 = call i32 @getint()
  call void @getch()
  call void @next_token()
  br label %bb78

bb78:
  %r413 = phi i32 [ %r412, %bb77 ], [ %r415, %bb79 ]
  %r288 = icmp ne i32 %r413, 0
  br i1 %r288, label %bb79, label %bb80

bb79:
  %r414 = call i32 @eval()
  call void @putint(i32 %r414)
  call void @putch(i32 10)
  %r415 = sub i32 %r413, 1
  br label %bb78

bb80:
  call void @_sysy_stoptime(i32 214)
  ret i32 0
}

