input =: "."0 fread '08.dat'
layers =: input $~ (150 %~ # input), 150
zerolayers =: +/"1 (0 = layers)
layer =: layers {~ zerolayers i. (<./ zerolayers)

NB. part 1
(+/ 1 = layer) * (+/ 2 = layer)

pixel =: monad : '{. (y ~: 2) # y'

NB. part 2
6 25 $ ' #' {~ (pixel"1 |: layers)
