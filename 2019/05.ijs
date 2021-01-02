prompt =: 3 : '1!:1]1 [ ((2) 1!:2~ ])y' NB. from J wiki

choose =: monad : '1 2 3 4 99 i. ((1{y * 10) + 0{y)' NB. zero-indexed
instructions =: add`multiply`input`output`halt NB. for this!
skips =: 4 4 2 2 0 NB. and this

modes =: 5 $!.0 [: |. "."0@": NB. split to digits, reverse, pad with zeroes

position =: { { ] NB. these could be inline in param?
immediate =: {
param =: adverb define
:
(m + x) position`immediate@.((>:m) { modes x { y) y
)

triad =: adverb define
:
a =. x (1 param) y
b =. x (2 param) y
(a u b) ((x + 3) { y)} y
)

NB. instructions
add =: + triad
multiply =: * triad

input =: dyad define
value =. ". prompt 'Enter input'
value ((>:x) { y)} y
)

output =: dyad define
smoutput x (1 param) y
y
)

halt =: ] NB. return input unchanged

NB. wrapper
exec =: monad define
a =. > 0 { y
b =. > 1 { y
instructionmodes =. modes a { b
i =. choose (0 1 { instructionmodes)
instruction =. instructions@.i
skip =. i { skips
(a + skip);a instruction b
)

done =: monad define
a =. > 0 { y
b =. > 1 { y
-. 99 = a { b
)

init =: ". > ',' cut 1!:1(<'05.dat')

NB. part 1
exec^:done^:_ (0;init)

NB. didn't save part 2 :-(
