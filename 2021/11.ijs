input =: "."0 'm' fread '11.dat'

rotate =: {{ ({. x) |.!.0"1 (({: x) |.!.0 y) }}

flash =: {{
mask =. 9 < y
(__ * mask) + y + +/ (rotate&mask)"1 (8 2 $ _1 _1 _1 0 _1 1 0 _1 0 1 1 _1 1 0 1 1)
}}

step =: {{ (-.@(__&=) * [) flash^:_ >: y }}

smoutput  (+/^:_) 0 = step^:(<101) input NB. part 1
smoutput <: # step^:{{ -. (*/^:_) 0 = y }}^:a: input NB. part 1
