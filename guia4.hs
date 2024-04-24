import Data.Binary.Get (Decoder(Fail))
import Data.Maybe (fromJust)
--ej5

medioFact :: Integer ->Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n =n*medioFact(n-2)

--Ejercicio 6. Especificar e implementar la funci´on sumaDigitos :: Integer ->Integer que calcula la suma de d´ıgitos de
--un n´umero natural. Para esta funci´on pueden utilizar div y mod.

sumaDigitos :: Integer ->Integer
sumaDigitos n | 0<n && n<10 = n
sumaDigitos n | n>=10 = mod n 10 + sumaDigitos (div n 10)

--Ejercicio 7. Implementar la funci´on todosDigitosIguales :: Integer ->Bool que determina si todos los d´ıgitos de un
--n´umero natural son iguales, es decir:
--problema todosDigitosIguales (n: Z) : B {
--requiere: { n > 0 }
--asegura: { resultado = true ↔ todos los d´ıgitos de n son iguales }

todosDigitosIguales :: Integer ->Bool
todosDigitosIguales n| 0<n && n<10 = True
                     | n>=10 && mod n 10== mod (div n 10) 10 = todosDigitosIguales (div n 10)
                     | otherwise = False

{-Ejercicio 8. Implementar la funci´on iesimoDigito :: Integer ->Integer ->Integer que dado un n ∈ Z mayor o igual
a 0 y un i ∈ Z mayor o igual a 1 menor o igual a la cantidad de d´ıgitos de n, devuelve el i-´esimo d´ıgito de n.
problema iesimoDigito (n: Z, i: Z) : Z {
requiere: { n ≥ 0 ∧ 1 ≤ i ≤ cantDigitos(n) }
asegura: { resultado = (n div 10cantDigitos(n)−i
) mod 10 }
}-}                 

cantDigitos::Integer->Integer
cantDigitos n|0<=n && n<10 =1
             |n>=10 = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i|i==1 = n 
                |i>1 && i<=cantDigitos n = mod (div n (10^(i-1))) 10


{-Ejercicio 9. Especificar e implementar una funci´on esCapicua :: Integer ->Bool que dado n ∈ N≥0 determina si n es
un n´umero capic´ua.
problema capicua (n:Z):Bool{
    asegura:{True}
    requiere:{resultado=true si primerosNDigitos==ultimosNDigitos}
}
problema primerosNDigitos (n:Z):Z{
    requiere:{true}
    asegura:{resultado devolvera los primeros cantDigitos(n) digitos si mod cantDigitos(n) 2 == 0}
    asegura:{resultado devolvera los primeros cantDigitos(n)-1 digitos si mod cantDigitos(n) 2 /= 0}
}
problema ultimosNDigitos (n:Z):Z{
    requiere:{true}
    asegura:{resultado devolvera los ultimos cantDigitos(n) digitos si mod cantDigitos(n) 2 == 0}
    asegura:{resultado devolvera los ultimos cantDigitos(n)-1 digitos si mod cantDigitos(n) 2 /= 0}
}

-}

primerDigitoN::Integer->Integer
primerDigitoN n= div n (10^(cantDigitos n-1))

sacarPrimerDigito::Integer->Integer
sacarPrimerDigito n= mod n (10^(cantDigitos n-1))

sacarUltimoDigito::Integer->Integer
sacarUltimoDigito n= div n 10

ultimoDigitoN::Integer->Integer
ultimoDigitoN n= mod n 10

esCapicua::Integer->Bool
esCapicua n| n<10 = True
           | primerDigitoN n == ultimoDigitoN n = esCapicua num
           | otherwise = False
           where num = sacarUltimoDigito (sacarPrimerDigito n)



--ej10 a)

{-
problema f1(x:N+{0}):N{
    requiere:{x>=0}
    asegura:{res [2^(i+1)]-1}
}
-}

f1::Integer->Integer
f1 n|n>=0 && n<1 = 1
    |n>=1 = 2^n+f1 (n-1)

--ej10 b)

{-
problema f1(x:N+{0}):N{
    requiere:{x>=0}
    asegura:{res [2^(i+1)]-1}
}
-}

f2::Integer->Float->Float
f2 n q|n==1 = q
      |n>1 = q^n+f2 (n-1) q

--ej10 c)

f3::Integer->Float->Float
f3 n q|n==0 = 0
      |n>=1 = f2 (2*n) q

--ej10 d)

f4::Integer->Float->Float
f4 n q|n==0 = 1
      |n>=1 = f2 (2*n) q - f2 (n-1) q 

--ej11 a) & b)

factorial::Float->Float
factorial 0=1
factorial n= n*factorial(n-1)


eAprox::Integer->Float
eAprox 0=1
eAprox n= 1/factorial (fromIntegral n) + eAprox (n-1)

e::Float
e= eAprox 10

--ej12

sucesion12::Float->Float
sucesion12 1=2
sucesion12 n= 2 + (1/sucesion12 (n-1))

raizDe2Aprox::Integer->Float
raizDe2Aprox n= sucesion12 (fromIntegral n) -1

--ej13

{-problema dobleSumaDePotencias(n,m:Z):Z{
    requiere:{n>=1}
    requiere:{m>=1}
    asegura:{res= *sumatorias*}

-}
sumatoria::Integer->Integer->Integer
sumatoria j i|j==1 = i
             |j>1 = i^j+ sumatoria (j-1) i

dobleSumaDePotencias:: Integer->Integer->Integer
dobleSumaDePotencias n m|n==0 = 0
                        |n>=1 && m>=1 = sumatoria m n + dobleSumaDePotencias (n-1) m

--ej14

sumaPotencias :: Integer ->Integer ->Integer ->Integer
sumaPotencias q 0 0 = 0
sumaPotencias q 0 m = q^m
sumaPotencias q n 0 = q^n
sumaPotencias q n m = q^(n+m) + sumaPotencias q (n-1) (m-1)

--ej15

sumatoriaPQ1::Integer->Integer->Float
sumatoriaPQ1 p 1= fromIntegral p
sumatoriaPQ1 p q= fromIntegral p/fromIntegral q + sumatoriaPQ1 p (q-1)

sumatoriaPQ2::Integer->Integer->Float
sumatoriaPQ2 1 q= sumatoriaPQ1 1 q
sumatoriaPQ2 p q= sumatoriaPQ1 p q + sumatoriaPQ2 (p-1) q
--ej16 a)
{-mplementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado
como par´ametro-}
menorDivisorDesde::Integer->Integer->Integer
menorDivisorDesde d n| mod n d ==0 = d
                     | otherwise = menorDivisorDesde(d+1) n


menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorDesde 2 n

--ej16 b) 

esPrimo:: Integer->Bool
esPrimo n= (menorDivisor n)== n

listaPrimos::Integer->[Integer]
listaPrimos n| n==1 = []
             | esPrimo n==True = (n:(listaPrimos (n-1)))
             | otherwise = listaPrimos (n-1)

--ej16 c)

divisible::Integer->Integer->Bool
divisible a b= mod a b == 0
sonCoprimos::Integer->Integer->Bool
sonCoprimos 1 _ = False
sonCoprimos _ 1 = False
sonCoprimos a b= not(divisible a b) && not(divisible b a)


primoN::Integer->Integer->Integer
primoN a n| n==0 = a-1
          |esPrimo a = primoN (a+1) (n-1)
          |otherwise = primoN (a+1) n

nEsimoPrimo :: Integer ->Integer
nEsimoPrimo 1=2
nEsimoPrimo n= primoN 2 n

--ej17

fibonacci::Integer->Integer
fibonacci n| n==0 =0
           |n==1 =1
           | n>0 = fibonacci(n-1)+fibonacci(n-2)

esFibo::Integer->Integer->Bool
esFibo a n |fibonacci a > n = False
esFibo a n | otherwise =fibonacci a == n || esFibo (a+1) n

esFibonacci :: Integer ->Bool
esFibonacci n= esFibo 0 n

--ej18
{- esPar::Integer->Bool
esPar n= mod n 2==0

esMDP :: Integer ->Integer->Bool
esMDP n a | esPar n && esPar a && a<10 && mod a 10<mod n 10 = True
                   | esPar n && esPar a && a<10 && mod a 10>mod n 10 = False
                   | esPar n && esPar a && (mod n 10)> mod a 10 = esMDP n (div a 10)
                   | esPar n && esPar a==False = esMDP n (div a 10)
                   | otherwise = False

mayorDigitoPar::Integer->Integer
mayorDigitoPar n| n<10 && esPar n ==False= -1
                | esMDP n (div n 10) = n
                | otherwise = mayorDigitoPar (div n 10)
-}

--ej19

sumaMPrimos::Integer->Integer
sumaMPrimos 1 = 2
sumaMPrimos m = nEsimoPrimo m + sumaMPrimos (m-1)

esSIDP::Integer->Integer->Bool
esSIDP n a | n< sumaMPrimos a = False
esSIDP n a | n== sumaMPrimos a = True
esSIDP n a | otherwise =esSIDP n (a+1)
esSumaInicialDePrimos :: Integer ->Bool 
esSumaInicialDePrimos n = esSIDP n 1

--ej20

esDivisible::Int->Int->Int
esDivisible n a | a==n = n
                | (mod n a) ==0 = a + esDivisible n (a+1)
                | otherwise = esDivisible n (a+1)


sumaDivisores::Int->Int
sumaDivisores n= esDivisible n 1

comparar::Int->Int->Bool
comparar a b | sumaDivisores a == sumaDivisores b && a==b = True
             | sumaDivisores a > sumaDivisores b = comparar a (b-1)
             | otherwise = False


tomaValorMax :: Int ->Int ->Int
tomaValorMax n1 n2 | n1==n2 = n1 
                   | n1>=1 && n2>=n1 && comparar n1 n2 = n1
                   | otherwise = tomaValorMax (n1+1) n2

--ej21
{-
problema pitagoras (m,n,r:R):R{
    requiere:{m,n,r >=0}
    asegura:{res = cuantos (p,q): 0<=p<=m y 0<=q<=n cumplen subPitagoras}

problema subPitagoras (m,n,r:R):Bool{
    requiere: {True}
    asegura: {res=True si p^2+q^2<=r^2}
}
}
-}

subPitagoras::Integer->Integer->Integer->Bool
subPitagoras p q r= ((p^2)+(q^2)) <= (r^2)

cumplenSP::Integer->Integer->Integer->Integer
cumplenSP m n r| m==(-1) = 0
               | subPitagoras m n r = 1 + cumplenSP (m-1) n r
               | otherwise = cumplenSP (m-1) n r
pitagoras :: Integer ->Integer ->Integer->Integer
pitagoras m (-1) r = 0
pitagoras m n r = cumplenSP m n r + pitagoras m (n-1) r
