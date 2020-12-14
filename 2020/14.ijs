instructions =: cutopen 1!:1(<'14.dat')

NB. part 1
masked =: dyad def '#. (<0 1) |: x { 0 , 1 ,: |. 36 $!.0 |. #: y'

execute =: dyad define
'cmd v' =. ' = ' splitstring > y
'mask memory' =. x

if. cmd -: 'mask' do.
  memory ;~ 2"."0 v
else.
  pos =. ". }: 4 }. cmd
  mask ; (mask masked ". v) pos} memory
end.
)

+/ > {: ((36 $ 2) ; 65536 $ 0) (execute~ F.. ]) instructions

NB. part 2
permutations =: dyad def '~. ((2 1 * $ y) $ , (] , ])"1 y) ,. (+: # y) $ x { 3 2 $ 0 0 1 1 0 1'

NB. hideous! I couldn't make this work without the globals 
currentmask =: 36 $ 2
memory =: 1 $. x: 2 ^ 36

execute2 =: monad define
'cmd v' =. ' = ' splitstring > y

if. cmd -: 'mask' do.
  currentmask =: 2"."0 v
else.
  pos =. #. (2 1 $ 0) (permutations F.. ]) >./ currentmask ,: |. 36 $!.0 |. #: ". }: 4 }. cmd
  memory =: (". v) (<"0 pos)} memory
end.
)

execute2"1 > instructions
x: +/ memory
