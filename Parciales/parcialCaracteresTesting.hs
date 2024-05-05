import ParcialCaracteres 
import Test.HUnit 


cantAparicionesTesting = test [
    "caso1" ~: cantApariciones 7 [6,4,3,2,5,7,5,6,7,7,553,5,4,7] ~?= 4,
    "caso1" ~: cantApariciones 7 [] ~?= 0,
    "caso1" ~: cantApariciones 7 [6] ~?= 0,
    "caso1" ~: cantApariciones 7 [7] ~?= 1,
    "caso2" ~: cantApariciones "a" ["a","b","a","b","a"] ~?= 3
 ]

cantMinusculaTesting = test [
    "msj vacio" ~: cantMinuscula "" ~?= 0,
    "letras al principio" ~: cantMinuscula "juanCITO" ~?= 4,
    "letras al medio" ~: cantMinuscula "DSJSJSJbcdaaDKJSKJSKJ" ~?= 5,
    "todo mayusc" ~: cantMinuscula "FSJHSDFHJFDSJKHDFSJH" ~?= 0,
    "todo espacios en blanco" ~: cantMinuscula "                         " ~?= 0
 ]

maximoCambiosTesting = test [
    "un elem" ~: maximoCambios ["juan"] ~?= "juan",
    "un elem" ~: maximoCambios ["JUAN"] ~?= "JUAN",
    "sin minusculas" ~: maximoCambios ["PEDRO","MARCOS","MILEI"] ~?= "PEDRO",
    "un elem con mas min" ~: maximoCambios ["juan","rodrigo","JUANENMAYUS","DESOXIRRIBonucleicooo"] ~?= "DESOXIRRIBonucleicooo",
    "varios elem con mas min" ~: maximoCambios ["juan","ab","MILEI","tomi","rodo"] ~?= "juan"

    
 ]

desplzarAuxTesting = test [
    "1" ~: desplazarAux 'i' 19 ~?= 'b',
    "2" ~: desplazarAux 'i' 4 ~?= 'm',
    "1" ~: desplazarAux 'w' 14 ~?= 'k'
 ]

desplazarTesting = test [
    "1" ~: desplazar 'a' 3 ~?= 'd',
    "2" ~: desplazar 'i' (-7) ~?= 'b',
    "3" ~: desplazar 'h' 24 ~?= 'f',
    "4" ~: desplazar 'f' (-1) ~?= 'e',
    "5" ~: desplazar 'f' 0 ~?= 'f',
    "6" ~: desplazar 'f' 25 ~?= 'e',
    "7" ~: desplazar '5' 3 ~?= '5'


 ]

codificarTesting = test [
    "caso1" ~: codificar "abcdef" 4 ~?= "efghij",
    "caso2" ~: codificar "agus" 0 ~?= "agus",
    "caso3" ~: codificar "ghi" 7 ~?= "nop",
    "caso4" ~: codificar "aHDHDHDHbJDJDDJDJDJcDJDJDJDJ" 3 ~?= "dHDHDHDHeJDJDDJDJDJfDJDJDJDJ",
    "caso5" ~: codificar "ASSAASSA5555" 7 ~?= "ASSAASSA5555"    
 ]

decodificarTesting = test [
    "caso1" ~: decodificar "efghij" 4 ~?= "abcdef",
    "caso2" ~: decodificar "agus" 0 ~?= "agus",
    "caso3" ~: decodificar "nop" 7 ~?= "ghi",
    "caso4" ~: decodificar "dHDHDHDHeJDJDDJDJDJfDJDJDJDJ" 3 ~?= "aHDHDHDHbJDJDDJDJDJcDJDJDJDJ",
    "caso5" ~: decodificar "ASSAASSA5555" 7 ~?= "ASSAASSA5555"    
 ]

correr = runTestTT desplazarTesting
