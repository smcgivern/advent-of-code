seats =: > cutopen 1!:1(<'05.dat')

NB. part 1
seatid =: monad def '#. y e. ''BR'''
ids =: seatid"1 seats
>./ ids

NB. part 2
(e. i: 0:)&ids i. >. / ids
