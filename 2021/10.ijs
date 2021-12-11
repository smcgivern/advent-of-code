NB. did Ruby first, then this
NB. the signs are a bit incoherent :-(
input =: ('()[]{}<>'&i.)&.> cutLF fread '10.dat'

incomplete =: {{
_2 Z: 0 > {. y
> (<(x > 0) , x = {: y) { 2 2 $ (y , - x) ; (y , - x) ; (y ,~ - x) ; }: y
}}

score =: {{ - (1 $ 0) {. F.. incomplete ({&(_3 3 _57 57 _1197 1197 _25137 25137)) y }}

smoutput +/ > score&.> input NB. part 1

score2 =: {{ {. {{ x + y * 5 }}/\. (1 $ 0) }. F.. incomplete ({&(_1 1 _2 2 _3 3 _4 4)) y }}
median =: <.@-:@# { /:~

smoutput median > score2&.> input #~ -. * > score&.> input NB. part 2
