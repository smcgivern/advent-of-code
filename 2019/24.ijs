board =: '#' = > LF cut fread '24.dat'
neighbours =: monad : '(_1 |.!.0 y) + (1 |.!.0 y) + (_1 |.!.0"1 y) + (1 |.!.0"1 y)'
next =: dyad : '(<x,y) { 0 1 1 0 0 ,: 0 1 0 0 0'
step =: ] next"0 neighbours
repeat =: [: -. {: e. }: NB. negated for use by power-of
firstrepeat =: monad : '{: (] , [: step {:)^:repeat^:_ (1 5 5 ($,) y)'

NB. part 1
+/ 2&^ x: I. , firstrepeat board
