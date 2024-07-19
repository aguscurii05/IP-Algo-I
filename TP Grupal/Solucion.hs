module Solucion where
 
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: {MSMA}
-- Integrante1: { 45927631,Agustin Stescovich Curi}
-- Integrante2: { 45725893,Sofia Victoria Adra}
-- Integrante3: { 43988000,Mateo Francisco Carracedo}
-- Integrante4: { 43816377,Milton Gabriel Cruz}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
                        -- integrante, completar con los dni y apellidos, sino dejar vacío}

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula c = (ord c >= ord 'a') && (ord c <= ord 'z')

-- EJ 2
letraANatural :: Char -> Int
letraANatural c = ord c - 97

-- EJ 3
desplazar :: Char -> Int -> Char 
desplazar c n 
 | not (esMinuscula c) = c
 |ord(c) + n > 122 = desplazar c (n - 26)
 |ord(c) + n < 97 = desplazar c (n + 26)
 | otherwise = chr (ord c + n)

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] _ = [] 
cifrar (x:xs) n 
 |esMinuscula x = desplazar x n : cifrar xs n 
 |otherwise= x: cifrar xs n 

-- EJ 5
descifrar :: String -> Int -> String
descifrar xs n = cifrar xs (-n)

-- EJ 6

cifrarListaDesde :: [String] -> Int -> [String]
cifrarListaDesde [] _ = [] 
cifrarListaDesde (x:xs) n = cifrar x n : cifrarListaDesde xs (n+1) 

cifrarLista :: [String] -> [String]
cifrarLista xs = cifrarListaDesde xs 0 

-- EJ 7

frecuencia :: String -> [Float]
frecuencia xs = frecuenciaDesde xs 97 

--frecuencia empieza desde 97 y termina en 122 debido a que la funcion recorre todos los caracteres desde 'a' hasta la 'z'segun el codigo ASCII

frecuenciaDesde :: String -> Int -> [Float]
frecuenciaDesde _ 123 = [] 
frecuenciaDesde xs n 
 |elem (chr n) xs = porcentaje (chr n) xs : frecuenciaDesde xs (n+1) 
 |otherwise = 0.0 : frecuenciaDesde xs (n+1) 

porcentaje :: Char-> String -> Float
porcentaje n xs = 100 * cantApariciones n xs /cantMinusculas xs

cantApariciones :: Char -> String -> Float 
cantApariciones _ [] = 0 
cantApariciones c (x:xs) 
 |c==x = 1 + cantApariciones c xs 
 |otherwise = cantApariciones c xs 

cantMinusculas :: String -> Float 
cantMinusculas [] = 0 
cantMinusculas (x:xs)
 |esMinuscula x = 1 + cantMinusculas xs 
 |otherwise = cantMinusculas xs 

-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente xs n = (desplazarMasFrecuente xs n , maximo (frecuencia xs))

desplazarMasFrecuente :: String -> Int -> Char 
desplazarMasFrecuente (x:xs) n 
 |esMinuscula x && porcentaje x (x:xs) >= maximo (frecuencia (x:xs)) = desplazar x n 
 | otherwise = desplazarMasFrecuente xs n 

maximo :: [Float] -> Float 
maximo [x] = x 
maximo (x:xs) 
 | x >= maximo xs = x 
 | otherwise = maximo xs 


-- EJ 9
esDescifradoDesde :: String -> String -> Int -> Bool
esDescifradoDesde xs ys n
 | n == 26 && xs /= ys = False 
 | cifrar xs n == ys = True 
 | otherwise = esDescifradoDesde xs ys (n+1) 

esDescifrado :: String -> String -> Bool
esDescifrado xs ys = esDescifradoDesde xs ys 0

-- EJ 10
{-Observación: nos encontramos con la duda acerca del caso en el que hay una palabra que no contiene ninguna letra minúscula.
Para este caso, nos remontamos a la especificación de la función "desplazar".  Aunque en el primer asegura de dicha función 
indica que al recibir una letra no minúscula se devuelva la misma, pudiéndose interpretar esto tanto como no desplazarla como 
por desplazarla 0 posiciones, o 26 posiciones o cualquiera de sus múltiplos enteros que dejen todas las letras en su lugar. 
Ante esta ambigüedad propia de un lenguaje de especificación informal y ante la imposibilidad de validarla contra el problema 
real que se quiere resolver, optamos por la segunda interpretación.-}

todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = [] 
todosLosDescifrados (x:xs) 
 |noPalabraMinuscula x = (x,x) : paresDescifrados x xs ++ todosLosDescifrados xs 
 |otherwise = paresDescifrados x xs ++ todosLosDescifrados xs 

noPalabraMinuscula :: String -> Bool --determina si un String tiene todos caracteres que no son minuscula
noPalabraMinuscula "" = True 
noPalabraMinuscula (x:xs) = not(esMinuscula x) && noPalabraMinuscula xs 

paresDescifrados :: String -> [String] -> [(String,String)] 
paresDescifrados _ [] = [] 
paresDescifrados x (y:ys)
 | esDescifrado x y = (x,y) : (y,x) : paresDescifrados x ys 
 | otherwise = paresDescifrados x ys 

--paresDescifrados devuelve la lista de tuplas de pares descifrados para un String
 
-- EJ 11

iesimoElem::String->Int->Char 
iesimoElem (x:xs) 0 = x
iesimoElem (x:xs) n = iesimoElem xs (n-1)

expandirClaveDesde :: String->Int->Int->String
expandirClaveDesde xs n m
 | n == m = []
 |  otherwise = iesimoElem xs (mod n (length xs)) : expandirClaveDesde xs (n+1) m 

expandirClave :: String -> Int -> String 
expandirClave xs m = expandirClaveDesde xs 0 m



-- EJ 12
cifrarVigenereAux::String->String->String
cifrarVigenereAux [] _ = []
cifrarVigenereAux (x:xs) (y:ys) = desplazar x (ord y -97) : cifrarVigenereAux xs ys 

cifrarVigenere :: String -> String -> String
cifrarVigenere s clave = cifrarVigenereAux s (expandirClave clave (length s))

-- EJ 13

descifrarVigenereAux::String->String->String
descifrarVigenereAux [] _ = []
descifrarVigenereAux (x:xs) (y:ys) = desplazar x (97 - ord y)  : descifrarVigenereAux xs ys 

descifrarVigenere :: String -> String -> String
descifrarVigenere s clave = descifrarVigenereAux s (expandirClave clave (length s))

-- EJ 14
absoluto::Int->Int
absoluto x| x>=0 = x
          | otherwise = -x


--distanciaCifrado funciona con la clave cifrada

distanciaCifrado :: String -> String ->Int
distanciaCifrado [] [] = 0
distanciaCifrado (x:xs) (y:ys) = absoluto (( letraANatural x) - (letraANatural y)) + distanciaCifrado xs ys



peorCifrado :: String -> [String] -> String
peorCifrado _ [x] = x
peorCifrado s (x:xs)
 | distanciaCifrado s (cifrarVigenere s x) <= distanciaCifrado s (cifrarVigenere s (peorCifrado s (xs))) = x 
 | otherwise = peorCifrado s xs

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere [] _ _ = []
combinacionesVigenere (m:ms) claves cifrado = combinacion m claves cifrado ++ combinacionesVigenere ms claves cifrado

combinacion :: String -> [String] -> String -> [(String,String)]
combinacion _ [] _ = []
combinacion msj (x:xs) cifrado 
 |cifrarVigenere msj x == cifrado = (msj,x) : combinacion msj xs cifrado
 | otherwise = combinacion msj xs cifrado
