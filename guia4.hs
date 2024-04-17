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