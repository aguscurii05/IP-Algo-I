module Simulacro2_0 where

--Ejercicio 1

tuplaNoValida::(String,String)->(String,String)->Bool
tuplaNoValida (a,b) (c,d) = a==b || ((a==c && b==d) || (a==d && b==c))

relacionesValidas::[(String,String)]->Bool
relacionesValidas [] = True
relacionesValidas [x] = (fst x)/=(snd x)
relacionesValidas (x:xs) =validas x xs && relacionesValidas xs 
    where validas y [x]  = not(tuplaNoValida y x)
          validas y (x:xs)= not(tuplaNoValida y x) && validas y xs

--Ejercicio 2

personasAux::[(String,String)]->[String]
personasAux [] = []
personasAux (x:xs) = (desarmar x)++(personasAux xs)
    where desarmar (x,y) = [x,y]

quitar::(Eq t)=>t->[t]->[t]
quitar t [] = []
quitar t (x:xs) | x==t = quitar t xs
                | otherwise = x:quitar t xs

sinRepetidos::(Eq t )=>[t]->[t]
sinRepetidos [] = []
sinRepetidos (x:xs) = sinRepetidos (quitar x xs)++[x]

personas::[(String,String)]->[String]
personas lista = sinRepetidos ( personasAux lista)

--Ejercicio 3

amigosDe::String->[(String,String)]->[String]
amigosDe _ [] = []
amigosDe per (x:xs) |  per== fst x = snd x:amigosDe per xs
                    | per== snd x = fst x:amigosDe per xs
                    | otherwise = amigosDe per xs


--Ejercicio 4

cantRepetidos::String->[String]->Integer
cantRepetidos per [] = 0 
cantRepetidos per (x:xs) | per==x = 1 + cantRepetidos per xs
                         | otherwise = cantRepetidos per xs

personaConMasAmigosAux::[String]->String
personaConMasAmigosAux [x] = x
personaConMasAmigosAux (x:xs) | cantRepetidos x (x:xs)>=cantRepetidos (head xs) (x:xs) = personaConMasAmigosAux (x:tail xs)
                                  | otherwise = personaConMasAmigosAux xs

personaConMasAmigos::[(String,String)]->String
personaConMasAmigos rel = personaConMasAmigosAux (personasAux rel)
