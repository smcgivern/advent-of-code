input =. fread '01.dat'
calibrate =. ".@((<./ , >./)@I.@:(_&i.@(_&".)"0) { [)

echo +/ > calibrate &.> cutLF input NB. part 1

replacements =. 'one';'o1e';'two';'t2o';'three';'t3e';'four';'f4r';'five';'f5e';'six';'s6x';'seven';'s7n';'eight';'e8t';'nine';'n9e'

echo +/ > calibrate &.> cutLF (replacements&stringreplace)^:_ input NB. part 2
