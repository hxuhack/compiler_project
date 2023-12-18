
define i32 @main( ) {
bb1:
  %r100 = alloca i32
  store i32 10073, i32* %r100
  %r101 = alloca i32
  store i32 2102, i32* %r101
  %r102 = alloca i32
  store i32 200, i32* %r102
  %r103 = alloca i32
  store i32 1324, i32* %r103
  %r104 = load i32, i32* %r101
  %r105 = load i32, i32* %r100
  %r106 = add i32 %r104, %r105
  store i32 %r106, i32* %r101
  %r107 = sub i32 1, 7
  store i32 %r107, i32* %r100
  %r108 = load i32, i32* %r100
  %r109 = sdiv i32 900, %r108
  store i32 %r109, i32* %r102
  %r110 = load i32, i32* %r102
  %r111 = mul i32 %r110, 600
  store i32 %r111, i32* %r103
  ret i32 0
}

