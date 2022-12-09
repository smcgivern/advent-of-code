input =. > "."0&.> cutLF fread '08.dat'
map =. {{ (u"1)`(u"1&.|:)`((u&.|.)"1)`(((u&.|.)"1)&.|:)`:0 y }}

echo +/, +./ (1 , 2 ~:/\ >./\) map input NB. part 1
echo >./, */ ((>:@:i.&0 <. #)@:({. > }.)\.) map input NB. part 2
