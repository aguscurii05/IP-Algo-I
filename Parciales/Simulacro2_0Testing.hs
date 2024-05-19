import Simulacro2_0
import Test.HUnit

tuplaNoValidaTestSuite = test [
    "caso1" ~: tuplaNoValida ("agus","juan") ("pedro","marcos") ~?= False,
    "caso2" ~: tuplaNoValida ("agus","agus") ("pedro","marcos") ~?= True,
    "caso1" ~: tuplaNoValida ("agus","juan") ("agus","juan") ~?= True,
    "caso1" ~: tuplaNoValida ("agus","juan") ("juan","agus") ~?= True
 ]

relacionesValidasTestSuite = test [
    "caso1" ~: relacionesValidas [("agus","agus")] ~?= False,
    "caso1" ~: relacionesValidas [("agus","juan")] ~?= True,
    "caso1" ~: relacionesValidas [("agus","bruno"),("gabi","pedro"),("marcos","ricardo")] ~?= True,
    "caso1" ~: relacionesValidas [("agus","bruno"),("gabi","pedro"),("bruno","agus")] ~?= False,
    "caso1" ~: relacionesValidas [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi")] ~?= True
 ]

personasAuxTestSuite = test [
    "caso1" ~: personasAux [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi")] ~?= ["agus","bruno","gabi","pedro","juan","agus","agus","gabi"],
    "caso2" ~: personasAux [("agus","juan")] ~?= ["agus","juan"]
 ]

personasTestSuite = test [
    "caso1" ~: personas [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi")] ~?= ["juan","pedro","gabi","bruno","agus"],
    "caso2" ~: personas [("agus","juan")] ~?= ["juan","agus"]
 ]

amigosDeTestSuite = test [
    "caso1" ~: amigosDe "agus" [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi")] ~?= ["bruno","juan","gabi"],
    "caso2" ~: amigosDe "gabi" [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi")] ~?= ["pedro","agus"],
    "caso3" ~: amigosDe "agus" [] ~?= [],
    "caso4" ~: amigosDe "messi" [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi")] ~?= [],
    "caso5" ~: amigosDe "agus" [("agus","bruno"),("gabi","pedro"),("juan","agus"),("agus","gabi"),("agus","messi")] ~?= ["bruno","juan","gabi","messi"]


 ]

cantRepetidosTestSuite = test [
    "caso1" ~: cantRepetidos "agus" ["agus","bruno","gabi","pedro","juan","agus","agus","gabi"] ~?= 3,
    "caso2" ~: cantRepetidos "gabi" ["agus","bruno","gabi","pedro","juan","agus","agus","gabi"] ~?= 2,
    "caso3" ~: cantRepetidos "agus" ["juan","marcos"] ~?= 0,
    "caso4" ~: cantRepetidos "agus" ["agus"] ~?= 1,
    "caso5" ~: cantRepetidos "agus" ["loc"] ~?= 0
 ]

personaConMasAmigosTestSuite = test [
    "caso1" ~: personaConMasAmigos [("agus","juan"),("pedro","agus"),("juan","marcos"),("bruno","franco"),("agus","franco"),("juan","rodri"),("agus","rodri"),("roco","messi")] ~?= "agus",
    "caso2" ~: personaConMasAmigos [("agus","juan"),("pedro","agus"),("juan","marcos"),("juan","franco"),("agus","franco"),("juan","rodri"),("agus","rodri"),("roco","messi")] ~?= "agus",
    "caso3" ~: personaConMasAmigos [("agus","juan"),("pedro","agus"),("juan","marcos"),("juan","franco"),("agus","franco"),("juan","rodri"),("agus","rodri"),("juan","messi")] ~?= "juan",
    "caso4" ~: personaConMasAmigos [("juan","agus")] ~?= "juan"
 ]

main = runTestTT tests

tests = test [
    "test sintaxis" ~: (relacionesValidas [] || not (relacionesValidas [])) ~?= True,
    "relaciones vacias" ~: relacionesValidas [] ~?= True,
    "componentes duplicadas 1" ~: relacionesValidas duplicados1 ~?= False,
    "componentes duplicadas 2" ~: relacionesValidas duplicados2 ~?= False,
    "validas de 1 elemento" ~: relacionesValidas validas1 ~?= True,
    "validas de n elementos" ~: relacionesValidas validas2 ~?= True
    ]

tests2 = test [
    "vacio" ~: personas [] ~?= [],
    "personas 1 elemento" ~:  sonIguales_hunit (personas validas1) ["X", "Z"] ~?= True, -- en algun orden
    "personas n elementos" ~: sonIguales_hunit (personas validas2) ["X", "Z", "P", "Q", "A", "B"] ~?= True,
    "personas n elementos repetidos" ~: sonIguales_hunit (personas validas3) ["X", "Z", "Q", "B"] ~?= True
    ]

tests3 = test [
    "vacio" ~: amigosDe "A" [] ~?= [],
    "sin amigos" ~: amigosDe "A" validas1 ~?= [],
    "amigosDe 1 elemento" ~: sonIguales_hunit (amigosDe "A" validas2) ["B"] ~?= True,
    "amigosDe n elementos" ~: sonIguales_hunit (amigosDe "A" validas3'') ["B", "X", "Z"] ~?= True
    ]

tests4 = test [
    "personaConMasAmigos 1 elemento" ~: pertenece_hunit (personaConMasAmigos validas1') (aplanar_hunit validas1') ~?= True,
    "personaConMasAmigos empate" ~: pertenece_hunit (personaConMasAmigos validas2') (aplanar_hunit validas2') ~?= True,
    "personaConMasAmigos" ~: pertenece_hunit (personaConMasAmigos validas3') (aplanar_hunit validas3') ~?= True,
    "personaConMasAmigos2" ~: personaConMasAmigos validas4' ~?= "A"
    ]

--Formulas

quitar_hunit :: (Eq t) => t -> [t] -> [t]
quitar_hunit x (y:ys) | x == y = ys
                | otherwise = y : quitar_hunit x ys

incluido_hunit :: (Eq t) => [t] -> [t] -> Bool
incluido_hunit [] l = True
incluido_hunit (x:c) l = elem x l && incluido_hunit c (quitar_hunit x l)

sonIguales_hunit :: (Eq t) => [t] -> [t] -> Bool
sonIguales_hunit xs ys = incluido_hunit xs ys && incluido_hunit ys xs

pertenece_hunit :: (Eq t) => t -> [t] -> Bool
pertenece_hunit _ [] = False
pertenece_hunit x (y:ys) | x == y = True
                   | otherwise = pertenece_hunit x ys

aplanar_hunit :: [(t, t)] -> [t]
aplanar_hunit [] = []
aplanar_hunit ((a, b):xs) = a:(b:(aplanar_hunit xs))

--Listas

duplicados1 = [("X", "Z"), ("P", "Q"), ("A", "A")]
duplicados2 = [("X", "Z"), ("P", "Q"), ("A", "B"), ("Z", "X")]
validas1 = [("X", "Z")]
validas2 = [("X", "Z"), ("P", "Q"), ("A", "B")]
validas3 = [("X", "Z"), ("Z", "Q"), ("Q", "B")]
validas3'' = [("X", "Z"), ("P", "Q"), ("A", "B"), ("X", "A"), ("Z", "A")]

validas1' = [("X", "Z")]
validas2' = [("X", "Z"), ("P", "Q"), ("A", "B")]
validas3' = [("X", "Z"), ("P", "Q"), ("A", "B"), ("X", "A"), ("Z", "A")]
validas4' = [("A", "B"), ("X", "A"), ("Z", "A"), ("X", "Z"), ("P", "Q")]

correr = runTestTT personaConMasAmigosTestSuite