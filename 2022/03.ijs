alphabet =: , {{ a. {~ y + i. 26 }}"0 (97 65)
input =. {{ >: alphabet i. y }}&.> cutLF fread '03.dat'
halves =. {{ ({.&y)"0 (1 _1 * -: # y) }}
intersect =. {{ {. (e. # [)/ y }}

smoutput +/ > intersect@halves&.> input NB. part 1
smoutput +/ _3 intersect@:>\ input NB. part 2
