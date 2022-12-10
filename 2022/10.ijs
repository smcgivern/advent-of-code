instructions =. > cut&.> cutLF fread '10.dat'
step =. dyad define
'a b' =. x
r =. {: y
y , > (( r , r + ". b) ; r) {~ (<a) = <'noop'
)

echo +/ (20 60 100 140 180 220) ([ * {) 0 , 1 ] F.. step instructions NB. part 1
echo ' #' {~ {{ +./"1 (|: (_1 0 1) + 3 40 $ i. 40) = y }}"1 (6 40 $ }: 1 ] F.. step instructions) NB. part 2
