import ExamenElecciones
import Test.HUnit

formulasInvalidasTesting = test [
    "caso1" ~: formulasInvalidas [("Milei", "Villarruel")] ~?= False,
    "caso2" ~: formulasInvalidas [("Milei", "Milei")] ~?= True,
    "caso3" ~: formulasInvalidas [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Milei","Coscu")] ~?= True,
    "caso4" ~: formulasInvalidas [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= False,
    "caso5" ~: formulasInvalidas [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Coscu","Coscu")] ~?= True,
    "caso6" ~: formulasInvalidas [("Milei", "Villarruel"),("Macri","Pichetto"),("Coscu","Massa"),("Cristina","Coscu")] ~?= True,
    "caso7" ~: formulasInvalidas [("Cristina", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Coscu","Coscu")] ~?= True



 ]

porcentajeDeVotosAfirmativosTesting = test [
    "caso4" ~: porcentajeDeVotosAfirmativos [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [15,20,12,10] 100 ~?= 57.0
 ]

numeroDeElementoTesting = test [
    "caso1" ~: numeroDeElemento "Massa" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= 3,
    "caso2" ~: numeroDeElemento "Villarruel" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= 1,
    "caso3" ~: numeroDeElemento "Coscu" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= 4,
    "caso4" ~: numeroDeElemento "Milei" [("Coscu","Milei")] ~?= 1

 ]

elementoNTesting = test [
    "caso1" ~: elementoN 3 [1,4,7] ~?= 7,
    "caso2" ~: elementoN 1 [1,4,7] ~?= 1,
    "caso5" ~: elementoN 1 [1] ~?= 1
 ]

porcentajeVotosTesting = test [
    "caso1" ~: porcentajeVotos "Pichetto" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [30,40,20,10] ~?= 40.0,
    "caso2" ~: porcentajeVotos "Coscu" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [30,40,20,10] ~?= 10.0,
    "caso3" ~: porcentajeVotos "Villarruel" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [30,40,20,10] ~?= 30.0,
    "caso4" ~: porcentajeVotos "Villarruel" [("Milei", "Villarruel")] [30] ~?= 100.0,
    "caso3'" ~: porcentajeVotos "Villarruel" [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [30,0,0,0] ~?= 100.0



 ]

numeroDeElemento2Testing = test [
    "caso1" ~: numeroDeElemento2 4 [1,2,3,5,6,7,8,4] ~?= 8,
    "caso2" ~: numeroDeElemento2 5 [1,2,3,5,6,7,8,4] ~?= 4,
    "caso1" ~: numeroDeElemento2 1 [1,2,3,5,6,7,8,4] ~?= 1,
    "caso1" ~: numeroDeElemento2 1 [2,3,5,6,7,8,1,4] ~?= 7
 ]

elementoN2Testing = test [
    "caso1" ~: elementoN2 4 [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= "Marra",
    "caso2" ~: elementoN2 1 [("Milei","juan")] ~?= "Milei",
    "caso5" ~: elementoN2 1 [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= "Milei",
    "caso5" ~: elementoN2 3 [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] ~?= "Cristina"

 ]

subMenosVotadoTesting = test [
    "caso1" ~: subMenosVotado [12,13,56,73] ~?= 12,
    "caso2" ~: subMenosVotado [12,13,1,1] ~?= 1,
    "caso3" ~: subMenosVotado [12,12,12,12] ~?= 12,
    "caso4" ~: subMenosVotado [73] ~?= 73,
    "caso5" ~: subMenosVotado [12,13,56,1] ~?= 1
 ]
menosVotadoTesting = test [
    "caso1" ~: menosVotado [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [12,13,56,73] ~?= "Milei",
    "caso2" ~: menosVotado [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [12,13,1,1] ~?= "Cristina",
    "caso3" ~: menosVotado [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [12,12,12,12] ~?= "Milei",
    "caso4" ~: menosVotado [("Milei", "Villarruel")] [73] ~?= "Milei",
    "caso5" ~: menosVotado [("Milei", "Villarruel"),("Macri","Pichetto"),("Cristina","Massa"),("Marra","Coscu")] [12,13,56,1] ~?= "Marra"
 ]

 --[("Tini", "Emilia"),("Lali","Nicki"),("Rebelde","Gay"),("Messi","Cristiano")]
 --[50,8,100,90]