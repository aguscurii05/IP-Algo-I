archivo = open('/home/Estudiante/Escritorio/texto','r')
contenido = archivo.readlines()
print(contenido)

#Ej 1.1

def contar_lineas(list:list[chr])->int:
    a:int=1
    for i in list:
        if '\n' in i:
            a+=1
    return a

def sacar_blancos(list:list[str])->list[str]:
    for i in range(0,len(list),1):
        n:bool=True
        c:int=0
        while n==True:
            if list[i][c]==' ':
                list[i] = list[i][c+1:len(list[i])]
                c+=1
            else:
                n=False
    return list

sacar_blancos(contenido)

def clonar_sin_comentarios(list:list[int])->list[int]:
    sacar_blancos(list)
    i:int=0
    while i<len(list):
        if list[i][0]=='#':
            list.remove(list[i])
            i=0
        else:
            i+=1
    archivo2 = open('/home/Estudiante/Escritorio/archivo2','w')
    archivo2.writelines(list)
    archivo2.close()

    
clonar_sin_comentarios(contenido)
print(contenido)