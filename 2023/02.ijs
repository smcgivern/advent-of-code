parse =. {{ +/ > ". > ', ' splitstring (' red' ; '*(1 0 0)' ; ' green' ; '*(0 1 0)' ; ' blue' ; '*(0 0 1)') stringreplace y }}
parseline =. {{ parse &.> '; ' splitstring > {: ': ' splitstring y }}
input =. parseline &.> cutLF fread '02.dat'

valid =. {{ */ (12 13 14) >: >./ > y }}
echo +/ >: I. > valid &.> input NB. part 1

power =. {{ */ >./ > y }}
echo +/ > power &.> input NB. part 2
