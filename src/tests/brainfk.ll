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
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  %r102 = call i32 @getint()
  store i32 %r102, i32* %r101
  br label %bb2

bb2:
  %r103 = load i32, i32* %r100
  %r104 = load i32, i32* %r101
  %r105 = icmp slt i32 %r103, %r104
  br i1 %r105, label %bb3, label %bb4

bb3:
  %r106 = call i32 @getch()
  %r107 = load i32, i32* %r100
  %r108 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r107
  store i32 %r106, i32* %r108
  %r109 = load i32, i32* %r100
  %r110 = add i32 %r109, 1
  store i32 %r110, i32* %r100
  br label %bb2

bb4:
  %r111 = load i32, i32* %r100
  %r112 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r111
  store i32 0, i32* %r112
  ret void
}

define void @interpret( i32* %r113 ) {
bb5:
  %r114 = alloca i32
  %r115 = alloca i32
  %r116 = alloca i32
  store i32 0, i32* %r116
  br label %bb6

bb6:
  %r117 = load i32, i32* %r116
  %r118 = getelementptr i32, i32* %r113, i32 %r117
  %r119 = load i32, i32* %r118
  %r120 = icmp ne i32 %r119, 0
  br i1 %r120, label %bb7, label %bb8

bb7:
  %r121 = load i32, i32* %r116
  %r122 = getelementptr i32, i32* %r113, i32 %r121
  %r123 = load i32, i32* %r122
  store i32 %r123, i32* %r114
  %r124 = load i32, i32* %r114
  %r125 = icmp eq i32 %r124, 62
  br i1 %r125, label %bb9, label %bb10

bb9:
  %r126 = load i32, i32* @ptr
  %r127 = add i32 %r126, 1
  store i32 %r127, i32* @ptr
  br label %bb11

bb10:
  br label %bb11

bb11:
  %r128 = load i32, i32* %r114
  %r129 = icmp eq i32 %r128, 60
  br i1 %r129, label %bb12, label %bb13

bb12:
  %r130 = load i32, i32* @ptr
  %r131 = sub i32 %r130, 1
  store i32 %r131, i32* @ptr
  br label %bb14

bb13:
  br label %bb14

bb14:
  %r132 = load i32, i32* %r114
  %r133 = icmp eq i32 %r132, 43
  br i1 %r133, label %bb15, label %bb16

bb15:
  %r134 = load i32, i32* @ptr
  %r135 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r134
  %r136 = load i32, i32* %r135
  %r137 = add i32 %r136, 1
  %r138 = load i32, i32* @ptr
  %r139 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r138
  store i32 %r137, i32* %r139
  br label %bb17

bb16:
  br label %bb17

bb17:
  %r140 = load i32, i32* %r114
  %r141 = icmp eq i32 %r140, 45
  br i1 %r141, label %bb18, label %bb19

bb18:
  %r142 = load i32, i32* @ptr
  %r143 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r142
  %r144 = load i32, i32* %r143
  %r145 = sub i32 %r144, 1
  %r146 = load i32, i32* @ptr
  %r147 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r146
  store i32 %r145, i32* %r147
  br label %bb20

bb19:
  br label %bb20

bb20:
  %r148 = load i32, i32* %r114
  %r149 = icmp eq i32 %r148, 46
  br i1 %r149, label %bb21, label %bb22

bb21:
  %r150 = load i32, i32* @ptr
  %r151 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r150
  %r152 = load i32, i32* %r151
  call void @putch(i32 %r152)
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r153 = load i32, i32* %r114
  %r154 = icmp eq i32 %r153, 44
  br i1 %r154, label %bb24, label %bb25

bb24:
  %r155 = call i32 @getch()
  %r156 = load i32, i32* @ptr
  %r157 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r156
  store i32 %r155, i32* %r157
  br label %bb26

bb25:
  br label %bb26

bb26:
  %r158 = load i32, i32* %r114
  %r159 = icmp eq i32 %r158, 93
  br i1 %r159, label %bb30, label %bb28

bb30:
  %r160 = load i32, i32* @ptr
  %r161 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r160
  %r162 = load i32, i32* %r161
  %r163 = icmp ne i32 %r162, 0
  br i1 %r163, label %bb27, label %bb28

bb27:
  store i32 1, i32* %r115
  br label %bb31

bb31:
  %r164 = load i32, i32* %r115
  %r165 = icmp sgt i32 %r164, 0
  br i1 %r165, label %bb32, label %bb33

bb32:
  %r166 = load i32, i32* %r116
  %r167 = sub i32 %r166, 1
  store i32 %r167, i32* %r116
  %r168 = load i32, i32* %r116
  %r169 = getelementptr i32, i32* %r113, i32 %r168
  %r170 = load i32, i32* %r169
  store i32 %r170, i32* %r114
  %r171 = load i32, i32* %r114
  %r172 = icmp eq i32 %r171, 91
  br i1 %r172, label %bb34, label %bb35

bb34:
  %r173 = load i32, i32* %r115
  %r174 = sub i32 %r173, 1
  store i32 %r174, i32* %r115
  br label %bb36

bb35:
  br label %bb36

bb36:
  %r175 = load i32, i32* %r114
  %r176 = icmp eq i32 %r175, 93
  br i1 %r176, label %bb37, label %bb38

bb37:
  %r177 = load i32, i32* %r115
  %r178 = add i32 %r177, 1
  store i32 %r178, i32* %r115
  br label %bb39

bb38:
  br label %bb39

bb39:
  br label %bb31

bb33:
  br label %bb29

bb28:
  br label %bb29

bb29:
  %r179 = load i32, i32* %r116
  %r180 = add i32 %r179, 1
  store i32 %r180, i32* %r116
  br label %bb6

bb8:
  ret void
}

define i32 @main( ) {
bb40:
  call void @read_program()
  call void @interpret(i32* @program)
  call void @putch(i32 10)
  ret i32 0
}

