input =. 'b' fread '25.dat'
decode =. {{ 5 #. 2 -~ '=-012' i. y }}

echo {{ '=-012' {~ 5 #.inv 5 #. ({{ 2 #~ # y }} + [) 5 #.inv y }} +/ > decode&.> input
