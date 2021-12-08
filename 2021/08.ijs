bitfield =: {{ >> +/&.> ('abcdefg'&="0)&.> cut y }}
input =: bitfield&.> > ('|'&cut)&.> cutLF fread '08.dat'

smoutput +/^:_ (2 3 4 7) e.~ > +/"1&.> {:"1 input NB. part 1

overlap =: I.@[ (0 -.@e. e.) I.@]

solve =: {{
fives =. y {~ I. 5 = +/"1 y
sixes =. y {~ I. 6 = +/"1 y
'one four seven eight' =. y {~ i.&(2 4 3 7) +/"1 y
'six zero nine' =: sixes /: (seven&overlap"1 sixes) + four&overlap"1 sixes
'two five three' =: fives /: (seven&overlap"1 fives) + (one&overlap"1 fives) + overlap&six"1 fives
zero , one , two , three , four , five , six , seven , eight ,: nine
}}

number =: {{
'a b' =. y
10 #. (#. solve a) i. #. > b
}}

smoutput +/ number"1 input NB. part 2
