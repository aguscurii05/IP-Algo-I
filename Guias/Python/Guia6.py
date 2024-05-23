#Ej 1.1

def imprimir_hola_mundo():
    print("hola mundo")

imprimir_hola_mundo()

#Ej 1.2
def imprimir_un_verso():
    print(a)

a= "It's way too late \n To be this locked inside ourselves \n The trouble is \n That you're in love with someone else \n It should be me \n Oh, it should be me"

imprimir_un_verso()

#Ej 1.3

import math

def raizDe2():
    a = math.sqrt(2)
    b = round(a, 4)
    return b

z= raizDe2()
print(z)

#Ej 1.4

def factorial_de_dos():
    a = math.factorial(2)
    print (a)

factorial_de_dos()

#Ej 1.5

def perimetro():
    res = 2*3.14
    return res


a= perimetro()

print(a)


#Ej 2.1

def imprimir_saludo(nombre:str):
    print(f"Hola {nombre}")

#Ej2.3

def fahrenheit_a_celsius (temp_far:float):
    res:float=0
    res= ((temp_far-32)*5)/9
    return res

print(fahrenheit_a_celsius(20))

#Ej2.4

a= "It's way too late \n To be this locked inside ourselves \n The trouble is \n That you're in love with someone else \n It should be me \n Oh, it should be me"

def imprimir_dos_veces ():
    res:str= a
    res *= 2
    return res

print(imprimir_dos_veces())

#Ej2.5

def es_multiplo(n:int,m:int):
    
    t:bool=False
    k:int=0
    while (t==False and n>=m and n>=k*m):
        if n==m*k:
            t = True
        else:
            t=False
        k=k+1
        
    return t
           
    
print(es_multiplo(4,2))

#Ej2.6
n:int=5

def es_par(n:int):
    res:bool=False
    res = es_multiplo(n,2)
    return res

print(es_par(n))

comensales:int= 6
min_cant_de_porciones:int=7

def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int):
    res:int=0
    porciones:int= comensales*min_cant_de_porciones
    if porciones<8 :
        res= 1
    else:
        res= (math.ceil(porciones/8))
    return res

print(cantidad_de_pizzas(comensales,min_cant_de_porciones))

#Ej3.1

num1:float=0
num2:float=0

def alguno_es_0(num1:float,num2:float):
    res:bool=False
    res= num1==0 or num2==0
    return res

print(alguno_es_0(num1,num2))

#Ej3.2

def ambos_son_0(num1:float,num2:float):
    res:bool=False
    res= num1==0 and num2==0
    return res

print(ambos_son_0(num1,num2))

#Ej3.3

def es_nombre_largo(nombre:list[chr]):
    res:bool= 3<=len(nombre) and 8>= len(nombre)
    return res

print(es_nombre_largo("123456789"))

#Ej3.4

def es_bisiesto(año:int):
    res:bool=False
    res= año%400==0 or (año%4==0 and año&100!=0)
    return res

print(es_bisiesto(2016))

#Ej4

def peso_pino(metros:float):
    peso:int= min(metros,3)*300 + max(0,metros-3)*200
    return peso
        
def es_peso_util(peso:int):
    res:bool= min(peso,400)>=400 and max(peso,1000)<=1000
    return res

def sirve_pino(alt:int):
    res:bool = max(alt,3.5)<=3.5 and min(alt,4/3)>=4/3
    return res

def sirve_pino(alt:int):
    res:bool= es_peso_util(peso_pino(alt))
    return res

#Ej5.1

def devolver_el_doble_si_es_par(num:int):
    if num%2==0:
        num *=2
        return num
    else:
        return num

#Ej5.2

def devolver_valor_si_es_par_sino_el_que_sigue(num:int):
    if num%2!=0:
        num=num+1
    return num

#Ej5.3

#Espeficicacion
#problema devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(inout num:int):int{
#    requiere:{True}
#    asegura:{res el doble de num si su resto mod 3 es 0 y su resto mod 9 no es 0}
#    asegura:{res el triple de num si su resto mod 9 es 0}
#}

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(num:int)->int:
    if num%3==0 and num%9!=0 :
        num *=2
    else:
        if num%9==0:
            num*=3
    return num

#Ej5.4

def lindo_nombre(nombre:str)->str:
    if len(nombre)>=5:
        res:str="Tu nombre tiene muchas letras!"
    else:
        res:str="Tu nombre tiene menos de 5 caracteres"
    return res

#Ej5.5

def elRango(num:int)->str:
    if num<=5:
        print("Menor a 5")
    else:
        if 10<=num<=20:
            print("entre 10 y 20")
        else:
            if 20<=num:
                print("Mayor a 20")
                
#Ej5.6

#Espeficicacion
#problema vacaciones_o_trabajo(in sexo:str,in edad:int):str{
#    requiere:{0<=edad}
#    requiere:{sexo="M" o sexo="F"}
#    asegura:{si edad es menor a 18 se imprima en pantalla "anda de vacaciones"}
#    asegura:{si edad es mayor a 65 o, edad es mayor a 60 y sexo es "F", se imprima en pantalla "anda de vacaciones"}
#    asegura:{si edad es mayor a 18 y menor a 60 o edad es mayor a 18 y menor a 65 y sexo es "M" se imprime en pantalla "anda a trabajar"}
#}

def vacaciones_o_trabajo(sexo:str,edad:int)->str:
    if edad<=18 or edad>=65 or (edad>=60 and sexo=="F"):
        print("anda de vacaciones")
    else:
        print("anda a trabajar")
"""
#Ej 6.1

def num1_10():
    n=1
    while(n<=10):
        print(n)
        n += 1


#Ej 6.2

n = 10
while (n<=40):
    print(n)
    n = n+2

#Ej 6.3

def eco():
    n=1
    while(n<=10):
        print("eco")
        n += 1

#Ej 6.4



def cuenta_Regresiva(n:int):
    
    while(n > 0):
        print(n)
        n = (n)-1
        if (n==0):
            print("¡Despegue!")

a = cuenta_Regresiva(5)
print(a)

#Ej 6.5

"""