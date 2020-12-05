seats =: > cutopen 1!:1(<'05.dat')

NB. part 1
seatid =: monad define
'row col' =. _3 split y
(8 * #. 'B' = col) + (#. 'R' = row)
)
>./ seatid"1 seats

NB. part 2
sorted =: /:~ seatid"1 seats
consecutive =: dyad : '1 = y - x'
>: sorted {~ (}: sorted) (consecutive i. 0:) (}. sorted) NB. ugh
