bags =: cutopen 1!:1(<'07.dat')
'colours rawpositions' =: <"0 |: |:&.> > ' bags contain '&splitstring&.> bags
colours =: '' ; colours NB. save zero

compact =: monad def 'y #~ -. (0 $~ {: $ y) -:"1 y'
pos =: colours&i.
nodes =: dyad def 'x node"0 '', '' splitstring > y'

node =: dyad define
'quantity a b' =: 3 {. ;: > y
(pos <(a , ' ' , b)) , (pos x) , ". quantity
)

parents =: }. compact ,/ colours nodes"0 (''; rawpositions)

NB. part 1
nextparents =: dyad def '1 {"1 y {~ I. x e.~ {."1 y'
<: +/ -. 0 = ~. , (nextparents&parents)^:a: pos <'shiny gold'
