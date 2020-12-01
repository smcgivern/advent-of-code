numbers =: ". > cutopen 1!:1(<'01.dat')

NB. part 1
pairs =: , (<@,"0)/~ numbers
*/ > ((+/"1 > pairs) i. 2020) } pairs 

NB. part 2
append =: dyad : '< (>x , >y)'
triples =: , numbers append/"0 ((<@,"0)/~ numbers)
*/ > ((+/"1 > triples) i. 2020) } triples
