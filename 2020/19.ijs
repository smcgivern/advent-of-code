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
