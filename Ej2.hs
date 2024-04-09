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

