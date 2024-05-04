module Parcial2023 where



equiposValidos:: [(String,String)]->Bool
equiposValidos [(x1,x2)] = True
equiposValidos [(x1,x2),(y1,y2)] = x1/=y1 && x1/=y2 && x2/=y2
equiposValidos ((x1,x2):(y1,y2):xs) = (x1/=y1 && x1/=y2) && x2/=y2 && equiposValidos ((x1,x2):xs) && equiposValidos ((y1,y2):xs)

sumatoria::[Integer]->Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

atajaronSuplentes::[(String,String)]->[Integer]->Integer->Integer
atajaronSuplentes [] [] totGoles = totGoles
atajaronSuplentes arquerosPorEquipo goles totGoles = totGoles -sumatoria goles

posicionDeN::(Eq t)=>t->[(t,t)]->Integer
posicionDeN n ((x1,x2):xs) | n==x2 = 1
                               | otherwise = 1 + posicionDeN n xs

posicionDeN2::(Eq t)=>t->[t]->Integer
posicionDeN2 n (x:xs) | n==x = 1
                               | otherwise = 1 + posicionDeN2 n xs

    

elementoN::(Eq t)=>Integer->[t]->t
elementoN n (x:xs)| n==1 = x
                  | otherwise = elementoN (n-1) (xs)



porcentajeDeGoles::String->[(String,String)]->[Integer]->Float
porcentajeDeGoles arquero arquerosPorEquipo goles = 100* (fromIntegral (elementoN (posicionDeN arquero arquerosPorEquipo) goles) / fromIntegral (sumatoria goles))

menorElemento::[Integer]->Integer
menorElemento [x] =x
menorElemento [x,y] | x<=y = x
                    | otherwise = y
menorElemento (x:xs) | x<= head xs = menorElemento (x:tail xs)

vallaMenosVencida::[(String,String)]->[Integer]->String
vallaMenosVencida arquerosPorEquipo goles = snd(elementoN (posicionDeN2 (menorElemento goles) goles) arquerosPorEquipo)
