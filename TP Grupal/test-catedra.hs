import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

runCatedraTests = runTestTT allTests

allTests = test [
    "esMinuscula" ~: testsEjesMinuscula,
    "letraANatural" ~: testsEjletraANatural,
    "desplazar" ~: testsEjdesplazar,
    "cifrar" ~: testsEjcifrar,
    "descifrar" ~: testsEjdescifrar,
    "cifrarLista" ~: testsEjcifrarLista,
    "frecuencia" ~: testsEjfrecuencia,
    "cifradoMasFrecuente" ~: testsEjcifradoMasFrecuente,
    "esDescifrado" ~: testsEjesDescifrado,
    "todosLosDescifrados" ~: testsEjtodosLosDescifrados,
    "expandirClave" ~: testsEjexpandirClave,
    "cifrarVigenere" ~: testsEjcifrarVigenere,
    "descifrarVigenere" ~: testsEjdescifrarVigenere,
    "peorCifrado" ~: testsEjpeorCifrado,
    "combinacionesVigenere" ~: testsEjcombinacionesVigenere
    ]


testsEjesMinuscula = test [
    esMinuscula 'd' ~?= True,
    esMinuscula 'a' ~?= True,
    esMinuscula 'A' ~?= False, 
    esMinuscula 'z' ~?= True,
    esMinuscula ';' ~?= False 
    ]

testsEjletraANatural = test [
    letraANatural 'b' ~?= 1,
    letraANatural 'a' ~?= 0,
    letraANatural 'z' ~?= 25
    ]

testsEjdesplazar = test [
    desplazar 'a' 3 ~?= 'd',
    desplazar 'a' 25 ~?= 'z',
    desplazar 'a' (-1) ~?= 'z', 
    desplazar 'z' (-25) ~?= 'a',
    desplazar 'z' 1 ~?= 'a',
    desplazar 'b' 1000 ~?= 'n', 
    desplazar 'b' (-1000) ~?= 'p',
    desplazar 'a' 0 ~?= 'a'
    ]

testsEjcifrar = test [
    cifrar "computacion" 3 ~?= "frpsxwdflrq",
    cifrar "abc" 2 ~?= "cde",
    cifrar "hola" 0 ~?= "hola",
    cifrar "ABabí" 4 ~?= "ABefí", 
    cifrar "ABC" 100 ~?= "ABC",
    cifrar " " 40 ~?= " "
    ]

testsEjdescifrar = test [
    descifrar "frpsxwdflrq" 3 ~?= "computacion",
    descifrar "cde" 2 ~?= "abc",
    descifrar "hola" 0 ~?= "hola",
    descifrar "ABefí" 4 ~?= "ABabí",
    descifrar "ABC" 100 ~?= "ABC",
    descifrar " " 40 ~?= " "
    ]

testsEjcifrarLista = test [
    cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"],
    cifrarLista ["a","b","c","d"] ~?= ["a", "c", "e","g"],
    cifrarLista [] ~?= [], 
    cifrarLista ["a","b","C","!"] ~?= ["a", "c","C","!"]
    ]

testsEjfrecuencia = test [
    expectlistProximity (frecuencia "taller") [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "a") [100.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "aBz") [50.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,50.0],
    expectlistProximity (frecuencia "abc") [33.33333,33.33333,33.33333,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "abcdefghijklmnopqrstuvwxyz") [3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615],
    expectlistProximity (frecuencia "ABC!") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]

    ]

testsEjcifradoMasFrecuente = test [
    expectAnyTuplaAprox (cifradoMasFrecuente "taller" 3) [('o', 33.33333)],
    cifradoMasFrecuente "a" 1 ~?= ('b', 100.0),
    cifradoMasFrecuente "a" (-1) ~?= ('z', 100.0),
    cifradoMasFrecuente "bB" 25 ~?= ('a', 100.0),
    expectAnyTuplaAprox (cifradoMasFrecuente "taller" (-3)) [('i', 33.33333)],
    cifradoMasFrecuente "abcdé" 0 ~?= ('a', 25.0),
    expectAnyTuplaAprox (cifradoMasFrecuente "abcdefghijklmnopqrstuvwxyz" 1) [('b', 3.84615)]
    ]

testsEjesDescifrado = test [
    esDescifrado "taller" "compu" ~?= False , 
    esDescifrado "taller" "taller" ~?= True ,
    esDescifrado "Abc" "Ade" ~?= True ,
    esDescifrado "Abc" "Cde" ~?= False ,
    esDescifrado "" "" ~?= True ,
    esDescifrado "" "hola" ~?= False,
    esDescifrado "chau" "" ~?= False,
    esDescifrado "abc" "pqr" ~?= True,
    esDescifrado "HOLA" "HOLA" ~?= True
    ]

testsEjtodosLosDescifrados = test [
    todosLosDescifrados ["compu", "frpsx", "mywza"] ~?= [("compu", "frpsx"), ("frpsx", "compu")] ,
    todosLosDescifrados [] ~?= [],
    todosLosDescifrados ["abc", "cba", "fhe", "ooo"] ~?= [] ,
    todosLosDescifrados ["abc", "cba", "fhe", "xyz"] ~?= [("abc", "xyz"),("xyz","abc")] ,
    expectPermutacion (todosLosDescifrados ["hola", "krod", "elix"]) [("hola", "krod"), ("hola", "elix"), ("krod", "elix"), ("krod", "hola"), ("elix", "krod"), ("elix", "hola")] ,
    todosLosDescifrados [""] ~?= [("","")],
    todosLosDescifrados ["a"] ~?= [],
    todosLosDescifrados ["LMN", "opq", "rst"] ~?= [("LMN","LMN"),("opq","rst"),("rst","opq")],
    expectPermutacion (todosLosDescifrados ["abc", "hola", "opq", "elix"]) [("abc","opq"),("hola","elix"),("opq","abc"),("elix","hola")],
    todosLosDescifrados ["abc", "hola", "dEf", "krod"] ~?= [("hola","krod"),("krod","hola")] ,
    todosLosDescifrados ["HOLA","chau"] ~?= [("HOLA","HOLA")],
    expectPermutacion (todosLosDescifrados ["abc","aaBB","opq","zzBB"]) [("abc","opq"),("aaBB","zzBB"),("opq","abc"),("zzBB","aaBB")]

    ]

testsEjexpandirClave = test [
    expandirClave "compu" 8 ~?= "compucom",
    expandirClave "a" 4 ~?= "aaaa",
    expandirClave "introduccion" 12 ~?= "introduccion",
    expandirClave "hola" 6 ~?= "holaho",
    expandirClave "compu" 3 ~?= "com"
    ]

testsEjcifrarVigenere = test [
    cifrarVigenere "computacion" "ip" ~?= "kdueciirqdv",
    cifrarVigenere "" "ip"  ~?= "",
    cifrarVigenere "AAAP{{}}" "ip"  ~?= "AAAP{{}}",
    cifrarVigenere "introduccion a la programacion" "compu"  ~?= "kbfgifiorcqb p no elqudpgcqudh",
    cifrarVigenere "ABAabc" "ab" ~?= "ABAbbd" 
    ]

testsEjdescifrarVigenere = test [
    descifrarVigenere "kdueciirqdv" "ip" ~?= "computacion",
    descifrarVigenere "" "ip"  ~?= "", 
    descifrarVigenere "AAAP{{}}" "ip"  ~?= "AAAP{{}}",
    descifrarVigenere "kbfgifiorcqb p no elqudpgcqudh" "compu"  ~?= "introduccion a la programacion",
    descifrarVigenere "ABAbbd" "ab" ~?= "ABAabc" 
    ]

testsEjpeorCifrado = test [
    peorCifrado "computacion" ["ip", "asdef", "ksy"] ~?= "asdef",
    expectAny (peorCifrado "" ["ip", "asdef", "ksy"])  ["ip", "asdef", "ksy"],
    expectAny(peorCifrado "abc" ["aab","buenass","ab"]) ["ab", "aab"],
    peorCifrado "holaa" ["o"] ~?= "o",
    peorCifrado "compuip" ["z","b","a"]~?= "a",
    peorCifrado "compu" ["z","c"]~?= "z"
    ]

testsEjcombinacionesVigenere = test [
    combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb" ~?= [("hola", "b")],
    combinacionesVigenere [] [] "test" ~?= [],
    combinacionesVigenere ["hola"] ["b"] "test" ~?= [],
    combinacionesVigenere ["chau"] ["b"] "dibv" ~?= [("chau","b")], 
    expectPermutacion (combinacionesVigenere ["abc","yza"] ["d","b"] "bcd") [("abc", "b"),("yza" ,"d")],
    expectPermutacion (combinacionesVigenere ["ho la","introp"] ["cda","cdacd"] "jr nd") [("ho la","cda"),("ho la","cdacd")],
    expectPermutacion ( combinacionesVigenere ["a","b","c"] ["y","x", "z"] "z") [("b","y"),("a","z"),("c","x")],
    expectPermutacion ( combinacionesVigenere ["a","b","c"] ["y","x", "z"] "") [],
    expectPermutacion (combinacionesVigenere ["ho la","introp"] ["cda","cdacd"] "jry nd") [],
    expectPermutacion (combinacionesVigenere ["AAbcd","test","AAdbd"] ["abc","abcabtest","aaabb"] "AAdce") [("AAbcd","abc"),("AAbcd","abcabtest"),("AAdbd","aaabb")]
    ]

-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)
