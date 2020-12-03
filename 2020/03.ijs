map =: > cutopen 1!:1(<'03.dat')

NB. part 1
y =: >: i. <: {. $ map
x =: ({: $ map) | 3 * y
+/ '#' = (;/ y ,. x) { map

NB. part 2
slope =: dyad define
'a b' =. x
steps =. >: i. <. (<: {. $ y) % b 
b =. b * steps
a =. ({: $ y) | a * steps
+/ '#' = (;/ b ,. a) { y
)
*/ (slope&map)"1 (5 2 $ 1 1 3 1 5 1 7 1 1 2)
