'columns instructions' =. cutLF&.> LF2 splitstring fread '05.dat'
cols =. '' ; dlb&.> <"1 |: }: (>:@(4&*)@i.@$ {"1 >) columns
instrs =. ". > 1 3 5{"1 > cut&.> instructions
move =. adverb define
'i a b' =. x
'c d' =. y {~ a , b
(<d ,~ u i {. c) b} (< i }. c) a} y
)

smoutput }. > {.&.> cols ] F.. (|. move) instrs NB. part 1
smoutput }. > {.&.> cols ] F.. ([ move) instrs NB. part 2
