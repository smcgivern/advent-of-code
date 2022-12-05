input =. |: > ".&.> > '-'&splitstring&.> > ','&splitstring&.> cutLF fread '04.dat'
overlap =. <./@{: - >./@{.

echo +/ (<./@:-~/ = overlap) input NB. part 1
echo +/ 0 <: overlap input NB. part 2
