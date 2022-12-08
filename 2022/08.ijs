input =. > "."0&.> cutLF fread '08.dat'
visible =. 1 , 2 ~:/\ >./\

echo +/, +./ visible`visible&.|:`(visible&.|.)`(visible&.(|.@:|:))`:0 input NB. part 1
