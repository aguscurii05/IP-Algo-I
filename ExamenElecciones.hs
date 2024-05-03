module ExamenElecciones where

mismaFormula::[(String,String)]->Bool
mismaFormula [] = False
mismaFormula [(x,y)] = x==y
mismaFormula ((x,y):xs) = x==y || mismaFormula xs

distintaFormula::[(String,String)]->Bool
distintaFormula [(a,b),(c,d)] = (a==c || a==d) || (b==c || b==d)
distintaFormula ((a,b):(c,d):xs) = ((a==c || a==d) || (b==c || b==d)) || distintaFormula ((a,b):xs)

formulasInvalidas::[(String,String)]->Bool
formulasInvalidas [(x,y)] = x==y
formulasInvalidas [(a,b),(c,d)] = (a==c || a==d) || (b==c || b==d) || a==b
formulasInvalidas formulas = (mismaFormula formulas || distintaFormula formulas) || formulasInvalidas (tail formulas)


sumatoria::[Int]->Int
sumatoria [x] = x
sumatoria (x:xs)= x + sumatoria xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotosAfirmativos::[(String,String)]->[Int]->Int->Float
porcentajeDeVotosAfirmativos formulas votos total = (division (sumatoria votos) total)*100

numeroDeElemento::String->[(String,String)]->Int
numeroDeElemento vice [(x,y)]= 1
numeroDeElemento vice ((x,y):xs) | vice==y = 1
                                 | otherwise = 1 + numeroDeElemento vice xs

elementoN::Int->[Int]->Int
elementoN 1 (x:xs) = x
elementoN n votos = elementoN (n-1) (tail votos)

elementoN2::Int->[(String,String)]->String
elementoN2 1 ((x,y):xs) = x
elementoN2 n formulas = elementoN2 (n-1) (tail formulas)

porcentajeVotos::String->[(String,String)]->[Int]->Float
porcentajeVotos vice formulas votos = 100*(division (elementoN (numeroDeElemento vice formulas) votos) (sumatoria votos))

numeroDeElemento2::Int->[Int]->Int
numeroDeElemento2 n [x] = 1
numeroDeElemento2 n (x:xs) | n==x = 1
                           | otherwise = 1 + numeroDeElemento2 n xs

subMenosVotado::[Int]->Int
subMenosVotado [x] = x
subMenosVotado [x,y]  | x<=y = x
                      | otherwise = y
subMenosVotado (x:xs) | x<= head xs = subMenosVotado (x:tail xs)
                      | otherwise = subMenosVotado xs

menosVotado::[(String,String)]->[Int]->String
menosVotado formulas votos = elementoN2 (numeroDeElemento2 (subMenosVotado votos) votos) formulas
