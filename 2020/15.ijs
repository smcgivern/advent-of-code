start =: 9 6 0 10 18 2 1

NB. part 1
game =: dyad define
_2 Z: x = # y
y , -/ 2 $ |. I. (] e. {:) y
)

{: 2020 (game F. ]) start

NB. part 2 (slow) - faster version in Ruby
gameloop =: dyad define
sparse =: 1 $. 30000000
last =: {: y
insert =: dyad def 'sparse =: y x} sparse'
n =. # y

y insert >: i. n

for_i. n + i. x - n do.
  if. 0 = 100000 | i do. smoutput i ; last ; 6!:1 '' end.
  prev =. last { sparse
  sparse =: i last} sparse
  if. prev = 0. do. last =: 0 else. last =: i - prev end.
end.

last
)

30000000 gameloop start
