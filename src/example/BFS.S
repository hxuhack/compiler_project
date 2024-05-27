.section .data
.global    n
.global    m
.global    to
.global    next
.global    head
.global    cnt
.global    que
.global    h
.global    tail
.global    inq
n:
        .quad   0
m:
        .quad   0
to:
        .zero   40040
next:
        .zero   40040
head:
        .zero   8040
cnt:
        .quad   0
que:
        .zero   8040
h:
        .quad   0
tail:
        .quad   0
inq:
        .zero   8040
.section .text
.global getch
.global getint
.global putch
.global putint
.global putarray
.global _sysy_starttime
.global _sysy_stoptime
.global quickread
.global addedge
.global init
.global inqueue
.global popqueue
.global same
.global main
        //%r328->x11
        //%r327->x11
        //%r268->x11
        //%r325->x11
        //%r266->x12
        //%r267->x9
        //%r326->x10
        //%r324->x11
        //%r265->x9
        //%r323->x11
        //%r264->x10
        //%r322->x10
        //%r263->x11
        //%r259->x10
        //%r318->x9
        //%r319->x9
        //%r260->x10
        //%r116->x9
        //%r261->x12
        //%r320->x9
        //%r123->x9
        //%r254->x9
        //%r255->x9
        //%r256->x9
        //%r257->x11
        //%r258->x9
        //%r262->x10
        //%r321->x10
        //%r118->x9
        //%r329->x11
        //%r330->x11
        //%r331->x10
quickread:

        //bb1:

bb1:

        //  %r254 = add i32 0, 0

        mov     x16, #0
        sub     sp, sp, x16
        mov     x9, #0
        //  %r257 = call i32 @getch()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     getch
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x11, x0
        //  %r255 = add i32 0, 0

        mov     x9, #0
        //  %r258 = add i32 0, 0

        mov     x9, #0
        mov     x9, x9
        //  %r256 = add i32 0, 0

        mov     x10, #0
        //  %r259 = add i32 0, 0

        mov     x10, #0
        mov     x10, x10
        //  br label %bb2


        //bb2:  %r260 = phi i32 [ %r259, %bb1 ], [ %r262, %bb8 ]

        mov     x10, x10
        //bb2:  %r261 = phi i32 [ %r257, %bb1 ], [ %r263, %bb8 ]

        mov     x12, x11
        b     bb2
        //bb2:

bb2:

        //  %r260 = phi i32 [ %r259, %bb1 ], [ %r262, %bb8 ]

        //  %r261 = phi i32 [ %r257, %bb1 ], [ %r263, %bb8 ]

        //  %r105 = icmp slt i32 %r261, 48

        mov     x11, #48
        cmp     x12, x11
        //  br i1 %r105, label %bb3, label %bb5


        b.lt     bb3
        b     bb5
        //bb5:

bb5:

        //  %r107 = icmp sgt i32 %r261, 57

        mov     x11, #57
        cmp     x12, x11
        //  br i1 %r107, label %bb3, label %bb4


        b.gt     bb3
        b     bb4
        //bb3:

bb3:

        //  %r109 = icmp eq i32 %r261, 45

        mov     x11, #45
        cmp     x12, x11
        //  br i1 %r109, label %bb6, label %bb7


        b.eq     bb6
        b     bb7
        //bb6:

bb6:

        //  %r264 = add i32 1, 0

        mov     x10, #1
        mov     x10, x10
        //  br label %bb8


        //bb8:  %r262 = phi i32 [ %r264, %bb6 ], [ %r260, %bb7 ]

        mov     x10, x10
        b     bb8
        //bb7:

bb7:

        //  br label %bb8


        //bb8:  %r262 = phi i32 [ %r264, %bb6 ], [ %r260, %bb7 ]

        mov     x10, x10
        b     bb8
        //bb8:

bb8:

        //  %r262 = phi i32 [ %r264, %bb6 ], [ %r260, %bb7 ]

        //  %r263 = call i32 @getch()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     getch
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x11, x0
        //  br label %bb2


        //bb2:  %r260 = phi i32 [ %r259, %bb1 ], [ %r262, %bb8 ]

        mov     x10, x10
        //bb2:  %r261 = phi i32 [ %r257, %bb1 ], [ %r263, %bb8 ]

        mov     x12, x11
        b     bb2
        //bb4:

bb4:

        //  br label %bb9


        //bb9:  %r265 = phi i32 [ %r258, %bb4 ], [ %r267, %bb10 ]

        mov     x9, x9
        //bb9:  %r266 = phi i32 [ %r261, %bb4 ], [ %r268, %bb10 ]

        mov     x12, x12
        b     bb9
        //bb9:

bb9:

        //  %r265 = phi i32 [ %r258, %bb4 ], [ %r267, %bb10 ]

        //  %r266 = phi i32 [ %r261, %bb4 ], [ %r268, %bb10 ]

        //  %r112 = icmp sge i32 %r266, 48

        mov     x11, #48
        cmp     x12, x11
        //  br i1 %r112, label %bb12, label %bb11


        b.ge     bb12
        b     bb11
        //bb12:

bb12:

        //  %r114 = icmp sle i32 %r266, 57

        mov     x11, #57
        cmp     x12, x11
        //  br i1 %r114, label %bb10, label %bb11


        b.le     bb10
        b     bb11
        //bb10:

bb10:

        //  %r116 = mul i32 %r265, 10

        mov     x11, #10
        mul     x9, x9, x11
        //  %r118 = add i32 %r116, %r266

        add     x9, x9, x12
        //  %r267 = sub i32 %r118, 48

        sub     x9, x9, #48
        //  %r268 = call i32 @getch()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     getch
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x11, x0
        //  br label %bb9


        //bb9:  %r265 = phi i32 [ %r258, %bb4 ], [ %r267, %bb10 ]

        mov     x9, x9
        //bb9:  %r266 = phi i32 [ %r261, %bb4 ], [ %r268, %bb10 ]

        mov     x12, x11
        b     bb9
        //bb11:

bb11:

        //  %r122 = icmp ne i32 %r260, 0

        mov     x11, #0
        cmp     x10, x11
        //  br i1 %r122, label %bb13, label %bb14


        b.ne     bb13
        b     bb14
        //bb13:

bb13:

        //  %r123 = sub i32 0, %r265

        mov     x10, #0
        sub     x9, x10, x9
        //  ret i32 %r123

        mov     x0, x9
        mov     sp, x29
        ret
        //bb14:

bb14:

        //  ret i32 %r265

        mov     x0, x9
        mov     sp, x29
        ret
        //%r363->x10
        //%r361->x11
        //%r360->x12
        //%r359->x11
        //%r358->x11
        //%r357->x10
        //%r356->x11
        //%r355->x10
        //%r354->x11
        //%r353->x12
        //%r352->x11
        //%r351->x11
        //%r350->x11
        //%r349->x11
        //%r348->x11
        //%r347->x12
        //%r346->x11
        //%r345->x11
        //%r344->x12
        //%r343->x13
        //%r342->x12
        //%r341->x12
        //%r340->x11
        //%r339->x12
        //%r338->x11
        //%r337->x11
        //%r336->x12
        //%r335->x11
        //%r142->x12
        //%r269->x9
        //%r140->x11
        //%r138->x13
        //%r137->x12
        //%r136->x13
        //%r135->x11
        //%r134->x11
        //%r132->x11
        //%r144->x12
        //%r271->x10
        //%r131->x12
        //%r334->x11
        //%r141->x11
        //%r364->x10
        //%r128->x11
        //%r362->x10
        //%r126->x10
        //%r145->x11
        //%r272->x9
        //%r147->x10
        //%r148->x10
        //%r149->x12
        //%r150->x11
        //%r153->x9
        //%r151->x11
        //%r270->x9
        //%r154->x9
        //%r155->x10
        //%r332->x9
        //%r333->x9
        //%r365->x9
        //%r366->x9
        //%r367->x9
addedge:

        //bb52:

bb52:

        //  %r269 = add i32 0, 0

        mov     x16, #0
        sub     sp, sp, x16
        mov     x10, x0
        mov     x11, x1
        mov     x9, #0
        //  %r271 = add i32 %r126, 0

        mov     x10, x10
        //  %r270 = add i32 0, 0

        mov     x9, #0
        //  %r272 = add i32 %r128, 0

        mov     x9, x11
        //  %r131 = load i32, i32* @cnt

        adrp     x11, cnt
        add     x11, x11, #:lo12:cnt
        ldr     x12, [x11]
        //  %r132 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r131

        mov     x11, #8
        mul     x12, x12, x11
        adrp     x11, to
        add     x11, x11, #:lo12:to
        add     x11, x11, x12
        //  store i32 %r272, i32* %r132

        str     x9, [x11]
        //  %r134 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r271

        mov     x11, #8
        mul     x12, x10, x11
        adrp     x11, head
        add     x11, x11, #:lo12:head
        add     x11, x11, x12
        //  %r135 = load i32, i32* %r134

        ldr     x11, [x11]
        //  %r136 = load i32, i32* @cnt

        adrp     x12, cnt
        add     x12, x12, #:lo12:cnt
        ldr     x13, [x12]
        //  %r137 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r136

        mov     x12, #8
        mul     x13, x13, x12
        adrp     x12, next
        add     x12, x12, #:lo12:next
        add     x12, x12, x13
        //  store i32 %r135, i32* %r137

        str     x11, [x12]
        //  %r138 = load i32, i32* @cnt

        adrp     x11, cnt
        add     x11, x11, #:lo12:cnt
        ldr     x13, [x11]
        //  %r140 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r271

        mov     x11, #8
        mul     x12, x10, x11
        adrp     x11, head
        add     x11, x11, #:lo12:head
        add     x11, x11, x12
        //  store i32 %r138, i32* %r140

        str     x13, [x11]
        //  %r141 = load i32, i32* @cnt

        adrp     x11, cnt
        add     x11, x11, #:lo12:cnt
        ldr     x11, [x11]
        //  %r142 = add i32 %r141, 1

        add     x12, x11, #1
        //  store i32 %r142, i32* @cnt

        adrp     x11, cnt
        add     x11, x11, #:lo12:cnt
        str     x12, [x11]
        //  %r144 = load i32, i32* @cnt

        adrp     x11, cnt
        add     x11, x11, #:lo12:cnt
        ldr     x12, [x11]
        //  %r145 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r144

        mov     x11, #8
        mul     x12, x12, x11
        adrp     x11, to
        add     x11, x11, #:lo12:to
        add     x11, x11, x12
        //  store i32 %r271, i32* %r145

        str     x10, [x11]
        //  %r147 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r272

        mov     x10, #8
        mul     x11, x9, x10
        adrp     x10, head
        add     x10, x10, #:lo12:head
        add     x10, x10, x11
        //  %r148 = load i32, i32* %r147

        ldr     x10, [x10]
        //  %r149 = load i32, i32* @cnt

        adrp     x11, cnt
        add     x11, x11, #:lo12:cnt
        ldr     x12, [x11]
        //  %r150 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r149

        mov     x11, #8
        mul     x12, x12, x11
        adrp     x11, next
        add     x11, x11, #:lo12:next
        add     x11, x11, x12
        //  store i32 %r148, i32* %r150

        str     x10, [x11]
        //  %r151 = load i32, i32* @cnt

        adrp     x10, cnt
        add     x10, x10, #:lo12:cnt
        ldr     x11, [x10]
        //  %r153 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r272

        mov     x10, #8
        mul     x10, x9, x10
        adrp     x9, head
        add     x9, x9, #:lo12:head
        add     x9, x9, x10
        //  store i32 %r151, i32* %r153

        str     x11, [x9]
        //  %r154 = load i32, i32* @cnt

        adrp     x9, cnt
        add     x9, x9, #:lo12:cnt
        ldr     x9, [x9]
        //  %r155 = add i32 %r154, 1

        add     x10, x9, #1
        //  store i32 %r155, i32* @cnt

        adrp     x9, cnt
        add     x9, x9, #:lo12:cnt
        str     x10, [x9]
        //  ret void

        mov     sp, x29
        ret
        //%r159->x12
        //%r276->x9
        //%r161->x10
        //%r369->x9
        //%r273->x9
        //%r274->x9
        //%r275->x9
        //%r368->x9
        //%r370->x10
        //%r371->x10
        //%r372->x10
        //%r373->x11
        //%r374->x10
init:

        //bb17:

bb17:

        //  %r273 = add i32 0, 0

        mov     x16, #0
        sub     sp, sp, x16
        mov     x9, #0
        //  %r274 = add i32 0, 0

        mov     x9, #0
        mov     x9, x9
        //  br label %bb18


        //bb18:  %r275 = phi i32 [ %r274, %bb17 ], [ %r276, %bb19 ]

        mov     x9, x9
        b     bb18
        //bb18:

bb18:

        //  %r275 = phi i32 [ %r274, %bb17 ], [ %r276, %bb19 ]

        //  %r158 = icmp slt i32 %r275, 1005

        mov     x10, #1005
        cmp     x9, x10
        //  br i1 %r158, label %bb19, label %bb20


        b.lt     bb19
        b     bb20
        //bb19:

bb19:

        //  %r159 = sub i32 0, 1

        mov     x10, #0
        sub     x12, x10, #1
        //  %r161 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r275

        mov     x10, #8
        mul     x11, x9, x10
        adrp     x10, head
        add     x10, x10, #:lo12:head
        add     x10, x10, x11
        //  store i32 %r159, i32* %r161

        str     x12, [x10]
        //  %r276 = add i32 %r275, 1

        add     x9, x9, #1
        //  br label %bb18


        //bb18:  %r275 = phi i32 [ %r274, %bb17 ], [ %r276, %bb19 ]

        mov     x9, x9
        b     bb18
        //bb20:

bb20:

        //  ret void

        mov     sp, x29
        ret
        //%r378->x10
        //%r278->x9
        //%r277->x9
        //%r172->x10
        //%r375->x9
        //%r379->x10
        //%r171->x11
        //%r377->x11
        //%r169->x11
        //%r376->x10
        //%r168->x10
        //%r167->x11
        //%r164->x10
        //%r380->x10
        //%r381->x10
        //%r382->x10
        //%r383->x10
        //%r384->x11
        //%r385->x10
inqueue:

        //bb53:

bb53:

        //  %r277 = add i32 0, 0

        mov     x16, #0
        sub     sp, sp, x16
        mov     x10, x0
        mov     x9, #0
        //  %r278 = add i32 %r164, 0

        mov     x9, x10
        //  %r167 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r278

        mov     x10, #8
        mul     x11, x9, x10
        adrp     x10, inq
        add     x10, x10, #:lo12:inq
        add     x11, x10, x11
        //  store i32 1, i32* %r167

        mov     x10, #1
        str     x10, [x11]
        //  %r168 = load i32, i32* @tail

        adrp     x10, tail
        add     x10, x10, #:lo12:tail
        ldr     x10, [x10]
        //  %r169 = add i32 %r168, 1

        add     x11, x10, #1
        //  store i32 %r169, i32* @tail

        adrp     x10, tail
        add     x10, x10, #:lo12:tail
        str     x11, [x10]
        //  %r171 = load i32, i32* @tail

        adrp     x10, tail
        add     x10, x10, #:lo12:tail
        ldr     x11, [x10]
        //  %r172 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r171

        mov     x10, #8
        mul     x11, x11, x10
        adrp     x10, que
        add     x10, x10, #:lo12:que
        add     x10, x10, x11
        //  store i32 %r278, i32* %r172

        str     x9, [x10]
        //  ret void

        mov     sp, x29
        ret
        //%r386->x9
        //%r279->x9
        //%r395->x10
        //%r389->x9
        //%r181->x9
        //%r388->x9
        //%r180->x9
        //%r387->x9
        //%r179->x10
        //%r177->x9
        //%r280->x9
        //%r396->x9
        //%r176->x10
        //%r174->x10
        //%r173->x9
        //%r390->x9
        //%r391->x10
        //%r392->x9
        //%r393->x9
        //%r394->x9
popqueue:

        //bb22:

bb22:

        //  %r173 = load i32, i32* @h

        mov     x16, #0
        sub     sp, sp, x16
        adrp     x9, h
        add     x9, x9, #:lo12:h
        ldr     x9, [x9]
        //  %r174 = add i32 %r173, 1

        add     x10, x9, #1
        //  store i32 %r174, i32* @h

        adrp     x9, h
        add     x9, x9, #:lo12:h
        str     x10, [x9]
        //  %r279 = add i32 0, 0

        mov     x9, #0
        //  %r176 = load i32, i32* @h

        adrp     x9, h
        add     x9, x9, #:lo12:h
        ldr     x10, [x9]
        //  %r177 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r176

        mov     x9, #8
        mul     x10, x10, x9
        adrp     x9, que
        add     x9, x9, #:lo12:que
        add     x9, x9, x10
        //  %r280 = load i32, i32* %r177

        //  %r179 = load i32, i32* @h

        adrp     x9, h
        add     x9, x9, #:lo12:h
        ldr     x10, [x9]
        //  %r180 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r179

        mov     x9, #8
        mul     x10, x10, x9
        adrp     x9, que
        add     x9, x9, #:lo12:que
        add     x9, x9, x10
        //  %r181 = load i32, i32* %r180

        ldr     x9, [x9]
        //  ret i32 %r181

        mov     x0, x9
        mov     sp, x29
        ret
        //%r397->x9
        //%r304->x9
        //%r431->x9
        //%r303->x9
        //%r430->x9
        //%r301->x9
        //%r428->x12
        //%r299->x10
        //%r426->x13
        //%r416->x9
        //%r289->x10
        //%r298->x12
        //%r425->x12
        //%r415->x12
        //%r288->x11
        //%r297->x9
        //%r424->x12
        //%r414->x9
        //%r287->x9
        //%r296->x12
        //%r423->x12
        //%r413->x9
        //%r286->x9
        //%r295->x9
        //%r422->x13
        //%r213->x12
        //%r302->x13
        //%r429->x12
        //%r184->x10
        //%r438->x11
        //%r209->x13
        //%r215->x9
        //%r202->x12
        //%r407->x9
        //%r212->x12
        //%r199->x9
        //%r404->x10
        //%r218->x11
        //%r205->x12
        //%r410->x9
        //%r283->x9
        //%r292->x9
        //%r419->x13
        //%r192->x9
        //%r398->x9
        //%r221->x11
        //%r191->x12
        //%r208->x12
        //%r300->x9
        //%r427->x12
        //%r182->x11
        //%r436->x11
        //%r400->x9
        //%r282->x9
        //%r409->x9
        //%r399->x9
        //%r281->x9
        //%r408->x9
        //%r401->x9
        //%r224->x12
        //%r402->x11
        //%r284->x9
        //%r411->x9
        //%r403->x12
        //%r285->x9
        //%r412->x9
        //%r405->x12
        //%r406->x10
        //%r290->x9
        //%r417->x12
        //%r291->x9
        //%r418->x12
        //%r293->x10
        //%r420->x12
        //%r294->x9
        //%r421->x12
        //%r432->x11
        //%r433->x11
        //%r434->x12
        //%r435->x11
        //%r437->x12
        //%r439->x11
same:

        //bb54:

bb54:

        //  %r281 = add i32 0, 0

        mov     x16, #0
        sub     sp, sp, x16
        mov     x11, x0
        mov     x10, x1
        mov     x9, #0
        //  %r282 = add i32 0, 0

        mov     x9, #0
        //  %r283 = add i32 0, 0

        mov     x9, #0
        //  %r284 = add i32 0, 0

        mov     x9, #0
        //  %r285 = add i32 0, 0

        mov     x9, #0
        //  %r287 = add i32 %r182, 0

        mov     x9, x11
        //  %r286 = add i32 0, 0

        mov     x11, #0
        //  %r288 = add i32 %r184, 0

        mov     x11, x10
        //  store i32 0, i32* @h

        mov     x12, #0
        adrp     x10, h
        add     x10, x10, #:lo12:h
        str     x12, [x10]
        //  store i32 0, i32* @tail

        mov     x12, #0
        adrp     x10, tail
        add     x10, x10, #:lo12:tail
        str     x12, [x10]
        //  call void @inqueue(i32 %r287)

        mov     x0, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     inqueue
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  %r289 = add i32 0, 0

        mov     x9, #0
        mov     x10, x9
        //  %r290 = add i32 0, 0

        mov     x9, #0
        //  %r291 = add i32 0, 0

        mov     x9, #0
        //  %r292 = add i32 0, 0

        mov     x9, #0
        //  br label %bb24


        //bb24:  %r293 = phi i32 [ %r289, %bb54 ], [ %r299, %bb32 ]

        mov     x10, x10
        b     bb24
        //bb24:

bb24:

        //  %r293 = phi i32 [ %r289, %bb54 ], [ %r299, %bb32 ]

        //  %r191 = load i32, i32* @h

        adrp     x9, h
        add     x9, x9, #:lo12:h
        ldr     x12, [x9]
        //  %r192 = load i32, i32* @tail

        adrp     x9, tail
        add     x9, x9, #:lo12:tail
        ldr     x9, [x9]
        //  %r193 = icmp slt i32 %r191, %r192

        cmp     x12, x9
        //  br i1 %r193, label %bb25, label %bb26


        b.lt     bb25
        b     bb26
        //bb25:

bb25:

        //  %r298 = call i32 @popqueue()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     popqueue
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x12, x0
        //  %r197 = icmp eq i32 %r298, %r288

        cmp     x12, x11
        //  br i1 %r197, label %bb27, label %bb28


        b.eq     bb27
        b     bb28
        //bb27:

bb27:

        //  %r304 = add i32 1, 0

        mov     x9, #1
        mov     x9, x9
        //  br label %bb29


        //bb29:  %r299 = phi i32 [ %r304, %bb27 ], [ %r293, %bb28 ]

        mov     x10, x9
        b     bb29
        //bb28:

bb28:

        //  br label %bb29


        //bb29:  %r299 = phi i32 [ %r304, %bb27 ], [ %r293, %bb28 ]

        mov     x10, x10
        b     bb29
        //bb29:

bb29:

        //  %r299 = phi i32 [ %r304, %bb27 ], [ %r293, %bb28 ]

        //  %r199 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r298

        mov     x9, #8
        mul     x12, x12, x9
        adrp     x9, head
        add     x9, x9, #:lo12:head
        add     x9, x9, x12
        //  %r300 = load i32, i32* %r199

        ldr     x9, [x9]
        //  br label %bb30


        //bb30:  %r301 = phi i32 [ %r300, %bb29 ], [ %r303, %bb35 ]

        mov     x9, x9
        b     bb30
        //bb30:

bb30:

        //  %r301 = phi i32 [ %r300, %bb29 ], [ %r303, %bb35 ]

        //  %r202 = sub i32 0, 1

        mov     x12, #0
        sub     x12, x12, #1
        //  %r203 = icmp ne i32 %r301, %r202

        cmp     x9, x12
        //  br i1 %r203, label %bb31, label %bb32


        b.ne     bb31
        b     bb32
        //bb31:

bb31:

        //  %r205 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r301

        mov     x12, #8
        mul     x13, x9, x12
        adrp     x12, to
        add     x12, x12, #:lo12:to
        add     x12, x12, x13
        //  %r302 = load i32, i32* %r205

        ldr     x13, [x12]
        //  %r208 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r302

        mov     x12, #8
        mul     x13, x13, x12
        adrp     x12, inq
        add     x12, x12, #:lo12:inq
        add     x12, x12, x13
        //  %r209 = load i32, i32* %r208

        ldr     x13, [x12]
        //  %r210 = icmp eq i32 %r209, 0

        mov     x12, #0
        cmp     x13, x12
        //  br i1 %r210, label %bb33, label %bb34


        b.eq     bb33
        b     bb34
        //bb33:

bb33:

        //  %r212 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r301

        mov     x12, #8
        mul     x13, x9, x12
        adrp     x12, to
        add     x12, x12, #:lo12:to
        add     x12, x12, x13
        //  %r213 = load i32, i32* %r212

        ldr     x12, [x12]
        //  call void @inqueue(i32 %r213)

        mov     x0, x12
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     inqueue
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  br label %bb35


        b     bb35
        //bb34:

bb34:

        //  br label %bb35


        b     bb35
        //bb35:

bb35:

        //  %r215 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r301

        mov     x12, #8
        mul     x12, x9, x12
        adrp     x9, next
        add     x9, x9, #:lo12:next
        add     x9, x9, x12
        //  %r303 = load i32, i32* %r215

        ldr     x9, [x9]
        //  br label %bb30


        //bb30:  %r301 = phi i32 [ %r300, %bb29 ], [ %r303, %bb35 ]

        mov     x9, x9
        b     bb30
        //bb32:

bb32:

        //  br label %bb24


        //bb24:  %r293 = phi i32 [ %r289, %bb54 ], [ %r299, %bb32 ]

        mov     x10, x10
        b     bb24
        //bb26:

bb26:

        //  %r294 = add i32 0, 0

        mov     x9, #0
        mov     x9, x9
        //  br label %bb36


        //bb36:  %r295 = phi i32 [ %r294, %bb26 ], [ %r297, %bb37 ]

        mov     x9, x9
        b     bb36
        //bb36:

bb36:

        //  %r295 = phi i32 [ %r294, %bb26 ], [ %r297, %bb37 ]

        //  %r218 = load i32, i32* @tail

        adrp     x11, tail
        add     x11, x11, #:lo12:tail
        ldr     x11, [x11]
        //  %r219 = icmp sle i32 %r295, %r218

        cmp     x9, x11
        //  br i1 %r219, label %bb37, label %bb38


        b.le     bb37
        b     bb38
        //bb37:

bb37:

        //  %r221 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r295

        mov     x11, #8
        mul     x12, x9, x11
        adrp     x11, que
        add     x11, x11, #:lo12:que
        add     x11, x11, x12
        //  %r296 = load i32, i32* %r221

        ldr     x12, [x11]
        //  %r224 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r296

        mov     x11, #8
        mul     x12, x12, x11
        adrp     x11, inq
        add     x11, x11, #:lo12:inq
        add     x12, x11, x12
        //  store i32 0, i32* %r224

        mov     x11, #0
        str     x11, [x12]
        //  %r297 = add i32 %r295, 1

        add     x9, x9, #1
        //  br label %bb36


        //bb36:  %r295 = phi i32 [ %r294, %bb26 ], [ %r297, %bb37 ]

        mov     x9, x9
        b     bb36
        //bb38:

bb38:

        //  ret i32 %r293

        mov     x0, x10
        mov     sp, x29
        ret
        //%r449->x9
        //%r448->x9
        //%r447->x9
        //%r446->x9
        //%r445->x9
        //%r444->x9
        //%r443->x9
        //%r442->x9
        //%r441->x9
        //%r440->x9
        //%r317->x9
        //%r314->x9
        //%r313->x10
        //%r312->x10
        //%r253->x10
        //%r315->x10
        //%r228->x10
        //%r306->x9
        //%r247->x9
        //%r316->x9
        //%r229->x10
        //%r307->x9
        //%r233->x10
        //%r311->x9
        //%r252->x9
        //%r305->x9
        //%r308->x9
        //%r309->x9
        //%r310->x9
        //%r450->x9
        //%r451->x9
        //%r452->x9
        //%r453->x9
        //%r454->x9
        //%r455->x9
        //%r456->x9
        //%r457->x9
        //%r458->x9
main:

        //bb39:

bb39:

        //  %r228 = call i32 @quickread()

        mov     x16, #0
        sub     sp, sp, x16
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     quickread
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x10, x0
        //  store i32 %r228, i32* @n

        adrp     x9, n
        add     x9, x9, #:lo12:n
        str     x10, [x9]
        //  %r229 = call i32 @quickread()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     quickread
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x10, x0
        //  store i32 %r229, i32* @m

        adrp     x9, m
        add     x9, x9, #:lo12:m
        str     x10, [x9]
        //  call void @_sysy_starttime(i32 97)

        mov     x9, #97
        mov     x0, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     _sysy_starttime
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  call void @init()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     init
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  %r305 = add i32 0, 0

        mov     x9, #0
        //  %r308 = add i32 0, 0

        mov     x9, #0
        //  %r306 = add i32 0, 0

        mov     x9, #0
        //  %r309 = add i32 0, 0

        mov     x9, #0
        //  %r307 = add i32 0, 0

        mov     x9, #0
        //  %r310 = add i32 0, 0

        mov     x9, #0
        //  br label %bb40


        b     bb40
        //bb40:

bb40:

        //  %r233 = load i32, i32* @m

        adrp     x9, m
        add     x9, x9, #:lo12:m
        ldr     x10, [x9]
        //  %r234 = icmp ne i32 %r233, 0

        mov     x9, #0
        cmp     x10, x9
        //  br i1 %r234, label %bb41, label %bb42


        b.ne     bb41
        b     bb42
        //bb41:

bb41:

        //  %r311 = call i32 @getch()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     getch
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x9, x0
        //  br label %bb43


        //bb43:  %r312 = phi i32 [ %r311, %bb41 ], [ %r317, %bb44 ]

        mov     x10, x9
        b     bb43
        //bb43:

bb43:

        //  %r312 = phi i32 [ %r311, %bb41 ], [ %r317, %bb44 ]

        //  %r237 = icmp ne i32 %r312, 81

        mov     x9, #81
        cmp     x10, x9
        //  br i1 %r237, label %bb46, label %bb45


        b.ne     bb46
        b     bb45
        //bb46:

bb46:

        //  %r239 = icmp ne i32 %r312, 85

        mov     x9, #85
        cmp     x10, x9
        //  br i1 %r239, label %bb44, label %bb45


        b.ne     bb44
        b     bb45
        //bb44:

bb44:

        //  %r317 = call i32 @getch()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     getch
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x9, x0
        //  br label %bb43


        //bb43:  %r312 = phi i32 [ %r311, %bb41 ], [ %r317, %bb44 ]

        mov     x10, x9
        b     bb43
        //bb45:

bb45:

        //  %r242 = icmp eq i32 %r312, 81

        mov     x9, #81
        cmp     x10, x9
        //  br i1 %r242, label %bb47, label %bb48


        b.eq     bb47
        b     bb48
        //bb47:

bb47:

        //  %r315 = call i32 @quickread()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     quickread
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x10, x0
        //  %r316 = call i32 @quickread()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     quickread
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x9, x0
        //  %r247 = call i32 @same(i32 %r315, i32 %r316)

        mov     x0, x10
        mov     x1, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     same
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x9, x0
        //  call void @putint(i32 %r247)

        mov     x0, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     putint
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  call void @putch(i32 10)

        mov     x9, #10
        mov     x0, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     putch
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  br label %bb49


        b     bb49
        //bb48:

bb48:

        //  %r313 = call i32 @quickread()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     quickread
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x10, x0
        //  %r314 = call i32 @quickread()

        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     quickread
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        mov     x9, x0
        //  call void @addedge(i32 %r313, i32 %r314)

        mov     x0, x10
        mov     x1, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     addedge
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  br label %bb49


        b     bb49
        //bb49:

bb49:

        //  %r252 = load i32, i32* @m

        adrp     x9, m
        add     x9, x9, #:lo12:m
        ldr     x9, [x9]
        //  %r253 = sub i32 %r252, 1

        sub     x10, x9, #1
        //  store i32 %r253, i32* @m

        adrp     x9, m
        add     x9, x9, #:lo12:m
        str     x10, [x9]
        //  br label %bb40


        b     bb40
        //bb42:

bb42:

        //  call void @_sysy_stoptime(i32 117)

        mov     x9, #117
        mov     x0, x9
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     _sysy_stoptime
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  ret i32 0

        mov     x9, #0
        mov     x0, x9
        mov     sp, x29
        ret
