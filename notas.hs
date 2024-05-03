--char es un solo caracter con comilla simple ej: 'a'
--[Char]=String ['h','o','l','a']=="hola"

{-

pertenece:: t->[t]->Bool
pertenece [] --lista vacia
pertenece (x:[]) --lista de un unicoelemento
pertenece [x] --lista de un unicoelemento
pertenece (x:xs) --x es la cabeza e y es la cola
-}

--otra manera de hacer el ejercicio "ultimo"

ultimo::[t]->t
ultimo [x]= x
ultimo (x:xs)= ultimo xs

{-con un ++ se agrega un elemento al final de una lista
de esta manera se pueden construir listas con (:) y con (++)
-}