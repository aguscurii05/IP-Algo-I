from queue import Queue as Cola

#EJ1

def exactas_bank(filaClientes:Cola[str,str])->Cola[str]:
    clientes:list[(str,str)]=[]
    vip:list[str]=[]
    comun:list[str]=[]
    while filaClientes.empty()==False:
        a = filaClientes.get()
        clientes.append(a)
        if a[1]=="vip":
            vip.append(a[0])
        else:
            comun.append(a[0])
    subres=vip+comun
    res= Cola()
    for i in range(len(clientes)):

        filaClientes.put(clientes[i])
        res.put(subres[i])
    return res

#EJ2

def torneo_de_gallinas(estrategias:dict[str,str])->dict[str,int]:
    estrategia:list[int]=[0,0]
    res:dict[str,int]={}
    for elem in list(estrategias.values()):
        if elem=="me desvio siempre":
            estrategia[0]+=1
        else:
            estrategia[1]+=1
    for key in estrategias:
        if estrategias[key]=="me desvio siempre":
            estrategia[0]-=1
            res[key]=estrategia[0]*(-10)+estrategia[1]*(-15)
            estrategia[0]+=1

        else:
            estrategia[1]-=1
            res[key]=estrategia[0]*(10)+estrategia[1]*(-5)
            estrategia[1]+=1

    return res

#EJ3

def invertir_matriz(tablero:list[list[chr]])->list[str]:
    tablero2:list[list[chr]]=[]
    for i in range(len(tablero)):
        tablero2.append("")
    for fila in tablero:
        for i in range(len(fila)):
            tablero2[i]+=fila[i]
    return tablero2


def quien_gano_el_tateti_facilito(tablero:list[list[chr]])->int:
    tablero2:list[str] = invertir_matriz(tablero)
    contX=0
    contO=0
    for i in range(len(tablero2)):
        if "XXX" in tablero2[i]:
            contX+=1 #cuantos XXX hay
        if "OOO" in tablero2[i]:
            contO+=1 #cuantos OOO hay
    if contX==1 and contO==1:
        res:int=3 #trampa
    elif contX==1 and contO==0:
        res:int=1 #ana
    elif contX==0 and contO==1:
        res:int=2 #beto
    else:
        res:int=0 #empate
    return res

#EJ4

def subseq(texto:str,desde:int)->str:
    res:str=""
    for i in range(len(texto)):
        if i>=desde:
            res+=texto[i]
    return res

def sufijos(texto:str)->list[str]:
    res:list[str]=[]
    for i in range(len(texto)):
        res.append(subseq(texto,i))
    return res

def cuantos_sufijos_son_palindromos(texto:str)->int:
    lista_sufijos:list[str]=sufijos(texto)
    res:int=0
    for sufijo in lista_sufijos:
        inverso:str=""
        for chr in range(len(sufijo)-1,-1,-1):
            inverso+=sufijo[chr]
        if sufijo==inverso:
            res+=1
    return res
            