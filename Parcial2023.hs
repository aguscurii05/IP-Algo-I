module Parcial2023 where



equiposValidos:: [(String,String)]->Bool
equiposValidos [(x1,x2)] = True
equiposValidos [(x1,x2),(y1,y2)] = x1/=y1 && x1/=y2 && x2/=y2
equiposValidos ((x1,x2):(y1,y2):xs) = (x1/=y1 && x1/=y2) && x2/=y2 && equiposValidos ((x1,x2):xs) && equiposValidos ((y1,y2):xs)

jugadoresRepetidos:: [(String,String)]->Bool
jugadoresRepetidos [(x1,x2),(y1,y2)] = x2==y2
jugadoresRepetidos ((x1,x2):(y1,y2):xs) = x2==y2 || jugadoresRepetidos ((x1,x2):xs) || jugadoresRepetidos ((y1,y2):xs)
