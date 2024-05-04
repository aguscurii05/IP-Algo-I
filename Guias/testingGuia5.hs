import Test.HUnit
import Guia5

sumatoria2Testing = test [
  "caso1" ~: (sumatoria2  3 [1,2,3,4,5]) ~?= 6,
  "caso2" ~: (sumatoria2  3 []) ~?= 0,
  "caso3" ~: (sumatoria2  5 [1,2,3,4,5]) ~?= 15
    ]

sumaAcumuladaTesting = test [
  "caso1" ~: (sumaAcumulada  [1,2,3,4,5]) ~?= [1, 3, 6, 10, 15],
  "caso2" ~: (sumaAcumulada  []) ~?= [],
  "caso3" ~: (sumaAcumulada  [1]) ~?= [1],
  "caso4" ~: (sumaAcumulada  [1,2,7,5,2]) ~?= [1,3,10,15,17]

    ]

prodPrimosTesting = test [
  "caso1" ~: (prodPrimos  3 2) ~?= [3],
  "caso2" ~: (prodPrimos  10 2) ~?= [2,5],
  "caso3" ~: (prodPrimos  15 2) ~?= [3,5]
    ]

descomponerEnPrimosTesting = test [
  "caso1" ~: (descomponerEnPrimos  [2, 10, 6]) ~?= [[2], [2, 5], [2, 3]],
  "caso2" ~: (descomponerEnPrimos  [7,8,2,12]) ~?= [[7],[2,2,2],[2],[2,2,3]],
  "caso3" ~: (descomponerEnPrimos  []) ~?= [[]],
  "caso4" ~: (descomponerEnPrimos  [144]) ~?= [[2,2,2,2,3,3]]
    ]