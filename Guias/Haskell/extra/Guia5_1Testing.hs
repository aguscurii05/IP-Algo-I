import Guia5_1
import Test.HUnit


longitudTestSuite = test [
    "caso2" ~: longitud [1]~?= 1,
    "caso3" ~: longitud [1,2,3,4,5,6] ~?= 6,
    "caso4" ~: longitud ["a","f","g","s"] ~?= 4
 ]

ultimoTestSuite = test [
    "caso1" ~: ultimo [3] ~?= 3,
    "caso1" ~: ultimo [3,4,5,6,7,5] ~?= 5,
    "caso1" ~: ultimo ["s","g","h","j"] ~?= "j"

 ]

principioTestSuite = test [
    "caso1" ~: principio [3] ~?= [3],
    "caso1" ~: principio [3,4,5,6,7,5] ~?= [3,4,5,6,7],
    "caso1" ~: principio ["s","g","h","j"] ~?= ["s","g","h"]

 ]

reversoTestSuite = test [
    "caso1" ~: reverso [3] ~?= [3],
    "caso2" ~: reverso [3,4,5,6,7,5] ~?= [5,7,6,5,4,3],
    "caso3" ~: reverso ["s","g","h","j"] ~?= ["j","h","g","s"],
    "caso4" ~: reverso "nitsuga" ~?= "agustin"

 ]

perteneceTestSuite = test [
    "caso1" ~: pertenece  4 [3] ~?= False,
    "caso2" ~: pertenece  3 [3] ~?= True,
    "caso3" ~: pertenece 6 [3,4,5,6,7,5] ~?= True,
    "caso4" ~: pertenece 9 [3,4,5,6,7,5] ~?= False,
    "caso5" ~: pertenece "g" ["s","g","h","j"] ~?= True,
    "caso6" ~: pertenece "g" ["s","y","h","j"] ~?= False,
    "caso7" ~: pertenece 'g' "nitsuga" ~?= True,
    "caso8" ~: pertenece 'z' "nitsuga" ~?= False

 ]

todosIgualesTestSuite = test [
    "caso1" ~: todosIguales [1] ~?= True,
    "caso2" ~: todosIguales [1,1,1,1,1,1] ~?= True,
    "caso3" ~: todosIguales [1,1,1,12,1,1,1,1] ~?= False,
    "caso4" ~: todosIguales ["a","a","a","a"] ~?= True,
    "caso5" ~: todosIguales ["a","a","b","a"] ~?= False,
    "caso6" ~: todosIguales "aaaaaaaaaa" ~?= True,
    "caso7" ~: todosIguales "aaaaaaaaaab" ~?= False
 ]

todosDistintosTestSuite = test [
    "caso1" ~: todosDistintos [1] ~?= True,
    "caso2" ~: todosDistintos [1,1,1,1,1,1] ~?= False,
    "caso3" ~: todosDistintos [1,2,3,4,5,6,7] ~?= True,
    "caso4" ~: todosDistintos ["a","a","a","a"] ~?= False,
    "caso5" ~: todosDistintos ["a","c","b","d"] ~?= True,
    "caso6" ~: todosDistintos "aaaaaaaaaa" ~?= False,
    "caso7" ~: todosDistintos "asdjksdjffdsjfb" ~?= False,
    "caso8" ~: todosDistintos "agustin" ~?= True
 ]

hayRepetidosTestSuite = test [
    "caso1" ~: hayRepetidos [1] ~?= False,
    "caso2" ~: hayRepetidos [1,1,1,1,1,1] ~?= True,
    "caso3" ~: hayRepetidos [1,2,3,4,5,6,7] ~?= False,
    "caso4" ~: hayRepetidos ["a","a","a","a"] ~?= True,
    "caso5" ~: hayRepetidos ["a","c","b","d"] ~?= False,
    "caso6" ~: hayRepetidos "aaaaaaaaaa" ~?= True,
    "caso7" ~: hayRepetidos "asdjksdjffdsjfb" ~?= True,
    "caso8" ~: hayRepetidos "agustin" ~?= False
 ]

quitarTestSuite = test [
    "caso1" ~: quitar 5 [1,2,3,4,5,6] ~?= [1,2,3,4,6],
    "caso2" ~: quitar 89 [1,2,3,4,5,6] ~?= [1,2,3,4,5,6],
    "caso3" ~: quitar 89 [89] ~?= [],
    "caso4" ~: quitar 89 [] ~?= [],
    "caso5" ~: quitar "h" ["a","b","h","a"] ~?= ["a","b","a"],
    "caso5" ~: quitar "h" ["a","b","c","a"] ~?= ["a","b","c","a"],
    "caso7" ~: quitar 'i' "agustin" ~?= "agustn",
    "caso8" ~: quitar 'j' "agustin" ~?= "agustin"


 ]

quitarTodosTestSuite = test [
    "caso1" ~: quitarTodos 5 [1,2,5,5,3,4,5,6] ~?= [1,2,3,4,6],
    "caso2" ~: quitarTodos 89 [1,2,3,4,5,6] ~?= [1,2,3,4,5,6],
    "caso3" ~: quitarTodos 89 [89,89,89,89,89] ~?= [],
    "caso4" ~: quitarTodos 89 [] ~?= [],
    "caso5" ~: quitarTodos "h" ["a","h","b","h","b","h","a"] ~?= ["a","b","b","a"],
    "caso5" ~: quitarTodos "h" ["a","b","c","a"] ~?= ["a","b","c","a"],
    "caso7" ~: quitarTodos 'i' "agiiiiustin" ~?= "agustn",
    "caso8" ~: quitarTodos 'j' "agustin" ~?= "agustin"


 ]

eliminarRepetidosTestSuite = test [
    "caso1" ~: eliminarRepetidos [1,2,5,5,3,4,5,6] ~?= [1,2,5,3,4,6],
    "caso2" ~: eliminarRepetidos [1,2,3,4,5,6] ~?= [1,2,3,4,5,6],
    "caso3" ~: eliminarRepetidos [89,89,89,89,89] ~?= [89],
    "caso5" ~: eliminarRepetidos ["a","h","b","h","b","h","a"] ~?= ["a","h","b"],
    "caso5" ~: eliminarRepetidos ["a","b","c","a"] ~?= ["a","b","c"],
    "caso7" ~: eliminarRepetidos "agustiiiiiiiiiiiiiiiiin" ~?= "agustin",
    "caso8" ~: eliminarRepetidos "agustin" ~?= "agustin"


 ]

mismosElementosTestSuite = test [
    "caso1" ~: mismosElementos [1] [1] ~?= True,
    "caso1" ~: mismosElementos [1] [3] ~?= False,
    "caso2" ~: mismosElementos [1,2,3,5,6,8,9] [9,1,8,2,6,3,5] ~?= True,
    "caso2" ~: mismosElementos [1,2,3,3,3,3,3,3,5,6,8,9] [9,1,8,9,9,9,9,9,9,2,6,3,5] ~?= True,
    "caso2" ~: mismosElementos [1,2,3,5,6,8,9] [9,1,8,1,6,3,5] ~?= False,
    "caso2" ~: mismosElementos [1,2,3,5,6,6,6,6,6,8,9] [9,1,1,1,1,1,8,1,6,3,5] ~?= False
 ]

capicuaTestSuite = test [
    "caso2" ~: capicua [1] ~?= True,
    "caso3" ~: capicua [1,2,3,4,5,4,3,2,1] ~?= True,
    "caso4" ~: capicua [1,2,3,4,6,7,85,4,2] ~?= False
 ]

sumatoriaTestSuite = test [
    "caso1" ~: sumatoria [] ~?= 0, 
    "caso1" ~: sumatoria [1] ~?= 1,
    "caso1" ~: sumatoria [1,2,3,4,5,6,7] ~?= 28
 ]

productoriaTestSuite = test [
    "caso1" ~: productoria [] ~?= 1, 
    "caso1" ~: productoria [8] ~?= 8,
    "caso1" ~: productoria [1,2,3,4,5,6,7] ~?= 5040
 ]

maximoTestSuite = test [
    "caso1" ~: maximo [8] ~?= 8,
    "caso1" ~: maximo [1,2,3,4,5,6,7] ~?= 7,
    "caso1" ~: maximo [1,2,3,4,99,5,6,7] ~?= 99
 ]

sumarNTestSuite = test [
    
    "caso1" ~: sumarN 5 [] ~?= [],
    "caso1" ~: sumarN 5 [8] ~?= [13],
    "caso1" ~: sumarN 2 [1,2,3,4,5,6,7] ~?= [3,4,5,6,7,8,9]
 ]

sumarElPrimeroTestSuite = test [
    
    "caso1" ~: sumarElPrimero [] ~?= [],
    "caso1" ~: sumarElPrimero [8] ~?= [16],
    "caso1" ~: sumarElPrimero [1,2,3,4,5,6,7] ~?= [2,3,4,5,6,7,8],
    "caso1" ~: sumarElPrimero [7,2,3,4,5,6,7] ~?= [14,9,10,11,12,13,14]
 ]

sumarElUltimoTestSuite = test [
    
    "caso1" ~: sumarElUltimo [] ~?= [],
    "caso1" ~: sumarElUltimo [8] ~?= [16],
    "caso1" ~: sumarElUltimo [1,2,3,4,5,6,7] ~?= [8,9,10,11,12,13,14],
    "caso1" ~: sumarElUltimo [7,2,3,4,5,6,7] ~?= [14,9,10,11,12,13,14]
 ]

paresTestSuite = test [
    
    "caso1" ~: pares [] ~?= [],
    "caso1" ~: pares [8] ~?= [8],
    "caso1" ~: pares [7] ~?= [],
    "caso1" ~: pares [1,2,3,4,5,6,7] ~?= [2,4,6],
    "caso1" ~: pares [1,2,3,2,2,4,5,6,7] ~?= [2,2,2,4,6],    
    "caso1" ~: pares [1,3,5,7,9] ~?= []
 ]

multiplosDeNTestSuite= test [
    "caso1" ~: multiplosDeN 6 [] ~?= [],
    "caso1" ~: multiplosDeN 6 [3] ~?= [],
    "caso1" ~: multiplosDeN 6 [12] ~?= [12],
    "caso1" ~: multiplosDeN 6 [1,2,3,2,7,33,21,2] ~?= [],
    "caso1" ~: multiplosDeN 6 [1,2,6,3,4,12,5,4,36] ~?= [6,12,36]
 ]

ordenarTestSuite = test [
    "caso1" ~: ordenar [] ~?= [],
    "caso1" ~: ordenar [3] ~?= [3],
    "caso1" ~: ordenar [1,5,8,6,4] ~?= [1,4,5,6,8],
    "caso1" ~: ordenar [4,4,4,4,4,4] ~?= [4,4,4,4,4,4]
 ]

eliminarBlancosRepetidosTestSuite = test [
    "caso1" ~: eliminarBlancosRepetidos [] ~?= [],
    "caso1" ~: eliminarBlancosRepetidos "fdfddssa" ~?= "fdfddssa",
    "caso1" ~: eliminarBlancosRepetidos "ya   comi         hoy" ~?= "ya comi hoy"
 ]

sacarBlancosDemasTestSuite = test [
    "caso1" ~: sacarBlancosDemas " fdhjdhd dhddhhd dhdhdhd " ~?= "fdhjdhd dhddhhd dhdhdhd",
    "caso1" ~: sacarBlancosDemas "fdhjdhd dhddhhd dhdhdhd" ~?= "fdhjdhd dhddhhd dhdhdhd"
 ]

contarPalabrasTestSuite = test [
    "caso1" ~: contarPalabras "   hola   me llamo    agus   " ~?= 4,
    "caso2" ~: contarPalabras "hola" ~?= 1,
    "caso" ~: contarPalabras " " ~?= 0
 ]

primerPalabratestSuite = test [
    "caso1" ~: primerPalabra "hola como" ~?= "hola",
    "caso1" ~: primerPalabra "hola" ~?= "hola"
 ]

palabrasTestSuite = test [
    "caso1" ~: palabras "hola" ~?= ["hola"],
    "caso1" ~: palabras "hola como va" ~?= ["hola","como","va"],
    "caso1" ~: palabras "" ~?= []
 ]

palabraMasLargaTestSuite = test [
    "caso1" ~: palabraMasLarga "juan" ~?= "juan",
    "caso2" ~: palabraMasLarga "juan tiene muchisimo frio" ~?= "muchisimo"
 ]

aplanarTestSuite = test [
    "caso1" ~: aplanar ["hola","tengo","hambre"] ~?= "holatengohambre",
    "caso2" ~: aplanar ["hola"] ~?= "hola",
    "caso3" ~: aplanar [] ~?= ""
 ]

aplanarConBlancosTestSuite = test [
    "caso1" ~: aplanarConBlancos ["hola","tengo","hambre"] ~?= "hola tengo hambre",
    "caso2" ~: aplanarConBlancos ["hola"] ~?= "hola",
    "caso3" ~: aplanarConBlancos [] ~?= ""
 ]

aplanarConNBlancosTestSuite = test [
    "caso1" ~: aplanarConNBlancos 3 ["hola","tengo","hambre"] ~?= "hola   tengo   hambre",
    "caso1" ~: aplanarConNBlancos 1 ["hola","tengo","hambre"] ~?= "hola tengo hambre",
    "caso1" ~: aplanarConNBlancos 0 ["hola","tengo","hambre"] ~?= "holatengohambre",
    "caso2" ~: aplanarConNBlancos 1 ["hola"] ~?= "hola",
    "caso3" ~: aplanarConNBlancos 3 [] ~?= ""
 ]




correr = runTestTT aplanarConNBlancosTestSuite