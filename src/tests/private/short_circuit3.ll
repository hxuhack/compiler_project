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
  %r177 = add i32 0, 0
  %r178 = add i32 %r100, 0
  br label %bb1

bb1:
  store i32 %r178, i32* @a
  %r179 = load i32, i32* @a
  ret i32 %r179
}

define i32 @set_b( i32 %r104 ) {
bb48:
  %r181 = add i32 0, 0
  %r182 = add i32 %r104, 0
  br label %bb2

bb2:
  store i32 %r182, i32* @b
  %r183 = load i32, i32* @b
  ret i32 %r183
}

define i32 @set_d( i32 %r108 ) {
bb49:
  %r185 = add i32 0, 0
  %r186 = add i32 %r108, 0
  br label %bb3

bb3:
  store i32 %r186, i32* @d
  %r187 = load i32, i32* @d
  ret i32 %r187
}

define i32 @main( ) {
bb4:
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  %r196 = add i32 0, 0
  %r197 = add i32 0, 0
  %r198 = add i32 0, 0
  %r199 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r200 = call i32 @set_a(i32 0)
  %r113 = icmp ne i32 %r200, 0
  br i1 %r113, label %bb8, label %bb6

bb8:
  %r217 = call i32 @set_b(i32 1)
  %r115 = icmp ne i32 %r217, 0
  br i1 %r115, label %bb5, label %bb6

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %r201 = load i32, i32* @a
  call void @putint(i32 %r201)
  call void @putch(i32 32)
  %r202 = load i32, i32* @b
  call void @putint(i32 %r202)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r203 = call i32 @set_a(i32 0)
  %r119 = icmp ne i32 %r203, 0
  br i1 %r119, label %bb12, label %bb10

bb12:
  %r216 = call i32 @set_b(i32 1)
  %r121 = icmp ne i32 %r216, 0
  br i1 %r121, label %bb9, label %bb10

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %r204 = load i32, i32* @a
  call void @putint(i32 %r204)
  call void @putch(i32 32)
  %r205 = load i32, i32* @b
  call void @putint(i32 %r205)
  call void @putch(i32 10)
  %r206 = add i32 1, 0
  store i32 2, i32* @d
  %r126 = icmp sge i32 %r206, 1
  br i1 %r126, label %bb16, label %bb14

bb16:
  %r215 = call i32 @set_d(i32 3)
  %r128 = icmp ne i32 %r215, 0
  br i1 %r128, label %bb13, label %bb14

bb13:
  br label %bb15

bb14:
  br label %bb15

bb15:
  %r207 = load i32, i32* @d
  call void @putint(i32 %r207)
  call void @putch(i32 32)
  %r131 = icmp sle i32 %r206, 1
  br i1 %r131, label %bb17, label %bb20

bb20:
  %r214 = call i32 @set_d(i32 4)
  %r133 = icmp ne i32 %r214, 0
  br i1 %r133, label %bb17, label %bb18

bb17:
  br label %bb19

bb18:
  br label %bb19

bb19:
  %r208 = load i32, i32* @d
  call void @putint(i32 %r208)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r209 = add i32 0, 0
  %r210 = add i32 1, 0
  %r211 = add i32 2, 0
  %r212 = add i32 3, 0
  %r213 = add i32 4, 0
  br label %bb21

bb21:
  %r141 = icmp ne i32 %r209, 0
  br i1 %r141, label %bb24, label %bb23

bb24:
  %r143 = icmp ne i32 %r210, 0
  br i1 %r143, label %bb22, label %bb23

bb22:
  call void @putch(i32 32)
  br label %bb21

bb23:
  %r145 = icmp ne i32 %r209, 0
  br i1 %r145, label %bb25, label %bb28

bb28:
  %r147 = icmp ne i32 %r210, 0
  br i1 %r147, label %bb25, label %bb26

bb25:
  call void @putch(i32 67)
  br label %bb27

bb26:
  br label %bb27

bb27:
  %r150 = icmp sge i32 %r209, %r210
  br i1 %r150, label %bb29, label %bb32

bb32:
  %r153 = icmp sle i32 %r210, %r209
  br i1 %r153, label %bb29, label %bb30

bb29:
  call void @putch(i32 72)
  br label %bb31

bb30:
  br label %bb31

bb31:
  %r156 = icmp sge i32 %r211, %r210
  br i1 %r156, label %bb36, label %bb34

bb36:
  %r159 = icmp ne i32 %r213, %r212
  br i1 %r159, label %bb33, label %bb34

bb33:
  call void @putch(i32 73)
  br label %bb35

bb34:
  br label %bb35

bb35:
  %r161 = icmp ne i32 %r210, 0
  br i1 %r161, label %bb40, label %bb41

bb41:
  %r164 = icmp slt i32 %r212, %r212
  br i1 %r164, label %bb37, label %bb40

bb40:
  %r167 = icmp sge i32 %r213, %r213
  br i1 %r167, label %bb37, label %bb38

bb37:
  call void @putch(i32 74)
  br label %bb39

bb38:
  br label %bb39

bb39:
  %r169 = icmp ne i32 %r210, 0
  br i1 %r169, label %bb45, label %bb42

bb45:
  %r172 = icmp slt i32 %r212, %r212
  br i1 %r172, label %bb46, label %bb43

bb46:
  %r175 = icmp sge i32 %r213, %r213
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

