'dots folds' =: ((".&.>)@cutLF)&.> 'xxx' cut ((LF , LF) ; 'xxx' ; 'x=' ; '0,~' ; 'y=' ; '0,' ; 'fold along' ; '') stringreplace fread '13.dat'

paper =: {{ 1 y} 0 $~ >: >./ > y }}
fold =: {{
'i j' =. (0 1) + +/ x
r =. >: 0 i.~ x
(i&({."r) +. (|."r)@(j&(}."r))) y 
}}

smoutput +/^:_ (> {. folds) fold paper dots NB. part 1
smoutput |: ' #' {~ (paper dots) (] F.. fold) > folds NB. part 2
