declare i32 @getch( )
declare i32 @getint( )
declare void @putint( i32 )
declare void @putch( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
%Node = type { i32, i32 }
%Bar = type { %Node, [10 x %Node ], [10 x i32 ] }
define void @foo( %Bar* %r100 ) {
bb1:
  %r101 = getelementptr %Bar, %Bar* %r100, i32 1
  %r102 = getelementptr %Bar, %Bar* %r101, i32 0, i32 2
  %r103 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 3
  store i32 5, i32* %r103
  ret void
}

define i32 @main( ) {
bb2:
  call void @_sysy_starttime(i32 18)
  %r104 = alloca [ 10 x %Bar ]
  %r105 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r106 = getelementptr %Bar, %Bar* %r105, i32 0, i32 0
  %r107 = getelementptr %Node, %Node* %r106, i32 0, i32 0
  store i32 1, i32* %r107
  %r108 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r109 = getelementptr %Bar, %Bar* %r108, i32 0, i32 0
  %r110 = getelementptr %Node, %Node* %r109, i32 0, i32 1
  store i32 2, i32* %r110
  %r111 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r112 = getelementptr %Bar, %Bar* %r111, i32 0, i32 1
  %r113 = getelementptr [10 x %Node ], [10 x %Node ]* %r112, i32 0, i32 2
  %r114 = getelementptr %Node, %Node* %r113, i32 0, i32 0
  store i32 3, i32* %r114
  %r115 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r116 = getelementptr %Bar, %Bar* %r115, i32 0, i32 1
  %r117 = getelementptr [10 x %Node ], [10 x %Node ]* %r116, i32 0, i32 2
  %r118 = getelementptr %Node, %Node* %r117, i32 0, i32 1
  store i32 4, i32* %r118
  call void @foo(%Bar* %r104)
  %r119 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r120 = getelementptr %Bar, %Bar* %r119, i32 0, i32 0
  %r121 = getelementptr %Node, %Node* %r120, i32 0, i32 0
  %r122 = load i32, i32* %r121
  call void @putint(i32 %r122)
  %r123 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r124 = getelementptr %Bar, %Bar* %r123, i32 0, i32 0
  %r125 = getelementptr %Node, %Node* %r124, i32 0, i32 1
  %r126 = load i32, i32* %r125
  call void @putint(i32 %r126)
  %r127 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r128 = getelementptr %Bar, %Bar* %r127, i32 0, i32 1
  %r129 = getelementptr [10 x %Node ], [10 x %Node ]* %r128, i32 0, i32 2
  %r130 = getelementptr %Node, %Node* %r129, i32 0, i32 0
  %r131 = load i32, i32* %r130
  call void @putint(i32 %r131)
  %r132 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 0
  %r133 = getelementptr %Bar, %Bar* %r132, i32 0, i32 1
  %r134 = getelementptr [10 x %Node ], [10 x %Node ]* %r133, i32 0, i32 2
  %r135 = getelementptr %Node, %Node* %r134, i32 0, i32 1
  %r136 = load i32, i32* %r135
  call void @putint(i32 %r136)
  %r137 = getelementptr [10 x %Bar ], [10 x %Bar ]* %r104, i32 0, i32 1
  %r138 = getelementptr %Bar, %Bar* %r137, i32 0, i32 2
  %r139 = getelementptr [10 x i32 ], [10 x i32 ]* %r138, i32 0, i32 3
  %r140 = load i32, i32* %r139
  call void @putint(i32 %r140)
  call void @_sysy_stoptime(i32 30)
  ret i32 0
}

