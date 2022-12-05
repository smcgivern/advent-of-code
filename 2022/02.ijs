input =. , >> cut&.> cutLF fread '02.dat'
mask =. {{ x { ~ 'ABCXYZ' i. y }}
score =. 3 0 6 {~ 3 | -/
instructions =. |: 2500 2 $ 1 2 3 1 2 3 mask input

echo +/ ({: + score) instructions NB. part 1

code =. |: 2500 2 $ 1 2 3 2 0 1 mask input
instructions2 =. ({. code) ,: 3 | ({. + {:) code
zerotothree =. {{ ({: y) + 3 * 0 = {: y }}

echo +/ (zerotothree + score) instructions2 NB. part 2
