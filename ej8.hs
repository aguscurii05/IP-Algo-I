digitoUnidades::Int->Int
digitoUnidades x| x>9 = (x-((div x 10)*10))
                | otherwise = x


digitoDecenas:: Int->Int
digitoDecenas x| x>9 = mod (div x 10) 10
               | otherwise = 0

valAbs::Float->Float
valAbs x| x>=0 = x
        |otherwise = -x

sumaUltDosDig::Int->Int
sumaUltDosDig x= digitoDecenas x + digitoUnidades x

comparar::Int->Int->Int
comparar x y|sumaUltDosDig x < sumaUltDosDig y = 1
            |sumaUltDosDig x > sumaUltDosDig y = -1
            |otherwise = 0