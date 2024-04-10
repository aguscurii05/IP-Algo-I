valAbs::Float->Float
valAbs x| x>=0 = x
        |otherwise = -x

distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
distanciaManhattan (a,b,c) (d,e,f)= valAbs (a-d)+valAbs (b-e)+valAbs (c-f)