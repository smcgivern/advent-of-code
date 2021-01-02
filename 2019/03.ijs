singlesteps =: (2 ,~ [: ". }.) $ (4 2$_1 0 0 _1 0 1 1 0) {~ 'LDUR' i. {.
path =: monad def '+/\>,&.>/ singlesteps each y'
intersections =: e. # [
lines =: (10{a.) cut [: 1!:1 <
closest =: monad def '<./ +/"1 | (>intersections&.>/ path each '','' cut each lines y)'

NB. part 1
closest '03.dat'

shortest =: monad define
paths =. path each ',' cut each lines y
>:>:<./+/(>paths) i."2 >intersections&.>/paths
)

NB. part 2
shortest '03.dat'
