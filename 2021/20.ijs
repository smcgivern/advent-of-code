input =: cutLF fread '20.dat'
algorithm =: '#' = > {. input
image =: '#' = > }. input

fill =: {{ x , y , x }}
surround =: {{ x&fill"1 x&fill"2 y }}
rotate =: {{ ({. x) |.!.m"1 (({: x) |.!.m y) }}
step =: {{
f =. ({. x) *. 0 < 4 | # y
x {~ (,~@%:@# $ ]) #. |: ,/"2 f rotate&(f surround y)"1 (9 2 $ _1 _1 0 _1 1 _1 _1 0 0 0 1 0 _1 1 0 1 1 1)
}}


smoutput +/^:_ (algorithm&step)^:2 image NB. part 1
smoutput +/^:_ (algorithm&step)^:50 image NB. part 2
