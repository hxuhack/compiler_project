declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@a = global i32 0
@b = global i32 0
@d = global i32 0
define i32 @set_a( i32 %r100 ) {
bb47:
  %r176 = add i32 0, 0
  %r177 = add i32 %r100, 0
  br label %bb1

bb1:
  store i32 %r177, i32* @a
  %r103 = load i32, i32* @a
  ret i32 %r103
}

define i32 @set_b( i32 %r104 ) {
bb48:
  %r178 = add i32 0, 0
  %r179 = add i32 %r104, 0
  br label %bb2

bb2:
  store i32 %r179, i32* @b
  %r107 = load i32, i32* @b
  ret i32 %r107
}

define i32 @set_d( i32 %r108 ) {
bb49:
  %r180 = add i32 0, 0
  %r181 = add i32 %r108, 0
  br label %bb3

bb3:
  store i32 %r181, i32* @d
  %r111 = load i32, i32* @d
  ret i32 %r111
}

define i32 @main( ) {
bb4:
  %r182 = add i32 0, 0
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r186 = add i32 0, 0
  %r187 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r112 = call i32 @set_a(i32 0)
  %r113 = icmp ne i32 %r112, 0
  br i1 %r113, label %bb8, label %bb6

bb8:
  %r114 = call i32 @set_b(i32 1)
  %r115 = icmp ne i32 %r114, 0
  br i1 %r115, label %bb5, label %bb6

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %r116 = load i32, i32* @a
  call void @putint(i32 %r116)
  call void @putch(i32 32)
  %r117 = load i32, i32* @b
  call void @putint(i32 %r117)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r118 = call i32 @set_a(i32 0)
  %r119 = icmp ne i32 %r118, 0
  br i1 %r119, label %bb12, label %bb10

bb12:
  %r120 = call i32 @set_b(i32 1)
  %r121 = icmp ne i32 %r120, 0
  br i1 %r121, label %bb9, label %bb10

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %r122 = load i32, i32* @a
  call void @putint(i32 %r122)
  call void @putch(i32 32)
  %r123 = load i32, i32* @b
  call void @putint(i32 %r123)
  call void @putch(i32 10)
  %r188 = add i32 1, 0
  store i32 2, i32* @d
  %r126 = icmp sge i32 %r188, 1
  br i1 %r126, label %bb16, label %bb14

bb16:
  %r127 = call i32 @set_d(i32 3)
  %r128 = icmp ne i32 %r127, 0
  br i1 %r128, label %bb13, label %bb14

bb13:
  br label %bb15

bb14:
  br label %bb15

bb15:
  %r129 = load i32, i32* @d
  call void @putint(i32 %r129)
  call void @putch(i32 32)
  %r131 = icmp sle i32 %r188, 1
  br i1 %r131, label %bb17, label %bb20

bb20:
  %r132 = call i32 @set_d(i32 4)
  %r133 = icmp ne i32 %r132, 0
  br i1 %r133, label %bb17, label %bb18

bb17:
  br label %bb19

bb18:
  br label %bb19

bb19:
  %r134 = load i32, i32* @d
  call void @putint(i32 %r134)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r189 = add i32 0, 0
  %r190 = add i32 1, 0
  %r191 = add i32 2, 0
  %r192 = add i32 3, 0
  %r193 = add i32 4, 0
  br label %bb21

bb21:
  %r141 = icmp ne i32 %r189, 0
  br i1 %r141, label %bb24, label %bb23

bb24:
  %r143 = icmp ne i32 %r190, 0
  br i1 %r143, label %bb22, label %bb23

bb22:
  call void @putch(i32 32)
  br label %bb21

bb23:
  %r145 = icmp ne i32 %r189, 0
  br i1 %r145, label %bb25, label %bb28

bb28:
  %r147 = icmp ne i32 %r190, 0
  br i1 %r147, label %bb25, label %bb26

bb25:
  call void @putch(i32 67)
  br label %bb27

bb26:
  br label %bb27

bb27:
  %r150 = icmp sge i32 %r189, %r190
  br i1 %r150, label %bb29, label %bb32

bb32:
  %r153 = icmp sle i32 %r190, %r189
  br i1 %r153, label %bb29, label %bb30

bb29:
  call void @putch(i32 72)
  br label %bb31

bb30:
  br label %bb31

bb31:
  %r156 = icmp sge i32 %r191, %r190
  br i1 %r156, label %bb36, label %bb34

bb36:
  %r159 = icmp ne i32 %r193, %r192
  br i1 %r159, label %bb33, label %bb34

bb33:
  call void @putch(i32 73)
  br label %bb35

bb34:
  br label %bb35

bb35:
  %r161 = icmp ne i32 %r190, 0
  br i1 %r161, label %bb40, label %bb41

bb41:
  %r164 = icmp slt i32 %r192, %r192
  br i1 %r164, label %bb37, label %bb40

bb40:
  %r167 = icmp sge i32 %r193, %r193
  br i1 %r167, label %bb37, label %bb38

bb37:
  call void @putch(i32 74)
  br label %bb39

bb38:
  br label %bb39

bb39:
  %r169 = icmp ne i32 %r190, 0
  br i1 %r169, label %bb45, label %bb42

bb45:
  %r172 = icmp slt i32 %r192, %r192
  br i1 %r172, label %bb46, label %bb43

bb46:
  %r175 = icmp sge i32 %r193, %r193
  br i1 %r175, label %bb42, label %bb43

bb42:
  call void @putch(i32 75)
  br label %bb44

bb43:
  br label %bb44

bb44:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

