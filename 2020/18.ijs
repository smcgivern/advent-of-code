expressions =: ((')(()'&charsub)&|.)&.> cutopen 1!:1(<'18.dat')

NB. part 1
+/ ". > expressions

NB. part 2; hacky (swaps meaning of * and + but keeps precendence)
load '18-recdesc.ijs'
+/ > calc&.> (' '&delstring)&('+**+'&charsub)&.> expressions
