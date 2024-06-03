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

#def buscar_el_maximo(p:Pila[int])->int:

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
