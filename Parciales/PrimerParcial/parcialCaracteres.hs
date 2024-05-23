module ParcialCaracteres where

--EJ1

cantApariciones::(Eq t)=>t->[t]->Int
cantApariciones t [] = 0 
cantApariciones t (x:xs) | t==x = 1 + cantApariciones t xs
                         | otherwise = cantApariciones t xs

cantMinusculaAux::[Char]->[Char]->Int
cantMinusculaAux msj [a] = cantApariciones a msj
cantMinusculaAux msj abc = cantApariciones (head abc) msj + cantMinusculaAux msj (tail abc)

cantMinuscula::String->Int
cantMinuscula msj = cantMinusculaAux msj ['a'..'z']

--EJ2

maximoCambios::[String]->String
maximoCambios [x] = x
maximoCambios (x:xs) | cantMinuscula x >= cantMinuscula (head xs) = maximoCambios (x:tail xs)
                     | otherwise = maximoCambios xs

--EJ3

numeroDeElem::(Eq t)=>t->[t]->Int
numeroDeElem letra [x] | letra==x = 1
                       | otherwise = 0
numeroDeElem letra (x:xs) | letra == x = 1
                          | otherwise = 1 + numeroDeElem letra xs
 
elementoN::(Eq t)=>Int->[t]->t
elementoN 1 list = head list
elementoN n list = elementoN (n-1) (tail list) 

desplazarAux::Char->Int->Char
desplazarAux x n | (numeroDeElem x ['a'..'z'] + n)<=26 = elementoN (numeroDeElem x ['a'..'z'] + n) ['a'..'z']
                 | otherwise = desplazarAux x (n-26)

desplazar::Char->Int->Char
desplazar x _ | cantApariciones x ['a'..'z'] == 0 = x
desplazar x n | 0<=n && n<=25 = desplazarAux x n
              | otherwise = desplazarAux x (26+n)

--EJ4

esMinuscula::Char->[Char]-> Bool
esMinuscula l [x] = l==x
esMinuscula l (x:xs) | l==x = True
                     | otherwise = esMinuscula l xs

codificarAux::[Char]->Int->[Char]
codificarAux [] _ = []
codificarAux (x:xs) n | esMinuscula x ['a'..'z'] = desplazar x n:codificarAux xs n 
                      | otherwise = x:codificarAux xs n 

codificar::String->Int->String
codificar mensaje num = codificarAux mensaje num

decodificar::String->Int->String
decodificar mensaje num = codificarAux mensaje (26-num)