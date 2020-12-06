groups =: (LF , LF) splitstring 1!:1(<'06.dat')

NB. part 1
+/ #&~.&> (LF&delstring)&.> groups

NB. part 2
commonanswers =: monad def '+/ *./ (a. {~ 97+i.26) e."1 > cutopen > y'
+/ commonanswers"0 groups
