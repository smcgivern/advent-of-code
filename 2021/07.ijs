input =: ". fread '07.dat'
smoutput <./ +/ |@-/~ input NB. part 1
smoutput <./ +/ +/@i.@>:@|@-/~ input NB. part 2
