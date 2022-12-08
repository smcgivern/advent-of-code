input =. > "."0&.> cutLF fread '08.dat'
visible =. 1 , 2 ~:/\ >./\

echo +/, +./ visible`(visible&.|:)`(visible&.|.)`(visible&.(|.@:|:))`:0 input NB. part 1

seen =. (>:@:i.&0 <. #)@:({. > }.)\.

echo >./, */ (seen"1)`(seen"1&.|:)`((seen&.|.)"1)`(((seen&.|.)"1)&.|:)`:0 input NB. part 2
