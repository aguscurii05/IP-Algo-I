import Test.HUnit
import Guia5

primerTest = test [
  "caso1" ~: (palabraMasLarga "") ~?= [],
  "caso1" ~: (palabraMasLarga "      ") ~?= [],
  "caso1" ~: (palabraMasLarga "a") ~?= "a",
  "caso1" ~: (palabraMasLarga "a bb") ~?= "bb",
  "caso1" ~: (palabraMasLarga "uno dos tres cuatro") ~?= "cuatro"

  

  ]