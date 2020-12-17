layout =: '.#L' i. > cutopen 1!:1(<'17.dat')

fill =: monad def '0 , y , 0'
surround =: monad def 'fill"1 fill"2 fill"3 y'
compact =: monad def 'y #~ -. (0 $~ {: $ y) -:"1 y'
neighbours =: monad def '+/ 1 = (|.!.0&y)"1 compact 1 -~ 3 3 3 #: i. 27'
next =: dyad def 'x { (y = 3) , x *. y e. 2 3'
step =: ] next"0 neighbours

NB. part 1
+/, (step&surround)^:6 ,: layout

surround2 =: monad def 'fill"1 fill"2 fill"3 fill"4 y'
neighbours2 =: monad def '+/ 1 = (|.!.0&y)"1 compact 1 -~ 3 3 3 3 #: i. 81' 
step2 =: ] next"0 neighbours2

NB. part 2
+/, (step2&surround2)^:6 ,: ,: layout
