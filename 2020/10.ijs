adapters =: /:~ ". > cutopen 1!:1(<'10.dat')

NB. part 1
*/ >: +/ (1 3 $~ (# adapters) , 2) = (<0 1) |: (-/~ 1&|.) adapters

NB. part 2
*/ (1 1 2 4 7) {~ <: (#;.1) 0 , 1 = (<0 1) |: (-/~ 1&|.) 0 , adapters
