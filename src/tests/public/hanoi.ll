declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define void @move( i32 %r100, i32 %r102 ) {
bb10:
  %r139 = add i32 0, 0
  %r140 = add i32 %r100, 0
  %r141 = add i32 0, 0
  %r142 = add i32 %r102, 0
  br label %bb1

bb1:
  call void @putint(i32 %r140)
  call void @putch(i32 32)
  call void @putint(i32 %r142)
  call void @putch(i32 44)
  call void @putch(i32 32)
  ret void
}

define void @hanoi( i32 %r106, i32 %r108, i32 %r110, i32 %r112 ) {
bb11:
  %r147 = add i32 0, 0
  %r148 = add i32 %r106, 0
  %r149 = add i32 0, 0
  %r150 = add i32 %r108, 0
  %r151 = add i32 0, 0
  %r152 = add i32 %r110, 0
  %r153 = add i32 0, 0
  %r154 = add i32 %r112, 0
  br label %bb2

bb2:
  %r115 = icmp eq i32 %r148, 1
  br i1 %r115, label %bb3, label %bb4

bb3:
  call void @move(i32 %r150, i32 %r154)
  br label %bb5

bb4:
  %r155 = sub i32 %r148, 1
  call void @hanoi(i32 %r155, i32 %r150, i32 %r154, i32 %r152)
  call void @move(i32 %r150, i32 %r154)
  %r156 = sub i32 %r148, 1
  call void @hanoi(i32 %r156, i32 %r152, i32 %r150, i32 %r154)
  br label %bb5

bb5:
  ret void
}

define i32 @main( ) {
bb6:
  call void @_sysy_starttime(i32 21)
  %r158 = add i32 0, 0
  %r159 = call i32 @getint()
  br label %bb7

bb7:
  %r160 = phi i32 [ %r159, %bb6 ], [ %r162, %bb8 ]
  %r133 = icmp sgt i32 %r160, 0
  br i1 %r133, label %bb8, label %bb9

bb8:
  %r161 = call i32 @getint()
  call void @hanoi(i32 %r161, i32 1, i32 2, i32 3)
  call void @putch(i32 10)
  %r162 = sub i32 %r160, 1
  br label %bb7

bb9:
  call void @_sysy_stoptime(i32 28)
  ret i32 0
}

