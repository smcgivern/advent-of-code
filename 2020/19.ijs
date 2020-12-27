'a messages' =: (LF , LF) splitstring '"''' stringreplace 1!:1(<'19.dat')
rules =: ({:"1 /: ".&>&{."1) > (': '&splitstring)&.> cutopen a

brackets =: (,&')')&('('&,)
eval =: dyad define
rule =. > x { y
if. '''' = {. rule do.
  ". rule
else.
  brackets '|' joinstring (' '&delstring)&,&.> (eval&y)"0&".&.> ' | ' splitstring rule
end.
)

NB. part 1
+/ > ((0 eval rules)&rxeq)"1&.> cutopen messages

regex =: dyad define
reps =. '{' , x , '}'
'm n p' =. (eval&y)"0&.> 8 ; 42 ; 31
m , '+' , n , reps , p , reps
)

matches =: dyad def '+/ > ((x regex y)&rxeq)"1&.> cutopen messages'

NB. part 2
NB. only results up to 4
+/ (matches&rules)"0 '123456789'
