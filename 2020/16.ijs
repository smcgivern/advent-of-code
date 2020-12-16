'a b c' =: (LF , LF) splitstring 1!:1(<'16.dat')

rule =: dyad def '+./ , 1 3 =/~ I. x e.~ /:~ y , x'
torange =: monad def ', ". > (''-''&splitstring)"1 > '' or '' splitstring > {: '': '' splitstring y'
toticket =: monad def '". > '','' cut y'
invalid =: dyad def 'x * -. +./ (x&rule)"1 y'

ranges =: torange"1 > cutopen a
tickets =: toticket"1 > }. cutopen c

NB. part 1
+/ (invalid&ranges)"0 , tickets

NB. part 2
invalid2 =: dyad def '-. +./ (x&rule)"1 y' NB. need to drop zeroes
candidate =: dyad def '(x&rule)"1 y'
validrow =: dyad def '*/ (candidate&y)"0 x'

valid =: tickets {~ I. 0 = +/"1 (invalid2&ranges)"0 tickets

NB. this shows that there is a single unique combination; do that by hand
/:~ +/"1 (validrow&ranges) valid

NB. this is that combination
fields =: 11 5 0 17 16 12 18 9 19 3 7 4 8 2 1 10 13 15 6 14
departures =: I. ('de'&-:)"1 > (2&{.)&.> cutopen a
*/ (I. departures e.~ fields) { , toticket > }. cutopen b
