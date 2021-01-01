identifiers =: cutopen ('se';'S';'sw';'s';'ne';'N';'nw';'n') stringreplace 1!:1(<'24.dat')
directions =: 'eSswNn'
coords =: 1 0 , 0 1 , _1 1 , _1 0 , 1 _1 ,: 0 _1
frequency =: ~. ,. #/.~
destination =: monad def '+/ coords {~ directions i. y'
destinations =: > destination&.> identifiers

NB. part 1
+/ 1 = {:"1 frequency destinations 

init =: (-&(<./&,) + ]) (1&=&{:"1 # }:"1) frequency destinations
fill =: monad def '0 , y , 0'
surround =: monad def 'fill"1 fill"2 y'
neighbours =: monad def '+/ 1 = (|.!.0&y)"1 coords' 
next =: dyad def '(<x,y) { 0 0 1 0 0 0 0 ,: 0 1 1 0 0 0 0'
step =: ] next"0 neighbours 

NB. part 2
+/, (step&surround)^:100 (1 init} 0 $~ 2 $ >: >./, init)
