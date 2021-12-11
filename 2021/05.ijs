input =: ". > cutLF ('->' ; ',') stringreplace fread '05.dat'

valid =: {{ +/ =/ 2 2 $ y }}

grid =: {{
'a b' =. 2 2 $ y
c =. b ,~ a +"1 |: (* * i."0@|) b - a
1 c} x $ 0
}}

smoutput +/ +/ 1 >~ +/ (1000 1000)&grid"1 input #~ valid"1 input NB. part 1
smoutput +/ +/ 1 >~ +/ (1000 1000)&grid"1 input NB. part 2
