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

testingAtajaronSuplentes = test [
    "caso1" ~: atajaronSuplentes [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [4,8,4,9,6] 40 ~?= 9,
    "caso1" ~: atajaronSuplentes [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [4,8,0,0,0] 40 ~?= 28,
    "caso1" ~: atajaronSuplentes [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [0,0,0,0,0] 40 ~?= 40,
    "caso1" ~: atajaronSuplentes [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [0,0,0,0,0] 0 ~?= 0,
    "caso2" ~: atajaronSuplentes [] [] 25 ~?= 25
 ]

posicionDeNTesting = test [
    "caso1" ~: posicionDeN "Messi" [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] ~?= 2,
    "caso1" ~: posicionDeN "Armani" [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] ~?= 1,
    "caso1" ~: posicionDeN "Torrico" [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] ~?= 4,
    "caso1" ~: posicionDeN "Neuer" [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] ~?= 5

 ]

elementoNTesting = test [
    "caso1" ~: elementoN 5 [2,3,4,6,4,6,5] ~?= 4,
    "caso1" ~: elementoN 2 [2,3,4,6,4,6,5] ~?= 3,
    "caso1" ~: elementoN 6 [2,3,4,6,4,6,5] ~?= 6,
    "caso1" ~: elementoN 1 [2,3,4,6,4,6,5] ~?= 2
 ]

porcentajeDeGolesTesting = test [
    "caso1" ~: porcentajeDeGoles "Neuer" [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [4,8,4,4,5] ~?= 20.0,
    "caso1" ~: porcentajeDeGoles "Dibu" [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [4,8,4,4,5] ~?= 16.0

 ]

vallaMenosVencidaTesting = test [
    "caso1" ~: vallaMenosVencida [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [4,8,4,9,6] ~?= "Armani",
    "caso2" ~: vallaMenosVencida [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [4,8,4,9,1] ~?= "Neuer",
    "caso3" ~: vallaMenosVencida [("River","Armani"),("Boca","Messi"),("Racing","Dibu"),("San Lorenzo","Torrico"),("Independiente","Neuer")] [1,1,1,1,1] ~?= "Armani",
    "caso4" ~: vallaMenosVencida [("Barca","Ter Stegen")] [5] ~?= "Ter Stegen"

 ]