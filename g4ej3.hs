esDivisible :: Integer ->Integer ->Bool
esDivisible a b|a<0 || b<0 = False --a b naturales
               |a-b==0 = True --cb1
               | a-b<0 = False --cb2
               | a-b>0 = esDivisible (a-b) b --recurs.
               