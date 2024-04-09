--ej1.a

f :: Int->Int
f x| x==1=8
   | x==4=131
   | x==16=16

--ej1.b

g :: Int->Int
g y| y==8=16
   | y==16=4
   | y==131=1

--ej1.c

h :: Int->Int
h z = f (g z)

k :: Int->Int
k z = g (f z)

