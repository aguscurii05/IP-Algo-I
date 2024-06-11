#ORGANIZANDO INGRESANTES
#Realizar un sistema de procesamiento que dada una Cola con ingresantes a un club
#los ordene para que luego un empleado pueda procesar las solicitudes de admision.
#Por cada ingresante se tiene nombre,edad y actividad(futbol,basquet o natacion)
#Se pide implementar en python una funcion que clasifique a los ingresantes por 
#deporte almacenandolos en un diccionario siendo las claves los deportes. Luego en
#en cada deporte debera haber un diccionario con los nombres como claves y el rango
#etario como valor,donde puede ser joven si es menor de 18, adulto si es mayor a 18 
# y menor a 60 ,y mayor si es mayor a 60

#problema organizar_ingresantes(in ingresantes:Cola[(str,int,str)])->dict[dict[(str,str)]]{
    
#    requiere:{la segunda componente de las tuplas este entre 0 y 100}
#    requiere:{la tercer componente de las tuplas sea "futbol","basquet" o "natacion"}
#    requiere:{ingresantes no tiene primeras componentes repetidas en las tuplas}
#    requiere:{la primer componente de las tuplas de ingresantes no puede ser un string vacio}
#    requiere:{|ingresantes|>0}

#    asegura:{res tendra como claves a los deportes "futbol","basquet" y "natacion"}
#    asegura:{res[deporte] sera un diccionario donde las claves seran los elementos de
#             la primer componente de las tuplas y los valores podran ser "joven","adulto" o "mayor"}
#    asegura:{todos las primeras componentes de ingresantes pertenecen a alguno de los tres diccionarios}
#    asegura:{|res['futbol']|+|res['natacion']|+|res['basquet']|=|ingresantes|}
#}

from queue import Queue as Cola

def organizar_ingresantes(ingresantes:Cola[(str,int,str)])->dict[dict[str,str]]:
    lista_ingresantes:list[(str,int,str)]=[]
    while not ingresantes.empty():
        elem=ingresantes.get()
        lista_ingresantes.append(elem)
    res:dict[dict[str,str]]={'futbol':{},'basquet':{},'natacion':{}}
    
    for ingresante in lista_ingresantes:
        nombre=ingresante[0]
        edad=ingresante[1]
        deporte=ingresante[2]
        if 0<=edad<=18:
            rango="joven"
        elif 18<edad<60:
            rango="adulto"
        else:
            rango="mayor"
        if deporte=="futbol":
            res['futbol'][nombre]=rango
        elif deporte=="basquet":
            res['basquet'][nombre]=rango
        else:
            res['natacion'][nombre]=rango
    for i in lista_ingresantes:
        ingresantes.put(i)
    return res





        
test = Cola()
test.put(("juan",20,"futbol")),test.put(("pepe",70,"natacion")),test.put(("taylor",2,"basquet")),
test.put(("guido",15,"basquet")),test.put(("agus",24,"basquet")),test.put(("gus",70,"natacion")),
test.put(("zeta",50,"futbol")),test.put(("lampone",63,"basquet")),test.put(("santos",40,"futbol")),
test.put(("ravenna",12,"natacion")),test.put(("medina",72,"natacion"))

print(organizar_ingresantes(test))

        
