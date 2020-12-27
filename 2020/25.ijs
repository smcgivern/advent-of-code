'a b' =: ". > cutopen 1!:1(<'25.dat')

step =: dyad def '20201227 | x * y'
loops =: <: # (step&7)^:(~:&a)^:a: (1)

NB. part 1
b (step^:loops) 1
