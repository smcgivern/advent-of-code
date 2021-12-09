fill =: {{ x , y , x }}
surround =: {{ x&fill"1 x&fill"2 y }}
rotate =: {{ ({. x) |.!.0"1 (({: x) |.!.0 y) }}
neighbours =: {{ (rotate&y)"1 (4 2 $ _1 0 0 _1 0 1 1 0) }}

input =: 10 surround "."0 'm' fread '09.dat'

lowpoints =: {{
a =. y < <./ neighbours y
a + y * a
}}

smoutput +/^:_ lowpoints input NB. part 1
