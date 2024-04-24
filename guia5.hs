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
quitarTodos a (x:xs) | not(pertenece a (x:xs))= (x:xs)
                     | otherwise = quitarTodos a (quitar a (x:xs))

--ej2.7

elementoRepetido::(Eq t)=>t->[t]->Bool
elementoRepetido a [x] = False
elementoRepetido a (x:xs) = (pertenece a [x] && pertenece a xs) || elementoRepetido a xs
