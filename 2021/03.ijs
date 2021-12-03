input =: "."0 > cutLF fread '03.dat'
mostcommon =: +/ > -:&<:&#

smoutput (#. * #.&:-.) mostcommon input NB. part 1

next =: {{
'a b' =. y
column =. {."1 b
c =. u column
(a , c) ; }."1 b #~ (-.`*:@.c) column
}}

NB. boxing adds an extra leading axis?
done =: {{ 1 < 1 { $ > }. y }}
rating =: {{ #. (}. $ y) {. , >(u next)^:done^:_ ($0) ; y }}

smoutput (-.&mostcommon rating input) * (mostcommon rating input) NB. part 2
