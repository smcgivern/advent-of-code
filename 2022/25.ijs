input =. 'b' fread '25.dat'
digit =. -&2@:('=-012'&i.)
decode =. x:@:+/@:((5&^)@:i.@:# * digit)@:|.

echo {{ '=-012' {~ 5 #.inv 5 #. ({{ 2 #~ # y }} + [) 5 #.inv y }} +/ > decode&.> input
