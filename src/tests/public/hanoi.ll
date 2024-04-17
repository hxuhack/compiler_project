declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define void @move( i32 %r100, i32 %r102 ) {
bb10:
  %r137 = add i32 0, 0
  %r139 = add i32 %r100, 0
  %r138 = add i32 0, 0
  %r140 = add i32 %r102, 0
  br label %bb1

bb1:
  call void @putint(i32 %r139)
  call void @putch(i32 32)
  call void @putint(i32 %r140)
  call void @putch(i32 44)
  call void @putch(i32 32)
  ret void
}

define void @hanoi( i32 %r106, i32 %r108, i32 %r110, i32 %r112 ) {
bb11:
  %r141 = add i32 0, 0
  %r145 = add i32 %r106, 0
  %r142 = add i32 0, 0
  %r146 = add i32 %r108, 0
  %r143 = add i32 0, 0
  %r147 = add i32 %r110, 0
  %r144 = add i32 0, 0
  %r148 = add i32 %r112, 0
  br label %bb2

bb2:
  %r115 = icmp eq i32 %r145, 1
  br i1 %r115, label %bb3, label %bb4

bb3:
  call void @move(i32 %r146, i32 %r148)
  br label %bb5

bb4:
  %r119 = sub i32 %r145, 1
  call void @hanoi(i32 %r119, i32 %r146, i32 %r148, i32 %r147)
  call void @move(i32 %r146, i32 %r148)
  %r126 = sub i32 %r145, 1
  call void @hanoi(i32 %r126, i32 %r147, i32 %r146, i32 %r148)
  br label %bb5

bb5:
  ret void
}

define i32 @main( ) {
bb6:
  call void @_sysy_starttime(i32 21)
  %r149 = add i32 0, 0
  %r150 = call i32 @getint()
  br label %bb7

bb7:
  %r151 = phi i32 [ %r150, %bb6 ], [ %r152, %bb8 ]
  %r133 = icmp sgt i32 %r151, 0
  br i1 %r133, label %bb8, label %bb9

bb8:
  %r134 = call i32 @getint()
  call void @hanoi(i32 %r134, i32 1, i32 2, i32 3)
  call void @putch(i32 10)
  %r152 = sub i32 %r151, 1
  br label %bb7

bb9:
  call void @_sysy_stoptime(i32 28)
  ret i32 0
}

