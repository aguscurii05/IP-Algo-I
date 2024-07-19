module Guia5_1 where

--EJ1

longitud::(Eq t)=>[t]->Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo::(Eq t) =>[t]->t
ultimo [x] = x
ultimo (x:xs)= ultimo xs

principio::(Eq t) =>[t]->[t]
principio [x] = [x]
principio [x,y] = [x]
principio (x:xs)= x: principio xs

reverso::(Eq t)=>[t]->[t]
reverso [] = []
reverso (x:xs) = reverso xs++[x]

--EJ2

pertenece::(Eq t)=>t->[t]->Bool
pertenece _ [] = False
pertenece elem (x:xs) | elem==x = True
                      | otherwise = pertenece elem xs


todosIguales::(Eq t)=>[t]->Bool
todosIguales [x] = True
todosIguales (x:xs) = x==head xs && todosIguales xs

todosDistintos::(Eq t)=>[t]->Bool
todosDistintos [x] = True
todosDistintos (x:xs) = x/=head xs && todosDistintos (x:tail xs) && todosDistintos xs

hayRepetidos::(Eq t)=>[t]->Bool
hayRepetidos lista = not(todosDistintos lista)

quitar :: (Eq t) => t -> [t] -> [t]
quitar l [] = []
quitar l (x:xs) | l==x = xs
                | otherwise = x:quitar l xs

quitarTodos:: (Eq t) => t -> [t] -> [t]
quitarTodos l [] = []
quitarTodos l lista | not(pertenece l lista) = lista
                    | otherwise = quitarTodos l (quitar l lista)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | not(hayRepetidos (x:xs)) = x:xs
                         | otherwise =  x:eliminarRepetidos (quitarTodos x (x:xs))

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [x] (y:ys) = pertenece x (eliminarRepetidos(y:ys))
mismosElementos (x:xs) (y:ys) = pertenece x (eliminarRepetidos(y:ys)) && mismosElementos xs (y:ys)

capicua :: (Eq t) => [t] -> Bool 
capicua lista = lista==reverso lista

--EJ3

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x>= head xs = maximo (x:tail xs)
              | otherwise = maximo xs

sumarN::Integer->[Integer]->[Integer]
sumarN n [] = []
sumarN n (x:xs) = (x+n):sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

pares :: [Integer] -> [Integer]
pares []  = []
pares (x:xs) | mod x 2== 0 =  x : pares xs
             | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ []  = []
multiplosDeN 0 lista | pertenece 0 lista = [0]
                     | otherwise = []
multiplosDeN n (x:xs) | mod x n== 0 =  x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

ordenar::[Integer]->[Integer]
ordenar [] = []
ordenar lista =  ordenar(quitar (maximo lista) lista)++[maximo lista]

--EJ4

eliminarBlancosRepetidos::[Char]->[Char]
eliminarBlancosRepetidos [] = []
eliminarBlancosRepetidos [' '] = [' ']
eliminarBlancosRepetidos (x:xs) | x==' ' && head xs== ' ' = eliminarBlancosRepetidos xs
                                | otherwise = x:eliminarBlancosRepetidos xs

sacarBlancosDemas::[Char]->[Char]
sacarBlancosDemas [] = []
sacarBlancosDemas (x:xs) | x==' ' = sacarBlancosDemas xs
                         | ultimo (x:xs) == ' ' = sacarBlancosDemas (principio (x:xs))
                         | otherwise = (x:xs)

contarBlancos::[Char]->Integer
contarBlancos [] = 0
contarBlancos [x] = 1
contarBlancos (x:xs) | x/= ' ' = contarBlancos xs
                      | otherwise = 1 + contarBlancos xs

contarPalabras::[Char]->Integer
contarPalabras cad= contarBlancos (sacarBlancosDemas (eliminarBlancosRepetidos cad))

primerPalabra :: [Char] -> [Char]
primerPalabra [] = []
primerPalabra (x:xs) | x/=' '= x:primerPalabra xs
                     | otherwise = []

l::[Char]->[Char]
l msj = sacarBlancosDemas (eliminarBlancosRepetidos msj)

eliminarPalabra::[Char] -> [Char] ->[Char]
eliminarPalabra [] cad = cad
eliminarPalabra pal cad | head pal == head cad = eliminarPalabra (tail pal) (tail cad)
                        | otherwise = cad

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras msj = primerPalabra (l msj):palabras (eliminarPalabra (primerPalabra (l msj)) (l msj))

palabraMasLargaAux::[[Char]] ->[Char]
palabraMasLargaAux [] = []
palabraMasLargaAux [x] = x
palabraMasLargaAux (x:xs) | longitud x>=longitud (head xs) = palabraMasLargaAux (x:tail xs)
                          | otherwise = palabraMasLargaAux xs

palabraMasLarga::[Char]->[Char]
palabraMasLarga msj = palabraMasLargaAux (palabras msj)

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x++aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs) = sacarBlancosDemas(x++" "++aplanarConBlancos xs)

insertarNBlancos::Integer->[Char]->[Char]
insertarNBlancos 0 cad = cad
insertarNBlancos n cad = insertarNBlancos (n-1) (cad++" ")

aplanarConNBlancos :: Integer->[[Char]] -> [Char]
aplanarConNBlancos _ [] = []
aplanarConNBlancos n (x:xs) = sacarBlancosDemas((insertarNBlancos n x)++aplanarConNBlancos n xs)