input =. |: > ".&.> > '-'&splitstring&.> > ','&splitstring&.> cutLF fread '04.dat'
overlap =. (0&>.)@>:@(<./@{: - >./@{.)

smoutput +/ (>:@<./@:-~/ = overlap) input NB. part 1
smoutput +/ 0 ~: overlap input NB. part 2
