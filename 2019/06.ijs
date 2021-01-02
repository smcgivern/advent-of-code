input =: s: > ')' cut each LF cut fread '06.dat'
objects =: ~. , input
parents =: (1 { |: input) i. objects
sentinel =: parents i. # input
parentscanonical =: objects i. (sentinel sentinel} parents) { (0 { |: input)

NB. part 1
+/ (i.&sentinel)"1 ({&parentscanonical)^:(~:&sentinel)^:a:"0 i. # objects

you =: ({&parentscanonical)^:(~:&sentinel)^:a:"0 (objects i. s: <'YOU')
san =: ({&parentscanonical)^:(~:&sentinel)^:a:"0 (objects i. s: <'SAN')

NB. part 2; off by one twice
(+/ 0&= e.&san you) + (+/ 0&= e.&you san) - 2
