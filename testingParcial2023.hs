import Test.HUnit
import Parcial2023



testingEquiposValidos = test [
    "caso1" ~: equiposValidos [("River","Armani")] ~=? True,
    "caso2" ~: equiposValidos [("River","Armani"),("Boca","Rossi")] ~=? True,
    "caso3" ~: equiposValidos [("River","Armani"),("River","Armani")] ~=? False,
    "caso4" ~: equiposValidos [("River","Armani"),("River","Armani"),("Racing","Dibu")] ~=? False,
    "caso5" ~: equiposValidos [("River","Armani"),("Boca","Messi"),("River","Armani")] ~=? False,
    "caso6" ~: equiposValidos [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] ~=? True,
    "caso7" ~: equiposValidos [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("River","Armani")] ~=? False,
    "caso8" ~: equiposValidos [("River","Armani"),("Boca","Messi"),("Bayer","Dibu"),("San Lorenzo","Torrico"),("Bayer","Dibu")] ~=? False


 ]

