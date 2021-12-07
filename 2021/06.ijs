input =: ". fread '06.dat'
frequency =: {{ +/ y =/ i. 9 }}
next =: {{ (1 |.!.0 y) + ({. y) * 0 0 0 0 0 0 1 0 1 }}

smoutput +/ next^:80 frequency input NB. part 1
smoutput +/ next^:256 frequency input NB. part 2
