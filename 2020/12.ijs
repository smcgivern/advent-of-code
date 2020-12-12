instructions =: cutopen 1!:1(<'12.dat')

NB. part 1
newangle =: dyad define
angle =. 1 0j1 _1 0j_1 {~ I. 0 90 180 270 e. 360 | x
+. angle * +.^:_1 y
)

step =: dyad define
'action value' =. ({.&.> , }.&.>) y
v =. ". value
'dx dy cx cy' =. x
distance =. , (I. 'NSEWLRF' e. action) { (0,v) , (0,-v) , (v,0) , (-v,0) , (0,0) , (0,0) ,: (v * (dx,dy))
angle =. , (newangle&(dx,dy)) (v,-v,:0) {~ 'LR' i. action
angle , ((cx,cy) + distance)
)

+/ | 2 }. (1 0 0 0) (step~ F.. ]) instructions

NB. part 2
step2 =: dyad define
'action value' =. ({.&.> , }.&.>) y
v =. ". value
'wx wy cx cy' =. x
distance =. , (I. 'NSEWLRF' e. action) { (0,v,0,0) , (0,-v,0,0) ,(v,0,0,0) , (-v,0,0,0) , (0,0,0,0) , (0,0,0,0) ,: (0,0,(v * (wx,wy)))
waypoint =. , (newangle&(wx,wy)) (v,-v,:0) {~ 'LR' i. action
distance + waypoint,cx,cy
)

+/ | 2 }. (10 1 0 0) (step2~ F.. ]) instructions
