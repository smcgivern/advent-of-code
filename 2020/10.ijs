adapters =: /:~ ". > cutopen 1!:1(<'10.dat')

NB. part 1
*/ >: +/ (1 3 $~ (# adapters) , 2) = (<0 1) |: (-/~ 1&|.) adapters
