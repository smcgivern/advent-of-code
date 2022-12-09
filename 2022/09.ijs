input =. joinstring (".@:>@:{: $ >@:{.)@:cut&.> cutLF fread '09.dat'
next =. {{ (y , y ,: (y + ([ + (-@:* * (2&=@:|))) x - y)) {~ >./ | x - y }}
move =. dyad define
'h t' =. y
dir =. (4 2 $ 0 1 0 _1 1 0 _1 0) {~ 'UDLR' i. x
h2 =. dir + h
h2 ,: (h2 next t)
)

echo # ~. {:"2 (0 0 ,: 0 0) ] F:. move input NB. part 1

