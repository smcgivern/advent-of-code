input =. joinstring (".@:>@:{: $ >@:{.)@:cut&.> cutLF fread '09.dat'
next =: {{ (x , x ,: (x + ([ + (-@:* * (2&=@:|))) y - x)) {~ >./ | y - x }}
move =. dyad define
'h t' =. ({. ; }.) y
dir =. (4 2 $ 0 1 0 _1 _1 0 1 0) {~ 'UDLR' i. x
h2 =. dir + h
h2 , (] F:. next (h2 , t))
)

echo # ~. {:"2 (2 2 $ 0 0) ] F:. move input NB. part 1
echo # ~. {:"2 (10 2 $ 0 0) ] F:. move input NB. part 2
