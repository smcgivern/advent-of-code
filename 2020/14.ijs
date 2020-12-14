instructions =: cutopen 1!:1(<'14.dat')

newmask =: dyad def 'y ;~ 2"."0 x'
masked =: dyad def '#. (<0 1) |: x { 0 , 1 ,: |. 36 $!.0 |. #: y'
newmemory =: conjunction def 'x ; (x masked n) m} y'

NB. part 1
execute =: dyad define
'cmd v' =. ' = ' splitstring > y
'mask memory' =. x

if. cmd -: 'mask' do.
  v newmask memory
else.
  pos =. ". }: 4 }. cmd
  mask (pos newmemory (". v)) memory
end.
)

+/ > {: ((36 $ 2) ; 65536 $ 0) (execute~ F.. ]) instructions
