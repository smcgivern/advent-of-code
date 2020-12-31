identifiers =: cutopen ('se';'S';'sw';'s';'ne';'N';'nw';'n') stringreplace 1!:1(<'24.dat')
directions =: 'eSswNn'
coords =: 1 _1 0 , 0 _1 1 , _1 0 1 , _1 1 0 , 1 0 _1 ,: 0 1 _1

frequency =: ~. ,. #/.~
destination =: monad def '+/ coords {~ directions i. y'

NB. part 1
+/ 1 = {:"1 frequency > destination&.> identifiers
