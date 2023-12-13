declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@TAPE_LEN = global i32 65536
@BUFFER_LEN = global i32 32768
@tape = global [ 65536 x i32 ] zeroinitializer
@program = global [ 32768 x i32 ] zeroinitializer
@ptr = global i32 0
define void @read_program( ) {
bb1:
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r186 = call i32 @getint()
  br label %bb2

bb2:
  %r187 = phi i32 [ %r184, %bb1 ], [ %r189, %bb3 ]
  %r105 = icmp slt i32 %r187, %r186
  br i1 %r105, label %bb3, label %bb4

bb3:
  %r188 = call i32 @getch()
  %r108 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r187
  store i32 %r188, i32* %r108
  %r189 = add i32 %r187, 1
  br label %bb2

bb4:
  %r112 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r187
  store i32 0, i32* %r112
  ret void
}

define void @interpret( i32* %r113 ) {
bb5:
  %r193 = add i32 0, 0
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  %r196 = add i32 0, 0
  br label %bb6

bb6:
  %r197 = phi i32 [ %r196, %bb5 ], [ %r201, %bb29 ]
  %r118 = getelementptr i32, i32* %r113, i32 %r197
  %r198 = load i32, i32* %r118
  %r120 = icmp ne i32 %r198, 0
  br i1 %r120, label %bb7, label %bb8

bb7:
  %r122 = getelementptr i32, i32* %r113, i32 %r197
  %r199 = load i32, i32* %r122
  %r125 = icmp eq i32 %r199, 62
  br i1 %r125, label %bb9, label %bb10

bb9:
  %r227 = load i32, i32* @ptr
  %r228 = add i32 %r227, 1
  store i32 %r228, i32* @ptr
  br label %bb11

bb10:
  br label %bb11

bb11:
  %r129 = icmp eq i32 %r199, 60
  br i1 %r129, label %bb12, label %bb13

bb12:
  %r225 = load i32, i32* @ptr
  %r226 = sub i32 %r225, 1
  store i32 %r226, i32* @ptr
  br label %bb14

bb13:
  br label %bb14

bb14:
  %r133 = icmp eq i32 %r199, 43
  br i1 %r133, label %bb15, label %bb16

bb15:
  %r221 = load i32, i32* @ptr
  %r135 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r221
  %r222 = load i32, i32* %r135
  %r223 = add i32 %r222, 1
  %r224 = load i32, i32* @ptr
  %r139 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r224
  store i32 %r223, i32* %r139
  br label %bb17

bb16:
  br label %bb17

bb17:
  %r141 = icmp eq i32 %r199, 45
  br i1 %r141, label %bb18, label %bb19

bb18:
  %r217 = load i32, i32* @ptr
  %r143 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r217
  %r218 = load i32, i32* %r143
  %r219 = sub i32 %r218, 1
  %r220 = load i32, i32* @ptr
  %r147 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r220
  store i32 %r219, i32* %r147
  br label %bb20

bb19:
  br label %bb20

bb20:
  %r149 = icmp eq i32 %r199, 46
  br i1 %r149, label %bb21, label %bb22

bb21:
  %r215 = load i32, i32* @ptr
  %r151 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r215
  %r216 = load i32, i32* %r151
  call void @putch(i32 %r216)
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r154 = icmp eq i32 %r199, 44
  br i1 %r154, label %bb24, label %bb25

bb24:
  %r213 = call i32 @getch()
  %r214 = load i32, i32* @ptr
  %r157 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r214
  store i32 %r213, i32* %r157
  br label %bb26

bb25:
  br label %bb26

bb26:
  %r159 = icmp eq i32 %r199, 93
  br i1 %r159, label %bb30, label %bb28

bb30:
  %r202 = load i32, i32* @ptr
  %r161 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r202
  %r203 = load i32, i32* %r161
  %r163 = icmp ne i32 %r203, 0
  br i1 %r163, label %bb27, label %bb28

bb27:
  %r204 = add i32 1, 0
  br label %bb31

bb31:
  %r205 = phi i32 [ %r204, %bb27 ], [ %r210, %bb39 ]
  %r206 = phi i32 [ %r197, %bb27 ], [ %r207, %bb39 ]
  %r165 = icmp sgt i32 %r205, 0
  br i1 %r165, label %bb32, label %bb33

bb32:
  %r207 = sub i32 %r206, 1
  %r169 = getelementptr i32, i32* %r113, i32 %r207
  %r208 = load i32, i32* %r169
  %r172 = icmp eq i32 %r208, 91
  br i1 %r172, label %bb34, label %bb35

bb34:
  %r212 = sub i32 %r205, 1
  br label %bb36

bb35:
  br label %bb36

bb36:
  %r209 = phi i32 [ %r212, %bb34 ], [ %r205, %bb35 ]
  %r176 = icmp eq i32 %r208, 93
  br i1 %r176, label %bb37, label %bb38

bb37:
  %r211 = add i32 %r209, 1
  br label %bb39

bb38:
  br label %bb39

bb39:
  %r210 = phi i32 [ %r211, %bb37 ], [ %r209, %bb38 ]
  br label %bb31

bb33:
  br label %bb29

bb28:
  br label %bb29

bb29:
  %r200 = phi i32 [ %r206, %bb33 ], [ %r197, %bb28 ]
  %r201 = add i32 %r200, 1
  br label %bb6

bb8:
  ret void
}

define i32 @main( ) {
bb40:
  call void @_sysy_starttime(i32 76)
  call void @read_program()
  call void @interpret(i32* @program)
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 80)
  ret i32 0
}

