f::Int->Int
f x| x<=7 = x^2
   | otherwise = 2*x-1

g::Int->Int
g x| mod x 2==0 = div x 2
   | otherwise = 3*x+1

todosMenores::(Int,Int,Int)->Bool
todosMenores (x,y,z)| (f x > g x) && (f y > g y) && (f z > g z) = True
                    | otherwise =False