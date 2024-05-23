--ej1.a

f :: Int->Int
f x| x==1=8
   | x==4=131
   | x==16=16

--ej1.b

g :: Int->Int
g y| y==8=16
   | y==16=4
   | y==131=1

--ej1.c

h :: Int->Int
h z = f (g z)

k :: Int->Int
k z = g (f z)

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

--ej3

--problema estanRelacionados (a:Z, b:Z) : Bool {
--requiere: {a ̸= 0 ∧ b ̸= 0}
--asegura: {(res = true) ↔ a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k ̸= 0)}

estanRelacionados:: Int->Int->Bool
estanRelacionados a b|a/=0 && b/=0 && (mod (a*a) (a*b))==0 = True
                     |otherwise = False

--si el resto es 0 significa que a*b es multiplo de a*a, por lo tanto existe un k/asegura

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

--ej5 

f'::Int->Int
f' x| x<=7 = x^2
   | otherwise = 2*x-1

g'::Int->Int
g' x| mod x 2==0 = div x 2
   | otherwise = 3*x+1

todosMenores::(Int,Int,Int)->Bool
todosMenores (x,y,z)| (f' x > g' x) && (f' y > g' y) && (f' z > g' z) = True
                    | otherwise =False

--ej6

bisiesto::Int->Bool
bisiesto x| mod x 4==0 || (mod x 100==0 && (mod x 400/=0)) = True
          |otherwise = False


--este lo invente yo:)
proxBisiesto::Int->Int
proxBisiesto x| bisiesto x = x+4
              | bisiesto (x+1) =x+1
              |bisiesto (x+2) = x+2
              |otherwise = x+3

--ej7

valAbs::Float->Float
valAbs x| x>=0 = x
        |otherwise = -x

distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
distanciaManhattan (a,b,c) (d,e,f)= valAbs (a-d)+valAbs (b-e)+valAbs (c-f)

--ej8

sumaUltDosDig::Int->Int
sumaUltDosDig x= digitoDecenas x + digitoUnidades x

comparar::Int->Int->Int
comparar x y|sumaUltDosDig x < sumaUltDosDig y = 1
            |sumaUltDosDig x > sumaUltDosDig y = -1
            |otherwise = 0
