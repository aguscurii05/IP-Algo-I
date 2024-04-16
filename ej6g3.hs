bisiesto::Int->Bool
bisiesto x| mod x 4==0 || (mod x 100==0 && (mod x 400/=0)) = True
          |otherwise = False


--este lo invente yo:)
proxBisiesto::Int->Int
proxBisiesto x| bisiesto x = x+4
              | bisiesto (x+1) =x+1
              |bisiesto (x+2) = x+2
              |otherwise = x+3