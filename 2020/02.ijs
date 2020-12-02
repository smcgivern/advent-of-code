NB. part 1
validate =: monad define
split =. ':' cut >y
password =. >1 { split
split =. ' ' cut >0 { split
range =. ". >'-' cut >0 { split
char =. 0 { >1 { split
count =. char +/@:= password
count = 1 { /:~ count , range
)

+/ validate"0 cutopen 1!:1(<'02.dat')

NB. part 2
validate =: monad define
split =. ':' cut >y
password =. >1 { split
split =. ' ' cut >0 { split
positions =. ". >'-' cut >0 { split
char =. 0 { >1 { split
NB. this works because there's a leading space in password!
1 = +/ char = positions { password
)

+/ validate"0 cutopen 1!:1(<'02.dat')
