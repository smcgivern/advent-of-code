input =. |: > ".&.> > '-'&splitstring&.> > ','&splitstring&.> cutLF fread '04.dat'
overlap =. <./@{: - >./@{.

smoutput +/ (<./@:-~/ = overlap) input NB. part 1
smoutput +/ 0 <: overlap input NB. part 2
