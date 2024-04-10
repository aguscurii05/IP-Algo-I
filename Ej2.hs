--ej2.a

absoluto :: Int->Int
absoluto x| x > 0 = x
       | otherwise = -x

--ej2.b

maximoAbsoluto :: Int->Int->Int
maximoAbsoluto x y| absoluto x > absoluto y = absoluto x
                  | absoluto y > absoluto x = absoluto y
                  | otherwise = absoluto x

--ej2.c

maximo3 :: Int->Int->Int->Int
maximo3 x y z| x>=y && x>=z = x          
             | y>=x && y>=z = y
             | z>=y && z>=x = z

--ej2.d

algunoEs0:: Float->Float->Bool
algunoEs0 x y| x==0 || y==0 = True
             | otherwise = False

algunoEs0':: Float->Float->Bool
algunoEs0' 0 0 = True
algunoEs0' 0 y = True
algunoEs0' x 0 = True
algunoEs0' x y = False

--ej2.e

ambosSon0:: Float->Float->Bool
ambosSon0 x y| x==0 && y==0 = True
             | otherwise = False

ambosSon0'::Float->Float->Bool
ambosSon0' 0 0 = True
ambosSon0' x y = False

--ej2.f

mismoIntervalo :: Float->Float->Bool
mismoIntervalo x y| x<=3 && y<=3 = True
                  | 3<x && x<=7 && 3<y && y<=7 = True
                  | 7<=x && 7<=y = True
                  | otherwise = False

--ej2.g

sumaDistintos::Int->Int->Int->Int
sumaDistintos x y z| x==y && y==z = 0
                   | x==y = z
                   | y==z = x
                   | x==z = y
                   | otherwise = x+y+z

--ej2.h

divisible::Int->Int->Bool
divisible x y| (mod x y)==0 =True 
             | otherwise = False

esMultiploDe::Int->Int->Bool
esMultiploDe x y|x>0 && y>0 && (divisible x y)==True = True
                |otherwise = False

--ej2.i

digitoUnidades::Int->Int
digitoUnidades x| x>9 = (x-((div x 10)*10))
                | otherwise = x

--ej2.j

digitoDecenas:: Int->Int
digitoDecenas x| x>9 = div x 10
               | otherwise = 0