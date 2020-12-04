passports =: (LF , LF) splitstring 1!:1(<'04.dat')

NB. part 1
valid =: monad define
*/ (;: 'byr: iyr: eyr: hgt: hcl: ecl: pid:') e. ;: > y
)
+/ valid"0 passports

NB. part 2
validnum =: dyad define
y2 =. ". y
y2 = 1 { /:~ y2 , x
)

validchars =: dyad define
'length alphabet' =. x
(length = # y) *. (*/ y e. alphabet)
)

byr =: (1920 2002)&validnum
iyr =: (2010 2020)&validnum
eyr =: (2020 2030)&validnum

hgt =: monad define
'unit num' =. _2 split y
num validnum~ ('in' -: unit) { 2 2 $ 150 193 59 76
)

hcl =: monad define
'first rest' =. 1 split y 
(first = '#') *. (6 ; '0123456789abcdef') validchars rest
)

ecl =: e.&(>;:'amb blu brn gry grn hzl oth')
pid =: (9 ; '0123456789')&validchars
cid =: monad : '1'

validfield =: monad define
'verb value' =. ':' cut >y
verb~ value
)

validfields =: monad define
*/ validfield"0 cutopen (LF ; ' ') stringreplace > y
)

+/ (valid *. validfields)"0 passports
