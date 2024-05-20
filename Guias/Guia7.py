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


       

