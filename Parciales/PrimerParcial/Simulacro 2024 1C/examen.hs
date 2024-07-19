import System.Win32 (COORD(xPos))
tuplasIguales::(Eq t)=>(t,t)->(t,t)->Bool
tuplasIguales (a,b) (c,d) = (a==c && b==d) || (a==d && b==c)

rel::[(String,String)]->Bool
rel ((x,y):xs) | ((x,y):xs)==[] = False
               | ((x,y):xs)==[(x,y)] = True
               | not(tuplasIguales (x,y) (head xs)) = rel ((x,y):tail xs)
               | tuplasIguales (x,y) (head xs) = False

relacionesValidas::[(String,String)]->Bool
relacionesValidas [] = False
relacionesValidas [(x,y)] = True
relacionesValidas ((x,y):xs) = rel ((x,y):xs) && relacionesValidas xs



separar::[(String,String)]->[String]
separar [(x,y)] = [x]++[y]
separar ((x,y):xs) | relacionesValidas ((x,y):xs)== True = [x]++[y]++separar xs

hayRepetidos::[String]->Bool
hayRepetidos [x] = False
hayRepetidos (x:xs) = x== head xs || hayRepetidos (x:tail xs)

repetidos::[String]->Bool
repetidos [x] = False
repetidos (x:xs) = hayRepetidos (x:xs) || repetidos xs

quitar::[String]->[String]
quitar [x] = [x]
quitar (x:xs) | x==head xs = quitar xs
              | otherwise = (head xs:quitar (x: tail xs))

quitarTodos::[String]->[String]
quitarTodos (x:xs) |repetidos (x:xs) ==False = (x:xs)
quitarTodos (x:xs)= quitarTodos(quitar (x:xs))

personas::[(String,String)]->[String]
personas [] =["nadie"]
personas ((x,y):xs) = quitarTodos (separar ((x,y):xs))

amigosDe::String->[(String,String)]->[String]
amigosDe "nadie" [] = ["nadie"]
amigosDe p [(x,y)] | p==x = [y]
amigosDe p [(x,y)] | p==y = [x]
amigosDe p [(x,y)] | p/=x && p/=y = []
amigosDe p ((x,y):xs)| relacionesValidas ((x,y):xs)== True && (p==x) =(y:(amigosDe p xs ))
                     | relacionesValidas ((x,y):xs)== True && (p==y) =(x:(amigosDe p xs ))
                     | relacionesValidas ((x,y):xs)== True && (p/=x && p/=y)= amigosDe p xs 

--relaciones = [("juan","agus"),("pedro","agus"),("mark","jas"),("jas","agus"),("sebas","agus"),("juan","sebas"),("diana","agus"),("gus","mirko"),("mirko","feli"),("feli","valen"),("feli","cabille")]
--["1","2","4","5","5","3","2"]
contarRepetidos::String->[String]->Int
contarRepetidos p [] = 0
contarRepetidos p (x:xs) | p==x = 1 + (contarRepetidos p xs)
                         | otherwise = (contarRepetidos p xs)
todosIguales::[String]->Bool
todosIguales [x] = True
todosIguales (x:xs) = x==head xs && todosIguales xs

eliminar::String->[String]->[String]
eliminar a [] =[]
eliminar  a (x:xs) | a==x = eliminar a xs
                   | otherwise = x:eliminar a xs

quienTieneMas::[String]->String
quienTieneMas [x] = x
quienTieneMas (x:xs) | todosIguales (x:xs)==True = x
                     | repetidos (x:xs)==False = x
                     |contarRepetidos x (x:xs) >= contarRepetidos (head xs) xs && x/= head xs = quienTieneMas (x: (eliminar (head xs) xs))
                     | x== head xs = quienTieneMas (xs++[x])
                     | otherwise = quienTieneMas (eliminar x (x:xs))

personaConMasAmigos::[(String,String)]->String
personaConMasAmigos [] = "yo"
personaConMasAmigos ((x,y):xs) | relacionesValidas ((x,y):xs) = quienTieneMas (separar ((x,y):xs))





