--ej4.a

prodInt::(Float,Float)->Float
prodInt (x,y)= x*y

--ej4.b

todoMenor:: (Float,Float)->(Float,Float)->Bool
todoMenor (a,b) (c,d) = a<c && b<d

--ej4.c
distanciaPuntos::(Float,Float)->Float
distanciaPuntos (x,y) = sqrt (x^2+y^2)

--ej4.d

sumaTerna::(Float,Float,Float)->Float
sumaTerna (x,y,z) = x+y+z

--ej4.e

sumarSoloMultiplo::(Int,Int,Int)->Int->Int
sumarSoloMultiplo (x,y,z) n| n>0 && mod x n==0 && mod y n==0 && mod z n==0 = x+y+z
                           | n>0 && mod x n==0 && mod y n==0 && mod z n/=0 = x+y
                           | n>0 && mod x n==0 && mod y n/=0 && mod z n==0 = x+z
                           | n>0 && mod x n/=0 && mod y n==0 && mod z n==0 = y+z
                           | n>0 && mod x n==0 && mod y n/=0 && mod z n/=0 = x
                           | n>0 && mod x n/=0 && mod y n==0 && mod z n/=0 = y
                           | n>0 && mod x n/=0 && mod y n/=0 && mod z n==0 = z

--ej4.f

par::Int->Bool
par x | mod x 2==0 = True
      | otherwise= False
    

posPrimerPar::(Int,Int,Int)->Int
posPrimerPar (x,y,z)| par x = 1
                    | not (par x) && par y = 2
                    | not (par x) && not (par y) && par z = 3
                    | otherwise = 4


--ej4.g

crearPar:: a -> b-> (a,b)
crearPar a b = (a,b)

--ej4.h

invertir :: (a,b) -> (b,a)
invertir (a,b) = (b,a)
