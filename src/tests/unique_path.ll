declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @uniquePaths( i32 %r100, i32 %r102 ) {
bb19:
  %r113 = alloca i32
  %r112 = alloca i32
  %r111 = alloca i32
  %r110 = alloca i32
  %r109 = alloca i32
  %r108 = alloca [ 9 x i32 ]
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r103 = alloca i32
  store i32 %r102, i32* %r103
  br label %bb1

bb1:
  %r104 = load i32, i32* %r101
  %r105 = icmp eq i32 %r104, 1
  br i1 %r105, label %bb2, label %bb5

bb5:
  %r106 = load i32, i32* %r103
  %r107 = icmp eq i32 %r106, 1
  br i1 %r107, label %bb2, label %bb3

bb2:
  ret i32 1
bb20:
  br label %bb4

bb3:
  br label %bb4

bb4:
  store i32 0, i32* %r109
  br label %bb6

bb6:
  %r114 = load i32, i32* %r109
  %r115 = load i32, i32* %r101
  %r116 = icmp slt i32 %r114, %r115
  br i1 %r116, label %bb7, label %bb8

bb7:
  %r117 = load i32, i32* %r109
  %r118 = mul i32 %r117, 3
  %r119 = load i32, i32* %r103
  %r120 = add i32 %r118, %r119
  %r121 = sub i32 %r120, 1
  store i32 %r121, i32* %r111
  %r122 = load i32, i32* %r111
  %r123 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r122
  store i32 1, i32* %r123
  %r124 = load i32, i32* %r109
  %r125 = add i32 %r124, 1
  store i32 %r125, i32* %r109
  br label %bb6

bb8:
  store i32 0, i32* %r109
  br label %bb9

bb9:
  %r126 = load i32, i32* %r109
  %r127 = load i32, i32* %r103
  %r128 = icmp slt i32 %r126, %r127
  br i1 %r128, label %bb10, label %bb11

bb10:
  %r129 = load i32, i32* %r101
  %r130 = sub i32 %r129, 1
  %r131 = mul i32 %r130, 3
  %r132 = load i32, i32* %r109
  %r133 = add i32 %r131, %r132
  store i32 %r133, i32* %r111
  %r134 = load i32, i32* %r111
  %r135 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r134
  store i32 1, i32* %r135
  %r136 = load i32, i32* %r109
  %r137 = add i32 %r136, 1
  store i32 %r137, i32* %r109
  br label %bb9

bb11:
  %r138 = load i32, i32* %r101
  %r139 = sub i32 %r138, 2
  store i32 %r139, i32* %r109
  br label %bb12

bb12:
  %r140 = load i32, i32* %r109
  %r141 = sub i32 0, 1
  %r142 = icmp sgt i32 %r140, %r141
  br i1 %r142, label %bb13, label %bb14

bb13:
  %r143 = load i32, i32* %r103
  %r144 = sub i32 %r143, 2
  store i32 %r144, i32* %r110
  br label %bb15

bb15:
  %r145 = load i32, i32* %r110
  %r146 = sub i32 0, 1
  %r147 = icmp sgt i32 %r145, %r146
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r148 = load i32, i32* %r109
  %r149 = mul i32 %r148, 3
  %r150 = load i32, i32* %r110
  %r151 = add i32 %r149, %r150
  store i32 %r151, i32* %r111
  %r152 = load i32, i32* %r109
  %r153 = add i32 %r152, 1
  %r154 = mul i32 %r153, 3
  %r155 = load i32, i32* %r110
  %r156 = add i32 %r154, %r155
  store i32 %r156, i32* %r112
  %r157 = load i32, i32* %r109
  %r158 = mul i32 %r157, 3
  %r159 = load i32, i32* %r110
  %r160 = add i32 %r158, %r159
  %r161 = add i32 %r160, 1
  store i32 %r161, i32* %r113
  %r162 = load i32, i32* %r112
  %r163 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r162
  %r164 = load i32, i32* %r163
  %r165 = load i32, i32* %r113
  %r166 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r165
  %r167 = load i32, i32* %r166
  %r168 = add i32 %r164, %r167
  %r169 = load i32, i32* %r111
  %r170 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r169
  store i32 %r168, i32* %r170
  %r171 = load i32, i32* %r110
  %r172 = sub i32 %r171, 1
  store i32 %r172, i32* %r110
  br label %bb15

bb17:
  %r173 = load i32, i32* %r109
  %r174 = sub i32 %r173, 1
  store i32 %r174, i32* %r109
  br label %bb12

bb14:
  %r175 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 0
  %r176 = load i32, i32* %r175
  ret i32 %r176
}

define i32 @main( ) {
bb18:
  %r177 = alloca i32
  %r178 = alloca i32
  store i32 3, i32* %r178
  %r179 = load i32, i32* %r178
  %r180 = load i32, i32* %r178
  %r181 = call i32 @uniquePaths(i32 %r179, i32 %r180)
  store i32 %r181, i32* %r177
  %r182 = load i32, i32* %r177
  ret i32 %r182
}

