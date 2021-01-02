select =: (+&(1 2)@[ { ]) { ] NB. tacit fork of forks to get both param values
triad =: adverb define NB. can't be tacit, but allows operator to be separate
:
(u/ x select y) ((x + 3) { y)} y
)
add =: + triad
multiply =: * triad
end =: ]
done =: (99 " 1) = {
choose =: 1 2 99"1 i. {
exec =: add`multiply`end@.choose
next =: dyad def 'if. 99 = x { y do. x else. x + 4 end.'
wrap =: monad define
a =. > 0 { y
b =. > 1 { y
(a next b); a exec b
)
init =: ". > ',' cut 1!:1(<'02.dat')

NB. part 1
{. > {. {: {: wrap^:a: 0;(12 2 (1 2}) init)

NB. part 2 is manual
9581917 % 19690720
{. > {. {: {: wrap^:a: 0;(12 4 (1 2}) init)
{. > {. {: {: wrap^:a: 0;(12 0 (1 2}) init) NB. seems to just add
{. > {. {: {: wrap^:a: 0;(25 0 (1 2}) init) NB. a little over double?
{. > {. {: {: wrap^:a: 0;(25 5 (1 2}) init) NB. tweak for answer
