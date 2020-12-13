input =: cutopen 1!:1(<'13.dat')
busids =: (* # ]) , > ".&.> ',' cut > {: input

NB. part 1 (ugly)
timestamp =: ". > {. input
offset =: 0 i.~ */"1 (busids&|)"0 timestamp + i. 100
offset * busids {~ 0 i.~ (busids&|)"0 timestamp + offset

NB. part 2
constraints =: , > 1&".&.> ',' cut > {: input

NB. from https://code.jsoftware.com/wiki/Fifty_Shades_of_J/Chapter_41
inv =: i.&1@([|]*i.@[)
lsol =: dyad : 'x|(x inv {.y)*(-{:y)'
linsol=:dyad : 0           NB. linear equation solver
if.1=gcd=.x+.{.y              NB. if a and n are co-prime ..
   do.x lsol y
elseif.0=gcd|{:y              NB. if gcd(a,n) divides b ..
   do.(m lsol y%gcd)+(m=.x%gcd)*i.gcd
end.                          NB. otherwise null result
)
simlsol=:dyad : 0        NB. simultaneous congruences
r1=.>-@{:every y
r2=.(%~*/)x
r3=.>x linsol every <"1 r2,._1
r=.(*/x)|+/r1*r2*r3
)

(x: busids) simlsol I. constraints e. busids
