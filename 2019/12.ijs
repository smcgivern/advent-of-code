start =: (4 3 $ _15 1 4 1 _10 _8 _5 4 9 4 6 _2) ,. 4 3 $ 0
gravity =: monad def '|: ([: +/ [: * -/~)"1 |: (3 {."1 y)'
applygravity =: monad def 'y + (4 3 $ 0) ,. gravity y'
step =: (3 }."1 applygravity) ,.~ (3 }."1 applygravity) + 3 {."1 ]
energy =: monad def '+/ (+/"1 (3 {."1 | y)) * (+/"1 (3 }."1 | y))'

NB. part 1
energy step^:1000 start

gravity1 =: monad def '4 1 $ ([: +/ [: * -/~)"1 |: ({."1 y)'
applygravity1 =: monad def 'y + (4 1 $ 0) ,. gravity1 y'
step1 =: ([: }."1 applygravity1) ,.~ ([: }."1 applygravity1) + }:"1

repeat =: monad define
i =. 1
z =. step1 y
while. -. y -: z do.
  i =. >:i
  z =. step1 z
end.
i
)

xperiod =: repeat (0 3{"1 start)
yperiod =: repeat (1 4{"1 start)
zperiod =: repeat (2 5{"1 start)

NB. part 2
xperiod *. yperiod *. zperiod
