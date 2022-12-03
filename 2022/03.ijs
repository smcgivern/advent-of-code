alphabet =. , {{ a. {~ y + i. 26 }}"0 (97 65)
input =. {{ >: alphabet i. y }}&.> cutLF fread '03.dat'
intersect =. monad define
'a b' =. ({.&y)"0 (1 _1 * -: # y)
{. a (e. # [) b
)

smoutput +/ > intersect&.> input NB. part 1

intersect3 =. monad define
'a b c' =. y
{. a (e. # [) b (e. # [) c
)

smoutput +/ _3 intersect3\ input NB. part 2
