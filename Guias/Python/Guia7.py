#Ej 1.1

x:list[int]=[1,2,3,4,5]
e:int=90


def pertenece(x:list[int],e:int)->bool:
    res:bool = False
    n:int=0
    while (n<len(x) and res == False):
        res = (e == x[n])
        n=n+1
        
    return res

print(pertenece(x,e))


#Ej 1.2

import math

x:list[int]=[2,2,8,4,3]
e:int=2

def divide_a_todos(x:list[int],e:int)->bool:
    
    res:bool= True
    for i in range(0,len(x),1):

        res = res and math.fmod( x[i],e)==0
    return res

print(divide_a_todos(x,e))

#Ej 1.3

x:list[int]= [800000,2,6,8,6,4,3]

def suma_total(x:list[int])->int:
    y:int=0
    for i in range(0,len(x),1):
        y += x[i]
    return y

print(suma_total(x))

#Ej 1.4

x:list[int]= [1,2,3,1]

def ordenados(x:list[int])->bool:
    n:int=0
    res:bool=True
    while (n<len(x)-1):
        res = res and x[n] < x[n+1]
        n = n + 1
    return res

print(ordenados(x))

#Ej 1.5

def tiene_mas_de_siete(palabras:list[str])->bool:
    for palabra in palabras:
        res:bool=False
        res= res or len(palabra)>=7
    
    print(res)

#Ej 1.6


def palindromo(pal:str)->bool:
    a=math.floor(0.5*len(pal))
    for i in range(0,a,1):
        res:bool=True
        res = res and pal[i]==pal[len(pal)-1-i]
    print(res)

#Ej 1.7

def tiene_minusc(pal:str)->bool:
    res:bool=False
    for i in range(0,len(pal),1):
        subres:bool=False
        for j in range(0,26,1):
            subres= subres or pal[i]==chr(97+j)
        
        res= res or subres 
    return res

def tiene_mayusc(pal:str)->bool:
    res:bool=False
    for i in range(0,len(pal),1):
        subres:bool=False
        for j in range(0,26,1):
            subres= subres or pal[i]==chr(65+j)
        
        res= res or subres 
    return res

def tiene_digit(pal:str)->bool:
    res:bool=False
    for i in range(0,len(pal),1):
        subres:bool=False
        for j in range(0,10,1):
            subres= subres or pal[i]==str(j)
        
        res= res or subres 
    return res

def fortaleza(contra:str)->str:
    if tiene_mayusc(contra) and tiene_minusc(contra) and tiene_digit(contra) and len(contra)>8:
        res:str="VERDE"
    else:
        if len(contra)<5:
            res:str="ROJA"
        else:
            res:str="AMARILLA"
    return res
    
#Ej 1.8

def saldo(movimientos:list[(str,int)])->int:
    saldo:int=0
    for i in movimientos:
        if i[0]=="I":
            saldo=saldo+i[1]
        if i[0]=="R":
           saldo=saldo-i[1]
    print("Su saldo es de $" +str(saldo) )
       
#Ej 1.9

def vocales_distintas(palabra:str)->bool:
    vocales:str="aeiou"
    n:int=0
    for i in vocales:
        if i in palabra:
            n=n+1
    res:bool= n>=3
    print(res)

#Ej 2.1

def reemplazar_pares(lista:list[int])->list[int]:
    n:int=0
    for i in lista:
        if i%2==0:
            lista[n]=0
        n=n+1
    print(lista)

#Ej 2.2

def reemplazar_pares2(lista:list[int])->list[int]:
    lista2:list[int]=[]
    for i in lista:
        if i%2==0:
            lista2= lista2 + [0]
        else:
            lista2=lista2 + [i]
    print(lista2)

#Ej 2.3

def sacar_vocales(lista:str)->str:
    i:int=0
    while i<len(lista):
        if lista[i] in "aeiou":
            lista=lista[0:i]+lista[i+1:len(lista)]
            i=0
        else:
           i=i+1       
    print(lista)

#Ej 2.4

def reemplaza_vocales(s:list[chr])->list[chr]:
    lista:list[chr]=''
    for i in range(0,len(s),1):
        if s[i] in "aeiou":
            lista=lista
        else:
            lista=lista+s[i]
    print(lista)

#Ej 2.5
          
def da_vuelta_str(s:list[chr])->list[chr]:
    lista:list[chr]=''
    for i in range(0,len(s),1):
        lista=lista+s[len(s)-i-1]
    print(lista)
    
#Ej 2.6

def eliminar_repetidos(s:list[chr])->list[chr]:
    lista:list[chr]=''
    for i in range(0,len(s),1):
        if s[i] in s[i+1:len(s)]:
            lista=lista
        else:
            lista=lista+s[i]
    print(lista)
            
#Ej3

def aprobado(s:list[int])->int:
    sub_res:bool=True
    for i in s:
        sub_res=sub_res and i>=4
    if sub_res==True and round(sum(s)/len(s))>=7:
        res:int=1
    else:
        if sub_res==True and 4<=round(sum(s)/len(s))<=7:
            res:int=2
        else:
            res:int=3
    print(res)
    
aprobado([1,5,3,33])

#Ej 4.1

def estudiantes()->list[str]:
    nom:str=[]
    lista:list[str]=[]
    while nom!="listo":
        nom=input("Ingrese el nombre del estudiante")
        if nom!="listo":
            lista=lista+[nom]
    print(lista)
        
#Ej 4.2

def monedero()->list[int]:
    op:str=""
    lista:list[(str,int)]=[]
    while op!="X":
        op:str=input("Ingrese una opcion: C, D, X: ")
        if op=="C" or op=="D":
            monto:int=input("Ingrese el monto: ")
            lista= lista+[(op,monto)]
    print(lista)

#Ej 4.3
import random

def siete_y_medio():
    print("EL JUEGO 7 Y MEDIO")
    op:str=""
    cartas:list[int]=[]
    historial:list[int]=[]
    while op!="no":
        carta= random.choice([1,2,3,4,5,6,7,10,11,12])
        print("Su carta es " + str(carta))
        historial=historial+[carta]
        if 1<=carta<=7:
            cartas=cartas+[carta]
            
        else:
            cartas=cartas+[0.5]
        if sum(cartas)>7.5:
            print("Ha perdido, su total es de " + str(sum(cartas)))
            op="no"
        else:
            if sum(cartas)==7.5:
                print("Ha ganado")
                op="no"
            else:
                op:str=input("Desea seguir sacando cartas? ")
        
    print("Sus cartas fueron: " + str(historial))
        
#Ej 5.1 & Ej 5.2
#En el primer ejercicio res debe devolver en los primeros |s| elementos True o False si e pertenece a la iesima lista.
#Sin embargo de |s| en adelante puede devolver cualquier otro valor. En cambio en el segundo ejercicio, solo se devolvera
#una lista de |s| valores donde cada posicion sera un True o False respecto a si e pertence a la iesima lista. Como la implementacion 
#devuelve una lista de tamaño |s|, cumple ambas implementaciones. Una implementacion que cumpla 5.2 cumplira 5.1, pero una que cumpla 5.1
#no cumplira necesariamente 5.2


def pertenece_a_cada_uno_version1(listas:list[list[int]],e:int)->list[bool]:
    res:list[bool]=[]
    for i in listas:
        res=res+[pertenece(i,e)]
    
    return res

#Ej 5.3

def es_matriz(s:list[list[int]])->bool:
    sub_res:bool=True
    for i in s:
        sub_res= sub_res and len(i)==len(s[0])
    res:bool= len(s)>0 and len(s[0])>0 and sub_res
    return res

#Ej 5.4

def filas_ordenadas(s:list[list[int]])->list[bool]:
    res:bool=True
    for i in s:
        res= res and ordenados(i)
    return res

#Ej 5.5

import numpy as np

def elevar_matriz(m1:list[list[int]],m2:list[list[int]])->list[list[int]]:
    res:list[list[int]]=[]
    
    for i in range(0,len(m1),1):
        fila:list[int]=[]
        for j in range(0,len(m1[i]),1):
            elem:int=0
            for k in range(0,len(m1),1):
                elem=elem + m1[i][k]*m2[k][j]
            fila.append(elem)
        res.append(fila)
    return res

def elevar_matriz_a_n(d:int,n:int)->list[list[int]]:
    m:list[list[int]]=np.random.randint(0,9, (d, d))
    res:list[list[int]]=m
    for i in range (1,n,1):
        res = elevar_matriz(res,m)
    print(m)
    print(res)

elevar_matriz_a_n(3,2)
   
  




