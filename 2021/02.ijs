instructions =: +. */"1 ". > cutLF ('forward'; '1j0'; 'down'; '0j1'; 'up'; '0j_1') stringreplace fread '02.dat'

smoutput */ x: +/ instructions NB. part 1

aim =: +/\ {:"1 instructions
forward =: {."1 instructions
smoutput x: (+/ forward) * +/ */"1 forward ,. aim NB. part 2
