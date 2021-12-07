input =: cutLF fread '04.dat'
calls =: ". > ',' cut > {. input
boards =: 100 5 $ ". > }. input

winners =: {{ (*/"1 +. */"2) (e.&y)"0 x }}
done =: {{ +/ +/ x winners y }}
score =: {{
c =. y {.~ >: 1 i.~ > (x&done)&.> <\ y
b =. x {~ I. +/"1 x winners c
({: c) * +/^:_ b * -. (e.&c)"0 b
}}

smoutput boards score calls NB. part 1

done2 =: {{ *./ +./"1 x winners y }} NB. have all boards won?
score2 =: {{
c =. y {.~ >: 1 i.~ > (x&done2)&.> <\ y
b =. x {~ I. -. +./"1 x winners }: c NB. find only losing board, ignoring last number
({: c) * +/^:_ b * -. (e.&c)"0 b
}}

smoutput boards score2 calls NB. part 2
