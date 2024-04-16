sumaImpares :: Integer ->Integer
sumaImpares 1 = 1
sumaImpares n= sumaImpares (n-1) + (2*n-1)