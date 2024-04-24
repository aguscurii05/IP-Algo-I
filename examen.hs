tuplasIguales::(Eq t)=>(t,t)->(t,t)->Bool
tuplasIguales (a,b) (c,d) = (a==c && b==d) || (a==d && b==c)

rel::[(String,String)]->Bool
rel [] = False
rel [(x,y)]= True
rel ((x,y):xs) = not(tuplasIguales (x,y) (head xs)) && rel ((x,y):tail xs)

relacionesValidas::[(String,String)]->Bool
relacionesValidas ((x,y):xs) = rel ((x,y):xs) && relacionesValidas xs



separar::[(String,String)]->[String]
separar [(x,y)]= [x]++[y]
separar ((x,y):xs) = [x]++[y]++separar xs

quitar::[String]->[String]
quitar (x:xs) | x== head xs = 




