'dots folds' =: ((".&.>)@cutLF)&.> 'xxx' cut ((LF , LF) ; 'xxx' ; 'x=' ; '0,~' ; 'y=' ; '0,' ; 'fold along' ; '') stringreplace fread '13.dat'

fold =: {{
'i j' =. (0 1) + +/ x
r =. >: 0 i.~ x
(i&({."r) +. (|."r)@(j&(}."r))) y 
}}

smoutput +/^:_ (> {. folds) fold 1 dots} 0 $~ >: >./ > dots NB. part 1
smoutput |: ' #' {~ (1 dots} 0 $~ >: >./ > dots) (] F.. fold) > folds NB. part 2
