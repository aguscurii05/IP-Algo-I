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

