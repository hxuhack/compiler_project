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
  %r100 = call i32 @getch()
  store i32 %r100, i32* @last_char
  %r101 = load i32, i32* @last_char
  ret i32 %r101
}

define i32 @is_space( i32 %r102 ) {
bb81:
  %r292 = add i32 0, 0
  %r293 = add i32 %r102, 0
  br label %bb2

bb2:
  %r105 = icmp eq i32 %r293, 32
  br i1 %r105, label %bb3, label %bb6

bb6:
  %r107 = icmp eq i32 %r293, 10
  br i1 %r107, label %bb3, label %bb4

bb3:
  ret i32 1
bb4:
  ret i32 0
}

define i32 @is_num( i32 %r108 ) {
bb84:
  %r294 = add i32 0, 0
  %r295 = add i32 %r108, 0
  br label %bb7

bb7:
  %r111 = icmp sge i32 %r295, 48
  br i1 %r111, label %bb11, label %bb9

bb11:
  %r113 = icmp sle i32 %r295, 57
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
  %r114 = load i32, i32* @last_char
  %r115 = call i32 @is_space(i32 %r114)
  %r116 = icmp ne i32 %r115, 0
  br i1 %r116, label %bb14, label %bb15

bb14:
  call void @next_char()
  br label %bb13

bb15:
  %r117 = load i32, i32* @last_char
  %r118 = call i32 @is_num(i32 %r117)
  %r119 = icmp ne i32 %r118, 0
  br i1 %r119, label %bb16, label %bb17

bb16:
  %r120 = load i32, i32* @last_char
  %r121 = sub i32 %r120, 48
  store i32 %r121, i32* @num
  br label %bb19

bb19:
  %r122 = call i32 @next_char()
  %r123 = call i32 @is_num(i32 %r122)
  %r124 = icmp ne i32 %r123, 0
  br i1 %r124, label %bb20, label %bb21

bb20:
  %r125 = load i32, i32* @num
  %r126 = mul i32 %r125, 10
  %r127 = load i32, i32* @last_char
  %r128 = add i32 %r126, %r127
  %r129 = sub i32 %r128, 48
  store i32 %r129, i32* @num
  br label %bb19

bb21:
  %r130 = load i32, i32* @TOKEN_NUM
  store i32 %r130, i32* @cur_token
  br label %bb18

bb17:
  %r131 = load i32, i32* @last_char
  store i32 %r131, i32* @other
  call void @next_char()
  %r132 = load i32, i32* @TOKEN_OTHER
  store i32 %r132, i32* @cur_token
  br label %bb18

bb18:
  %r133 = load i32, i32* @cur_token
  ret i32 %r133
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
  %r134 = sub i32 0, 1
  ret i32 %r134
}

define i32 @get_op_prec( i32 %r135 ) {
bb87:
  %r296 = add i32 0, 0
  %r297 = add i32 %r135, 0
  br label %bb23

bb23:
  %r138 = icmp eq i32 %r297, 43
  br i1 %r138, label %bb24, label %bb27

bb27:
  %r140 = icmp eq i32 %r297, 45
  br i1 %r140, label %bb24, label %bb25

bb24:
  ret i32 10
bb25:
  br label %bb26

bb26:
  %r142 = icmp eq i32 %r297, 42
  br i1 %r142, label %bb28, label %bb32

bb32:
  %r144 = icmp eq i32 %r297, 47
  br i1 %r144, label %bb28, label %bb31

bb31:
  %r146 = icmp eq i32 %r297, 37
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
  %r298 = add i32 0, 0
  %r299 = add i32 0, 0
  %r300 = add i32 %r148, 0
  br label %bb33

bb33:
  %r150 = getelementptr i32, i32* %r147, i32 0
  %r151 = load i32, i32* %r150
  %r152 = add i32 %r151, 1
  %r153 = getelementptr i32, i32* %r147, i32 0
  store i32 %r152, i32* %r153
  %r155 = getelementptr i32, i32* %r147, i32 0
  %r301 = load i32, i32* %r155
  %r159 = getelementptr i32, i32* %r147, i32 %r301
  store i32 %r300, i32* %r159
  ret void
}

define i32 @stack_pop( i32* %r160 ) {
bb34:
  %r302 = add i32 0, 0
  %r162 = getelementptr i32, i32* %r160, i32 0
  %r304 = load i32, i32* %r162
  %r303 = add i32 0, 0
  %r166 = getelementptr i32, i32* %r160, i32 %r304
  %r305 = load i32, i32* %r166
  %r168 = getelementptr i32, i32* %r160, i32 0
  %r169 = load i32, i32* %r168
  %r170 = sub i32 %r169, 1
  %r171 = getelementptr i32, i32* %r160, i32 0
  store i32 %r170, i32* %r171
  ret i32 %r305
}

define i32 @stack_peek( i32* %r173 ) {
bb35:
  %r306 = add i32 0, 0
  %r175 = getelementptr i32, i32* %r173, i32 0
  %r307 = load i32, i32* %r175
  %r178 = getelementptr i32, i32* %r173, i32 %r307
  %r179 = load i32, i32* %r178
  ret i32 %r179
}

define i32 @stack_size( i32* %r180 ) {
bb36:
  %r181 = getelementptr i32, i32* %r180, i32 0
  %r182 = load i32, i32* %r181
  ret i32 %r182
}

define i32 @mod( i32 %r183, i32 %r185 ) {
bb91:
  %r308 = add i32 0, 0
  %r310 = add i32 %r183, 0
  %r309 = add i32 0, 0
  %r311 = add i32 %r185, 0
  br label %bb37

bb37:
  %r190 = sdiv i32 %r310, %r311
  %r192 = mul i32 %r190, %r311
  %r193 = sub i32 %r310, %r192
  ret i32 %r193
}

define i32 @eval_op( i32 %r194, i32 %r196, i32 %r198 ) {
bb92:
  %r312 = add i32 0, 0
  %r315 = add i32 %r194, 0
  %r313 = add i32 0, 0
  %r316 = add i32 %r196, 0
  %r314 = add i32 0, 0
  %r317 = add i32 %r198, 0
  br label %bb38

bb38:
  %r201 = icmp eq i32 %r315, 43
  br i1 %r201, label %bb39, label %bb40

bb39:
  %r204 = add i32 %r316, %r317
  ret i32 %r204
bb40:
  br label %bb41

bb41:
  %r206 = icmp eq i32 %r315, 45
  br i1 %r206, label %bb42, label %bb43

bb42:
  %r209 = sub i32 %r316, %r317
  ret i32 %r209
bb43:
  br label %bb44

bb44:
  %r211 = icmp eq i32 %r315, 42
  br i1 %r211, label %bb45, label %bb46

bb45:
  %r214 = mul i32 %r316, %r317
  ret i32 %r214
bb46:
  br label %bb47

bb47:
  %r216 = icmp eq i32 %r315, 47
  br i1 %r216, label %bb48, label %bb49

bb48:
  %r219 = sdiv i32 %r316, %r317
  ret i32 %r219
bb49:
  br label %bb50

bb50:
  %r221 = icmp eq i32 %r315, 37
  br i1 %r221, label %bb51, label %bb52

bb51:
  %r224 = call i32 @mod(i32 %r316, i32 %r317)
  ret i32 %r224
bb52:
  br label %bb53

bb53:
  ret i32 0
}

define i32 @eval( ) {
bb54:
  %r318 = add i32 0, 0
  %r319 = add i32 0, 0
  %r320 = add i32 0, 0
  %r321 = add i32 0, 0
  %r322 = add i32 0, 0
  %r323 = add i32 0, 0
  %r324 = add i32 0, 0
  %r225 = alloca [ 256 x i32 ]
  %r226 = alloca [ 256 x i32 ]
  %r325 = add i32 0, 0
  %r326 = add i32 0, 0
  br label %bb55

bb55:
  %r327 = phi i32 [ %r326, %bb54 ], [ %r335, %bb56 ]
  %r229 = icmp slt i32 %r327, 256
  br i1 %r229, label %bb56, label %bb57

bb56:
  %r231 = getelementptr [256 x i32 ], [256 x i32 ]* %r225, i32 0, i32 %r327
  store i32 0, i32* %r231
  %r233 = getelementptr [256 x i32 ], [256 x i32 ]* %r226, i32 0, i32 %r327
  store i32 0, i32* %r233
  %r335 = add i32 %r327, 1
  br label %bb55

bb57:
  %r236 = load i32, i32* @cur_token
  %r237 = load i32, i32* @TOKEN_NUM
  %r238 = icmp ne i32 %r236, %r237
  br i1 %r238, label %bb58, label %bb59

bb58:
  %r239 = call i32 @panic()
  ret i32 %r239
bb59:
  br label %bb60

bb60:
  %r240 = load i32, i32* @num
  call void @stack_push(i32* %r225, i32 %r240)
  call void @next_token()
  br label %bb61

bb61:
  %r241 = load i32, i32* @cur_token
  %r242 = load i32, i32* @TOKEN_OTHER
  %r243 = icmp eq i32 %r241, %r242
  br i1 %r243, label %bb62, label %bb63

bb62:
  %r331 = load i32, i32* @other
  %r247 = call i32 @get_op_prec(i32 %r331)
  %r248 = icmp eq i32 %r247, 0
  br i1 %r248, label %bb64, label %bb65

bb64:
  br label %bb63

bb65:
  br label %bb66

bb66:
  call void @next_token()
  br label %bb67

bb67:
  %r249 = call i32 @stack_size(i32* %r226)
  %r250 = icmp ne i32 %r249, 0
  br i1 %r250, label %bb70, label %bb69

bb70:
  %r251 = call i32 @stack_peek(i32* %r226)
  %r252 = call i32 @get_op_prec(i32 %r251)
  %r254 = call i32 @get_op_prec(i32 %r331)
  %r255 = icmp sge i32 %r252, %r254
  br i1 %r255, label %bb68, label %bb69

bb68:
  %r332 = call i32 @stack_pop(i32* %r226)
  %r333 = call i32 @stack_pop(i32* %r225)
  %r334 = call i32 @stack_pop(i32* %r225)
  %r265 = call i32 @eval_op(i32 %r332, i32 %r334, i32 %r333)
  call void @stack_push(i32* %r225, i32 %r265)
  br label %bb67

bb69:
  call void @stack_push(i32* %r226, i32 %r331)
  %r267 = load i32, i32* @cur_token
  %r268 = load i32, i32* @TOKEN_NUM
  %r269 = icmp ne i32 %r267, %r268
  br i1 %r269, label %bb71, label %bb72

bb71:
  %r270 = call i32 @panic()
  ret i32 %r270
bb72:
  br label %bb73

bb73:
  %r271 = load i32, i32* @num
  call void @stack_push(i32* %r225, i32 %r271)
  call void @next_token()
  br label %bb61

bb63:
  call void @next_token()
  br label %bb74

bb74:
  %r272 = call i32 @stack_size(i32* %r226)
  %r273 = icmp ne i32 %r272, 0
  br i1 %r273, label %bb75, label %bb76

bb75:
  %r328 = call i32 @stack_pop(i32* %r226)
  %r329 = call i32 @stack_pop(i32* %r225)
  %r330 = call i32 @stack_pop(i32* %r225)
  %r283 = call i32 @eval_op(i32 %r328, i32 %r330, i32 %r329)
  call void @stack_push(i32* %r225, i32 %r283)
  br label %bb74

bb76:
  %r284 = call i32 @stack_peek(i32* %r225)
  ret i32 %r284
}

define i32 @main( ) {
bb77:
  call void @_sysy_starttime(i32 205)
  %r336 = add i32 0, 0
  %r337 = call i32 @getint()
  call void @getch()
  call void @next_token()
  br label %bb78

bb78:
  %r338 = phi i32 [ %r337, %bb77 ], [ %r339, %bb79 ]
  %r288 = icmp ne i32 %r338, 0
  br i1 %r288, label %bb79, label %bb80

bb79:
  %r289 = call i32 @eval()
  call void @putint(i32 %r289)
  call void @putch(i32 10)
  %r339 = sub i32 %r338, 1
  br label %bb78

bb80:
  call void @_sysy_stoptime(i32 214)
  ret i32 0
}

