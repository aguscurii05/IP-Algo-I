#Ej1

def esPrimo(n:int)->bool:
    divisores:int=2
    i:int=2
    res:bool=True
    while divisores<=2 and i<n:
        if n%i==0:
            res=False
        i+=1
    return res
def filtrar_codigos_primos(codigos_barra:list[int])->list[int]:
    res:list[int]=[]
    for codigo in codigos_barra:
        if esPrimo(codigo%1000):
            res.append(codigo)
    return res

#Ej2

def stock_productos(stock_cambios:list[(str,int)])->dict[str,(int,int)]:
    res:dict[str,(int,int)]={}
    for elem in stock_cambios:
        stock:int=elem[1] #segundo valor de la tupla 
        key:str=elem[0] #primer valor de la tupla(producto)
        if key not in res:
            res[key]=(stock,stock)
        else:
            max:int=res[key][1] #accedo al segundo valor(max stock) del segundo elemento(la tupla) con la clave(nombre del prod)
            min:int=res[key][0] #accedo al segundo valor(min stock) del segundo elemento(la tupla) con la clave(nombre del prod)
            if stock>max: 
                res[key]=(min,stock)
                
            if stock<min: 
               res[key]=(stock,max)
    return res

def inv_mtr(grilla:list[list[str]])->list[list[str]]: #esta funcion invierte la matriz
    grilla2:list[list[str]]=[]
    for i in range(len(grilla[0])): #creo una lista de |grilla[0]| listas vacias
        grilla2.append([])
    for horario in grilla:
        for i in range(len(horario)):
            grilla2[i].append(horario[i]) #agrego el n-horario a la n-lista(dia)
    return grilla2

def un_responsanble_por_turno(grilla:list[list[str]])->list[(bool,bool)]:
    grilla_inv:list[list[str]]=inv_mtr(grilla)
    res:list[(bool,bool)]=[]
    for horario in grilla_inv:
        if horario[0]==horario[1]==horario[2]==horario[3]:
            sub1:bool=True
        else:
            sub1=False
        if horario[4]==horario[5]==horario[6]==horario[7]:
            sub2:bool=True
        else:
            sub2=False
        res.append((sub1,sub2))
    return res

def subseq(pacientes:list[str])->list[(int,int)]:
    res=[]
    j:int=0
    while j<(len(pacientes)):
        cont=0
        if pacientes[j]=="perro": #si la palabra es perro chequea cuantas de las palabras siguientes son perro
            ind=j
            while j<len(pacientes) and pacientes[j]=="perro":
                cont+=1
                j+=1
            res+=[(ind,cont)]
        elif pacientes[j]=="gato": #si la palabra es gato chequea cuantas de las palabras siguientes son gato
            ind=j
            while j<len(pacientes) and pacientes[j]=="gato":
                cont+=1
                j+=1
            res+=[(ind,cont)]
        else:
            j+=1
    return res

def subsecuencia_mas_larga(tipos_de_pacientes_atendidos:list[str])->int:
    subsecuencias=subseq(tipos_de_pacientes_atendidos)
    valmax=0
    res=0
    for subsec in subsecuencias:
        if subsec[1]>valmax:
            valmax=subsec[1]
            res=subsec[0]
    return res

    
