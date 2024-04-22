import Data.Binary.Get (Decoder(Fail))
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

<<<<<<< HEAD
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

>>>>>>> a1ac615faf880e7203db762063eba4284cd07ac0
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


--ej16 a)
{-mplementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado
como par´ametro-}
menorDivisorDesde::Int->Int->Int
menorDivisorDesde d n| mod n d ==0 = d
                     | otherwise = menorDivisorDesde(d+1) n


menorDivisor :: Int ->Int
menorDivisor n = menorDivisorDesde 2 n


