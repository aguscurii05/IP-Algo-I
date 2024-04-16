--problema parteEntera (x: R) : Z {
--requiere: { T rue }
--asegura: { resultado ≤ x < resultado + 1 }
--}


parteEntera :: Float ->Integer
parteEntera n| n>=0 && n<1 = 0
             | n<0 = parteEntera (n+1)-1 
             | otherwise = parteEntera(n-1)+1