declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@ascii_0 = global i32 48
define i32 @my_getint( ) {
bb1:
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  br label %bb2

bb2:
  %r102 = icmp sgt i32 1, 0
  br i1 %r102, label %bb3, label %bb4

bb3:
  %r103 = call i32 @getch()
  %r104 = load i32, i32* @ascii_0
  %r105 = sub i32 %r103, %r104
  store i32 %r105, i32* %r101
  %r106 = load i32, i32* %r101
  %r107 = icmp slt i32 %r106, 0
  br i1 %r107, label %bb5, label %bb8

bb8:
  %r108 = load i32, i32* %r101
  %r109 = icmp sgt i32 %r108, 9
  br i1 %r109, label %bb5, label %bb6

bb5:
  br label %bb2

bb28:
  br label %bb7

bb6:
  br label %bb4

bb29:
  br label %bb7

bb7:
  br label %bb2

bb4:
  %r110 = load i32, i32* %r101
  store i32 %r110, i32* %r100
  br label %bb9

bb9:
  %r111 = icmp sgt i32 1, 0
  br i1 %r111, label %bb10, label %bb11

bb10:
  %r112 = call i32 @getch()
  %r113 = load i32, i32* @ascii_0
  %r114 = sub i32 %r112, %r113
  store i32 %r114, i32* %r101
  %r115 = load i32, i32* %r101
  %r116 = icmp sge i32 %r115, 0
  br i1 %r116, label %bb15, label %bb13

bb15:
  %r117 = load i32, i32* %r101
  %r118 = icmp sle i32 %r117, 9
  br i1 %r118, label %bb12, label %bb13

bb12:
  %r119 = load i32, i32* %r100
  %r120 = mul i32 %r119, 10
  %r121 = load i32, i32* %r101
  %r122 = add i32 %r120, %r121
  store i32 %r122, i32* %r100
  br label %bb14

bb13:
  br label %bb11

bb30:
  br label %bb14

bb14:
  br label %bb9

bb11:
  %r123 = load i32, i32* %r100
  ret i32 %r123
}

define i32 @mod( i32 %r124, i32 %r126 ) {
bb31:
  %r125 = alloca i32
  store i32 %r124, i32* %r125
  %r127 = alloca i32
  store i32 %r126, i32* %r127
  br label %bb16

bb16:
  %r128 = load i32, i32* %r125
  %r129 = load i32, i32* %r125
  %r130 = load i32, i32* %r127
  %r131 = sdiv i32 %r129, %r130
  %r132 = load i32, i32* %r127
  %r133 = mul i32 %r131, %r132
  %r134 = sub i32 %r128, %r133
  ret i32 %r134
}

define void @my_putint( i32 %r135 ) {
bb32:
  %r138 = alloca i32
  %r137 = alloca [ 16 x i32 ]
  %r136 = alloca i32
  store i32 %r135, i32* %r136
  br label %bb17

bb17:
  store i32 0, i32* %r138
  br label %bb18

bb18:
  %r139 = load i32, i32* %r136
  %r140 = icmp sgt i32 %r139, 0
  br i1 %r140, label %bb19, label %bb20

bb19:
  %r141 = load i32, i32* %r136
  %r142 = call i32 @mod(i32 %r141, i32 10)
  %r143 = load i32, i32* @ascii_0
  %r144 = add i32 %r142, %r143
  %r145 = load i32, i32* %r138
  %r146 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r145
  store i32 %r144, i32* %r146
  %r147 = load i32, i32* %r136
  %r148 = sdiv i32 %r147, 10
  store i32 %r148, i32* %r136
  %r149 = load i32, i32* %r138
  %r150 = add i32 %r149, 1
  store i32 %r150, i32* %r138
  br label %bb18

bb20:
  br label %bb21

bb21:
  %r151 = load i32, i32* %r138
  %r152 = icmp sgt i32 %r151, 0
  br i1 %r152, label %bb22, label %bb23

bb22:
  %r153 = load i32, i32* %r138
  %r154 = sub i32 %r153, 1
  store i32 %r154, i32* %r138
  %r155 = load i32, i32* %r138
  %r156 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r155
  %r157 = load i32, i32* %r156
  call void @putch(i32 %r157)
  br label %bb21

bb23:
  ret void
}

define i32 @main( ) {
bb24:
  %r162 = alloca i32
  %r158 = alloca i32
  %r159 = call i32 @my_getint()
  store i32 %r159, i32* %r158
  br label %bb25

bb25:
  %r160 = load i32, i32* %r158
  %r161 = icmp sgt i32 %r160, 0
  br i1 %r161, label %bb26, label %bb27

bb26:
  %r163 = call i32 @my_getint()
  store i32 %r163, i32* %r162
  %r164 = load i32, i32* %r162
  call void @my_putint(i32 %r164)
  call void @putch(i32 10)
  %r165 = load i32, i32* %r158
  %r166 = sub i32 %r165, 1
  store i32 %r166, i32* %r158
  br label %bb25

bb27:
  ret i32 0
}

