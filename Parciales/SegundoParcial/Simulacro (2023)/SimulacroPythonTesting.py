import SimulacroPython as sp

s1 = {'a':2,'b':7,'c':1}
s2 = {'a':2,'b':2,'c':2,'d':5}
s3 = {}
s4 = {'a':2,'b':2,'c':2,'d':5}


def contar_traducciones_iguales_testing():
    a = sp.contar_traducciones_iguales(s1,s2)==1
    b = sp.contar_traducciones_iguales(s1,s3)==0
    c = sp.contar_traducciones_iguales(s3,s3)==0
    d = sp.contar_traducciones_iguales(s4,s4)==4
    tests = [a,b,c,d]
    bien=0
    mal=0
    for test in tests:
        if test==True:
            bien+=1
        else:
            mal+=1
    print("Cases: "+str(len(tests))+" Good: "+str(bien)+" Bad: "+str(mal))
    
contar_traducciones_iguales_testing()

l1 = []
l2 = [1]
l3 = [1,2,2,3,3,3,1,1,4]
l4 = [1,2,3,4]
l5 = [1,1,1,1,1,1]


def convertir_a_diccionario_testing():
    a = sp.convertir_a_diccionario(l1)=={}
    b = sp.convertir_a_diccionario(l2)=={1:1}
    c = sp.convertir_a_diccionario(l3)=={1:3,2:2,3:3,4:1}
    d = sp.convertir_a_diccionario(l4)=={1:1,2:1,3:1,4:1}
    e = sp.convertir_a_diccionario(l5)=={1:6}
    tests = [a,b,c,d,e]
    bien=0
    mal=0
    for test in tests:
        if test==True:
            bien+=1
        else:
            mal+=1
    print("Cases: "+str(len(tests))+" Good: "+str(bien)+" Bad: "+str(mal))
    
convertir_a_diccionario_testing()
