declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @mod( i32 %r100, i32 %r102 ) {
bb14:
  %r146 = add i32 0, 0
  %r148 = add i32 %r100, 0
  %r147 = add i32 0, 0
  %r149 = add i32 %r102, 0
  br label %bb1

bb1:
  %r107 = sdiv i32 %r148, %r149
  %r109 = mul i32 %r107, %r149
  %r110 = sub i32 %r148, %r109
  ret i32 %r110
}

define i32 @palindrome( i32 %r111 ) {
bb15:
  %r150 = add i32 0, 0
  %r151 = add i32 0, 0
  %r113 = alloca [ 4 x i32 ]
  %r152 = add i32 0, 0
  %r153 = add i32 %r111, 0
  br label %bb2

bb2:
  %r154 = add i32 0, 0
  br label %bb3

bb3:
  %r155 = phi i32 [ %r153, %bb2 ], [ %r160, %bb4 ]
  %r156 = phi i32 [ %r154, %bb2 ], [ %r161, %bb4 ]
  %r117 = icmp slt i32 %r156, 4
  br i1 %r117, label %bb4, label %bb5

bb4:
  %r119 = call i32 @mod(i32 %r155, i32 10)
  %r121 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 %r156
  store i32 %r119, i32* %r121
  %r160 = sdiv i32 %r155, 10
  %r161 = add i32 %r156, 1
  br label %bb3

bb5:
  %r126 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 0
  %r127 = load i32, i32* %r126
  %r128 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 3
  %r129 = load i32, i32* %r128
  %r130 = icmp eq i32 %r127, %r129
  br i1 %r130, label %bb9, label %bb7

bb9:
  %r131 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 1
  %r132 = load i32, i32* %r131
  %r133 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 2
  %r134 = load i32, i32* %r133
  %r135 = icmp eq i32 %r132, %r134
  br i1 %r135, label %bb6, label %bb7

bb6:
  %r159 = add i32 1, 0
  br label %bb8

bb7:
  %r158 = add i32 0, 0
  br label %bb8

bb8:
  %r157 = phi i32 [ %r159, %bb6 ], [ %r158, %bb7 ]
  ret i32 %r157
}

define i32 @main( ) {
bb10:
  call void @_sysy_starttime(i32 30)
  %r162 = add i32 0, 0
  %r164 = add i32 1221, 0
  %r163 = add i32 0, 0
  %r165 = call i32 @palindrome(i32 %r164)
  %r142 = icmp eq i32 %r165, 1
  br i1 %r142, label %bb11, label %bb12

bb11:
  call void @putint(i32 %r164)
  br label %bb13

bb12:
  %r167 = add i32 0, 0
  call void @putint(i32 %r167)
  br label %bb13

bb13:
  %r166 = add i32 10, 0
  call void @putch(i32 %r166)
  call void @_sysy_stoptime(i32 47)
  ret i32 0
}

