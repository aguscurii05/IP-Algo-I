#Ej 1.1

def contar_lineas(list:list[chr])->int:
    a:int=1
    for i in list:
        if '\n' in i:
            a+=1
    return a

#Ej 1.2

def existe_letra(letra:chr,file:str)->list[int]:
    res=[]
    i:int=0
    while 0<=i<len(file):
        if letra==file[i]:
            res=res+[i]
            i+=1
        else:
            i+=1
    return res

def existe_palabra(palabra:str,file:str)->bool:
    res=False
    for i in existe_letra(palabra[0],file):
        subres=True
        for j in palabra:
            if j==file[i]:
                subres=subres and True
                i+=1
            else:
                subres=False 
        res=res or subres
    return res

#Ej 1.3
def concat_list(lista:list[str])->str:
    copy:str=""
    for i in lista:
        copy = copy + i
    return str(copy)

def cant_apariciones(palabra:str,archivo:str)->int:
    copia = open(archivo,'r')
    copia_lineas = copia.readlines()
    file = concat_list(copia_lineas)
    res=0
    for i in existe_letra(palabra[0],file):
        subres=True
        for j in palabra:
            if j==file[i]:
                subres=subres and True
                i+=1
            else:
                subres=False 
        if subres==True:
            res+=1
    return res

#Ej 2

def clonar_sin_comentarios(archivo:str)->list[str]:
    copia = open(archivo,'r')
    list= copia.readlines()
    i=0
    while i<len(list):
        n:bool=True
        list2=list[i]
        while n==True:
            if list2[0]==' ':
                list2 = list2[1:len(list2)]
            elif list2[0]=='#':
                list.pop(i)
                n=False
            else:
                n=False
                i+=1
    archivo2 = open('archivo2','w')
    archivo2.writelines(list)
    archivo2.close()
    archivo.close() 
#Ej 3

def borrar_saltos(lista:list[str])->list[str]:
    n:int=0
    for i in lista:
        if i[len(i)-1]=='\n':
            lista[n]=i[0:len(i)-1]
        n+=1
    return lista        

def invertir_lineas(archivo:str):
    copia = open(archivo,'r')
    list1:list[str] = borrar_saltos(copia.readlines())
    list2:list[str]=[]
    n:int=len(list1)-1
    while n>=0:
        list2=list2+[list1[n]+'\n']
        n-=1
        reverso = open('reverso','w')
        reverso.writelines(list2)
        reverso.close()
 
#Ej 4
    
def agregar_frase_al_final(archivo:str,frase:str):
    file = open(archivo,'r')
    lineas = file.readlines()
    lineas = lineas + ['\n'+frase]
    file = open(archivo,'w')
    file.writelines(lineas)

#Ej 5 

def agregar_frase_al_inicio(archivo:str,frase:str):
    file = open(archivo,'r')
    lineas = file.readlines()
    lineas = [frase+'\n'] + lineas
    file = open(archivo,'w')
    file.writelines(lineas)

#Ej 6
    
def abrir(archivo:str)->list[str]:
    file = open(archivo,'rb')
    file=file.read()
    print(file)

#Ej 7

def csv_a_lista(notas:str):
    
    notas_lista:list[str]=open(notas,'r')
    notas_lista=notas_lista.readlines()
    res:list[list]=[]
    
    for i in range(0,len(notas_lista),1): #accedo a la linea
        
        subres:list=[]
        pal:str=''
        
        for j in range(0,len(notas_lista[i]),1): #accedo a cada elemento de la linea
            
          if notas_lista[i][j]!=',' and notas_lista[i][j]!="\n":
            pal=pal+notas_lista[i][j]
          else:
            subres=subres+[pal] #separo por comas agregando cada palabra a subres, una list[str]
            pal=''
          if j==len(notas_lista[i])-1 and notas_lista[i][j]!="\n":
            subres=subres+[pal]
        
        res=res+[subres] #agrego a res subres, siendo res list[list[str]]
    return res

def promedio_estudiante(notas:str,lu:str)->float:
    
    lista:list[str]=csv_a_lista(notas)
    sum_notas:float=0
    cont:int=0
    
    for i in range(0,len(lista),1):
        
        if lista[i][0]==lu: #accedo a la LU y corroboro si es la ingresada
            sum_notas+=float(lista[i][3]) #acumulo la suma de notas
            cont+=1 #acumulo la cantidad de notas
            
    return str(sum_notas/cont) #devuelvo como string(por utilidad) el promedio

def calcular_promedio_por_estudiante(notas:str,promedios:str):
    
    lista:list[list[str]]=csv_a_lista(notas)
    lista_LU:list[str]=[]
    
    for i in range(0,len(lista),1): #creo un for que recorra todas las LU del archivo notas
        if not(lista[i][0] in lista_LU):
            lista_LU=lista_LU+[lista[i][0]] #si la LU no fue agregada, se agrega, para evitar repeticiones
            
    promedios = open(promedios,'w') #abro el archivo donde almacenare el resultado
    for j in range(0,len(lista_LU),1):
        promedios.writelines(lista_LU[j]+','+promedio_estudiante(notas,lista_LU[j])+"\n") #escribo una linea que tenga la LU y su promedio
    promedios.close()

calcular_promedio_por_estudiante("notas.csv","promedios")

import random
from queue import LifoQueue as Pila

#Ej 8

def generar_nros_al_azar(cant:int,desde:int,hasta:int)->Pila[int]:
    pila_nums= Pila()
    for i in range(0,cant,1):
        num:int=random.randint(desde,hasta)
        pila_nums.put(num)
    return pila_nums

#Ej 9

def cantidad_elem_pila(p:Pila)->int:
    pila_list:list=[]
    while p.empty()==False:
        elem = p.get()
        pila_list:list= pila_list + [elem]
    res:int=len(pila_list)
    for i in range(len(pila_list)-1,0,-1):
        p.put(pila_list[i])
    return res

#Ej 10

def buscar_el_maximo(p:Pila[int])->int:
    pila_list:list=[]
    while p.empty()==False:
        elem = p.get()
        pila_list:list= pila_list + [elem]
    res:int=0
    for i in range(len(pila_list)-1,-1,-1):
        if res>=pila_list[i]:
            res = res
        else:
            res=pila_list[i]
        p.put(pila_list[i])
    return res
    
#Ej 11
"""
def esta_bien_balanceada(s:str)->bool:
    c:str=''
    for i in range(0,len(s),1):
        if s[i]!=' ':
            c = c+s[i]
    cont:int=0
    cont2:int=0

    print(c)
    op:list[str]=['+','-','*','/']
    for i in range(0,len(s),1):
        if c[i] in op:
            if (c[i-1] in op+['()']) or (c[i-1] in op+['()'])
        
    if cont==0:
        res:bool=True
    else:
        res:bool=False
    return res

print(esta_bien_balanceada("4+6-7+/5"))
 """
 
#Ej 12

def calc(num1,op,num2):
    if op=='+':
        res= num1+num2
    if op=='-':
        res= num2-num1
    if op=='*':
        res= num1*num2
    if op=='/':
        res= num2/num1
    return res

def evaluar_expr(s:str)->float:
    c:list[str]=[]
    op:list[str]=['+','-','*','/']
    i:int=0
    while i<len(s):
        if s[i]!=' ':
            if i!=len(s)-1 and s[i+1]!=' ':
                c=c+[s[i]+s[i+1]]
                i+=1
            else:
                c=c+[s[i]]
        i+=1
    pila=Pila()
    for i in range(0,len(c),1):
        if not(c[i] in op):
            pila.put(c[i])
        if c[i] in op:
            num1=pila.get()
            num2=pila.get()
            pila.put(calc(float(num1),c[i],float(num2))) 
    return pila.get()



from queue import Queue as Cola

#Ej 13

def generar_nros_al_azar2(cant:int,desde:int,hasta:int)->Cola[int]:
    cola_nums= Cola()
    for i in range(0,cant,1):
        num:int=random.randint(desde,hasta)
        cola_nums.put(num)
    return cola_nums

#Ej 14

def cantidad_elem_cola(p:Cola)->int:
    cola_list:list=[]
    while p.empty()==False:
        elem = p.get()
        cola_list:list= cola_list + [elem]
    res:int=len(cola_list)
    for i in range(0,len(cola_list),1):
        p.put(cola_list[i])
    return res

#Ej 15

def buscar_el_max2(p:Cola)->int:
    cola_list:list=[]
    while p.empty()==False:  #vacio la cola en una lista
        elem = p.get()
        cola_list:list= cola_list + [elem]
    
    for i in range(0,len(cola_list),1):
        p.put(cola_list[i]) #vuelvo a llenar la cola
    
    while len(cola_list)>1: #busco el maximo en la lista
        if cola_list[0]>=cola_list[1]:
            cola_list.pop(1)
        elif cola_list[1]>cola_list[0]:
            cola_list.pop(0)
    return cola_list[0]
        
#Ej 16.1 

def armar_secuencia_bingo()->Cola[int]:
    nums:list[int]=[]
    for i in range(0,10,1):
        nums = nums + [i]
    cola_nums:Cola[int]=Cola()
    while len(nums)>0:
        i:int = random.randint(0,len(nums)-1)
        cola_nums.put(nums[i])
        nums.pop(i)
    return cola_nums


def pertenece(elem:int,list:list[int])->bool:
    i:int=0
    res:bool=False
    while i<len(list):
        if elem==list[i]:
            res=res or True
            i=len(list)
        else:
            i+=1
    return res

def jugar_carton_bingo(carton:list[int],bolillero:list[int])->int:
    bolillero_list:list[int]=[]
    for i in range(0,10,1):
        bolillero_list = bolillero_list + [bolillero.get()]
    cond:bool=True
    subcond:int=0
    i:int=0
    while cond==True:
        if pertenece(bolillero_list[i],carton):
            subcond+=1
        i+=1
        if subcond==3:
            cond=False   
    return i 

#Ej 19 

def archivo_a_palabras(archivo:str)->list[str]:
    file = open(archivo,'r')
    file = file.readlines()
    res:list[str]=[]
    for i in range(0,len(file),1):
        pal:list[chr]=""
        for j in range(0,len(file[i]),1):
            if file[i][j]!=' ' and file[i][j]!='\n':
                pal+=file[i][j]
            elif file[i][j]=='\n' or file[i][j]==' ':
                res=res+[pal]
                pal=""
    res=res+[pal]
    return res

def agrupar_por_long(archivo:str)->dict:
    palabras = archivo_a_palabras(archivo)
    res:dict[int,int]= {}
    for i in range(0,len(palabras),1):
        clave:int= len(palabras[i])
        if clave in res:
            res[clave]+=1
        else:
            res[clave]=1
    return res
            
print(agrupar_por_long("ej19.txt"))
        
        
    