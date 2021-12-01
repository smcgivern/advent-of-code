input =: ". > cutLF fread '01.dat'
smoutput +/ 2 </\ input NB. part 1
smoutput +/ 2 </\ 3 +/\ input NB. part 2
