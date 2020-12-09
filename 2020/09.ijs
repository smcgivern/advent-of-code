numbers =: ". > cutopen 1!:1(<'09.dat')

NB. part 1
valid =: monad def '({: y) e. }. ~. ,/ }: /. +/~ }: y'
] target =: numbers {~ {. 25 + I. -. 26 valid\ numbers

NB. part 2
length =: dyad def 'target e. x +/\ y'
run =: {: I. (length&numbers)"0 i. 250 NB. 17 contiguous numbers

({. + {:) /:~ ((I. target = run +/\ numbers) ,: run) ];.0 numbers
