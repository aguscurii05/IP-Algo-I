module Guia5 where

--ej1.1
longitud::[t]->Integer
longitud []= 0
longitud (x:xs)= 1+ longitud (tail (x:xs))


--ej1.2
elementoN::[t]->Integer->t
elementoN (x:xs) 1= x
elementoN (x:xs) n= elementoN xs (n-1)

ultimo:: [t]->t
ultimo (x:xs) = elementoN (x:xs) (longitud(x:xs))

--ej1.3

principio::[t]->[t]
principio [x]= []
principio (x:xs) = (x:principio xs)

--ej1.4

reverso::[t]->[t]
reverso [x]= [x]
reverso (x:xs)= (ultimo(x:xs):reverso (principio(x:xs)))

--ej2.1

pertenece::(Eq t)=>t->[t]->Bool
pertenece _ [] = False
pertenece a (x:xs) = a == x || pertenece a xs

--ej2.2

todosIguales::(Eq t)=>[t]->Bool
todosIguales [x] = True
todosIguales (x:xs) = x==head xs && todosIguales (x:tail(xs))

--ej2.4

hayRepetidos::(Eq t)=>[t]->Bool
hayRepetidos (x:xs)| longitud (x:xs)<=1 =False
                   | x==head xs || hayRepetidos (x:tail(xs)) = True
                   | otherwise = hayRepetidos xs

--ej2.3

todosDistintos::(Eq t)=>[t]->Bool
todosDistintos (x:xs) = not(hayRepetidos (x:xs))

--ej2.5

quitar :: (Eq t) => t -> [t] -> [t]
quitar a (x:xs)| not(pertenece a (x:xs))= (x:xs)
               |a==x = xs
               | otherwise= (x:quitar a xs)

--ej2.6

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos a (x:xs) | not(pertenece a (x:xs))= (x:xs)
                     | otherwise = quitarTodos a (quitar a (x:xs))

--ej2.7

elementoRepetido::(Eq t)=>t->[t]->Bool
elementoRepetido a [x] = False
elementoRepetido a (x:xs) = (pertenece a [x] && pertenece a xs) || elementoRepetido a xs

tieneRepes::(Eq t)=>[t]->Bool
tieneRepes [] = False
tieneRepes (x:xs) = elementoRepetido x (x:xs) || tieneRepes xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos []=[]
eliminarRepetidos (x:xs) | not(tieneRepes (x:xs)) = (x:xs)
                         | tieneRepes (x:xs) && elementoRepetido x (x:xs) = [x]++(eliminarRepetidos (quitarTodos x (x:xs)))
                         | otherwise = [x]++eliminarRepetidos xs

--ej2.8

mismosElementos::(Eq t)=>[t] ->[t]->Bool
mismosElementos _ [] = False
mismosElementos [] _= False
mismosElementos [x] [y] = x==y
mismosElementos (x:xs) (y:ys)= pertenece x (eliminarRepetidos (y:ys))  && mismosElementos xs (quitar x (y:ys))

--ej2.9

reverso2::(Eq t)=>[t]->[t]
reverso2 [x]=[x]
reverso2 (x:xs) = reverso xs++[x]

capicua::(Eq t)=>[t]->Bool
capicua []= True
capicua x = reverso x == x

--ej3.1

--uso la funcion longitud ya definida
--uso la funcion principio ya definida

elementoNum::[Integer]->Integer->Integer
elementoNum (x:xs) 1= x
elementoNum (x:xs) n= elementoNum xs (n-1)

sumatoria::[Integer]->Integer
sumatoria [] = 0
sumatoria seq = elementoNum seq (longitud seq) + sumatoria (principio seq)

--ej3.2

productoria::[Integer]->Integer
productoria [x] = x
productoria seq = elementoNum seq (longitud seq) * productoria (principio seq)

--ej3.3

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x>=head xs = maximo (x:tail xs)
              | otherwise = maximo xs

--ej3.4

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x+n]
sumarN n (x:xs) = (x+n):sumarN n xs

--ej3.5

sumarElPrimero :: [Integer] -> [Integer] 
sumarElPrimero (x:xs) = sumarN x (x:xs)

--ej3.6

sumarElUltimo :: [Integer] -> [Integer] 
sumarElUltimo seq = sumarN (ultimo seq) seq

--ej3.7

pares :: [Integer] -> [Integer]
pares [x] | mod x 2==0 = [x]
          | otherwise = []
pares (x:xs) | mod x 2 == 0 = x: pares (xs)
             | otherwise = pares xs

--ej3.8

esMultN::Integer->Integer->Bool
esMultN x n = mod x n==0

multiplosDeN::Integer->[Integer]->[Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | esMultN x n = x:multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

--ej3.9 
--uso la f reverso2
eliminarPrimerN::Integer->[Integer]->[Integer]
eliminarPrimerN n []= []
eliminarPrimerN n (x:xs) | n==x = xs
                  | otherwise = [x]++eliminarPrimerN n xs

subOrdenar::[Integer]->[Integer]
subOrdenar [x] = [x]
subOrdenar l = maximo l:subOrdenar(eliminarPrimerN (maximo l) l)

ordenar::[Integer]->[Integer]
ordenar n= reverso2 (subOrdenar n)

--ej4a)

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [x]= [x]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs) | x==' ' && x==head xs = sacarBlancosRepetidos (x:tail xs)
                             | otherwise = x:sacarBlancosRepetidos xs

--ej4b)

contarBlancos::[Char]->Integer
contarBlancos "" = 0
contarBlancos [x] | x==' ' = 1
                  | otherwise = 0
contarBlancos (x:xs) | x==' ' = 1 + contarBlancos xs
                     | otherwise = contarBlancos xs

contarPalabras :: [Char] -> Integer
contarPalabras "" = 0
contarPalabras text | head text==' '= contarPalabras (tail text)
                    | ultimo text== ' '= contarBlancos(sacarBlancosRepetidos text)
                    | otherwise = contarBlancos(sacarBlancosRepetidos text) + 1

--ej4c)
sacarBlancosDemas::[Char]->[Char]
sacarBlancosDemas [] = ""
sacarBlancosDemas [' '] = ""
sacarBlancosDemas (x:xs) | x==' ' = sacarBlancosDemas xs
                         | ultimo (x:xs)==' ' = sacarBlancosDemas(principio (x:xs))
                         | otherwise = (x:xs)


separaPalabras::[Char]->[Char]
separaPalabras (x:xs) | x/=' ' = x:separaPalabras xs
                      | otherwise = []
restoOracion::[Char]->[Char]->[Char]
restoOracion "" (y:ys) = (y:ys)
restoOracion (y:ys) (x:xs)| y==x = restoOracion ys xs
                          | y/=x = (x:xs)

palabras :: [Char] -> [[Char]]
palabras oracion | contarPalabras (sacarBlancosDemas oracion)==0 = []
palabras oracion | contarPalabras (sacarBlancosDemas oracion)==1 = [sacarBlancosDemas oracion]
palabras oracion = separaPalabras (sacarBlancosDemas oracion):palabras(restoOracion (separaPalabras (sacarBlancosDemas oracion)) (sacarBlancosDemas oracion))

--ej4d)

contarLetras::[Char]->Integer
contarLetras [] = 0
contarLetras (x:xs) = 1+ contarLetras xs

palabraN::(Eq t)=>[[t]]->Integer->[t]
palabraN pal n | n> longitud pal = []
palabraN (x:xs) 1= x
palabraN (x:xs) n= palabraN xs (n-1)

contarLetrasPalabraN::[Char]->Integer->Integer
contarLetrasPalabraN oracion n = contarLetras (palabraN (palabras oracion) n)

palabraMasLarga2 :: [Char]-> [[Char]]->[Char]
palabraMasLarga2 pal oracion| longitud oracion ==1 && contarLetras pal >= contarLetras (head oracion) = pal
                           | longitud oracion ==1 && contarLetras pal < contarLetras (head oracion) = head oracion
                           |contarLetras pal >= contarLetras (head oracion) = palabraMasLarga2 pal (tail oracion)
                           | otherwise = palabraMasLarga2 (head oracion) (tail(oracion))

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga oracion | palabras oracion == [] = []
palabraMasLarga oracion = palabraMasLarga2 (head (palabras oracion)) (palabras oracion)

