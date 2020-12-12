layout =: '.#L' i. > cutopen 1!:1(<'11.dat')

NB. part 1
rotate =: dyad def '({. x) |.!.0"1 (({: x) |.!.0 y)'
neighbours =: monad def '+/ 1 = (rotate&y)"1 (1 1 1 1 0 1 1 1 1) # ,/ ,"0/~ _1 0 1'
next =: dyad : '(<x,y) { 0 0 0 0 0 0 0 0 0 , 1 1 1 1 2 2 2 2 2 ,: 1 2 2 2 2 2 2 2 2'
step =: ] next"0 neighbours
+/, 1 = step^:_ layout

NB. part 2 in Ruby :-(
