odo =: (#: i.@(*/))
start =: 234208
end =: 765869
candidates =: >:(end - start) {. start }. (odo (>: 8 9 9 9 9 9))

NB. part 1
# candidates

nodecrease =: [: */ 2 <:/\ ]
exactlytwoidentical =: 2 e. [: +/"1 =/~ NB. is there a _column_ summing to 2?
valid =: nodecrease * exactlytwoidentical

NB. part 2
+/ valid2"1 candidates
