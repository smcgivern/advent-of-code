totals =. +/"1 ". > 'XXX' cut (LF2 ; 'XXX' ; LF ; ' ') stringreplace fread '01.dat'

smoutput >./ totals NB. part 1
smoutput +/ 3 {. \:~ totals NB. part 2
