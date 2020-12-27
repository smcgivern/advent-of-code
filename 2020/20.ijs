input =: (LF , LF) splitstring 1!:1(<'20.dat')
ids =: ". ((5,:4)&(];.0))"1 >> {.&cutopen&.> input
tiles =: '#' = >> }.&cutopen&.> input

edge =: #.&([ , |."1)&({:"1 , {: , {. ,: {."1)
edges =: edges"2 tiles
matches =: dyad def '+/ x = , y'

NB. part 1
*/ ids {~ I. 2 = +/"1 (1 = (4&{.)"1 (matches&edges)"0 edges)
