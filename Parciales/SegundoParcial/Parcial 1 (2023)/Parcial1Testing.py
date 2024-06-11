import Parcial1 as p

def acomodarTesting():
    a= p.acomodar(["UP"])==["UP"]
    b= p.acomodar(["LLA"])==["LLA"]
    c= p.acomodar(["LLA","UP","UP","LLA","LLA","UP","UP","LLA","UP","UP","LLA"])==["UP","UP","UP","UP","UP","UP","LLA","LLA","LLA","LLA","LLA",]
    tests = [a,b,c]
    bien=0
    mal=0
    for test in tests:
        if test==True:
            bien+=1
        else:
            mal+=1
    print("Cases: "+str(len(tests))+" Good: "+str(bien)+" Bad: "+str(mal))
    

def pos_umbralTesting():
    a= p.pos_umbral([],3)==-1
    b= p.pos_umbral([5],3)==0
    c= p.pos_umbral([5],7)==-1
    d= p.pos_umbral([5,-2,3,-5,-4,3,2],100)==-1
    e= p.pos_umbral([5,-2,3,-5,-4,3,2],10)==5


    tests = [a,b,c,d,e]
    bien=0
    mal=0
    for test in tests:
        if test==True:
            bien+=1
        else:
            mal+=1
    print("Cases: "+str(len(tests))+" Good: "+str(bien)+" Bad: "+str(mal))


def columnas_repetidasTesting():
    a=p.columnas_repetidas([[1,1]])==True
    b=p.columnas_repetidas([[1,2,1,2],[2,3,2,3]])==True
    c=p.columnas_repetidas([[1,2,1,2],[2,3,2,5]])==False
    d=p.columnas_repetidas([[1,2,1,2],[2,3,2,3],[7,7,7,7]])==True
    e=p.columnas_repetidas([[3,4,5,3,4,5],[2,3,2,2,3,2],[1,5,9,1,5,9]])==True
    f=p.columnas_repetidas([[3,4,5,3,4,5],[2,3,2,3,2,3],[1,5,9,41,5,9]])==False
    
    tests = [a,b,c,d,e,f]
    bien=0
    mal=0
    for i in range(0,len(tests),1):
        if tests[i]==True:
            bien+=1
        else:
            mal+=1
            print(i)
    print("Cases: "+str(len(tests))+" Good: "+str(bien)+" Bad: "+str(mal))
  
def cuenta_posiciones_por_nacionTesting():
    a=p.cuenta_posiciones_por_nacion({},{})=={}
    b=p.cuenta_posiciones_por_nacion({'arg'},{2024:['arg'],2023:['arg']})=={'arg':[2]}
    c=p.cuenta_posiciones_por_nacion({'arg','bra','uru'},{2024:['arg','bra','uru'],2023:['bra','uru','arg'],2022:['arg','uru','bra']})=={'arg':[2,0,1],'bra':[1,1,1],'uru':[0,2,1]}
    d=p.cuenta_posiciones_por_nacion({},{2024:[],2023:[]})=={}
    e=p.cuenta_posiciones_por_nacion({'arg','bra','uru'},{})=={'arg':[0,0,0],'bra':[0,0,0],'uru':[0,0,0]}
    
    tests = [a,b,c,d,e]
    bien=0
    mal=0
    for i in range(0,len(tests),1):
        if tests[i]==True:
            bien+=1
        else:
            mal+=1
            print(i)
    print("Cases: "+str(len(tests))+" Good: "+str(bien)+" Bad: "+str(mal))


    

def testSuite():
    print("Ej1")
    acomodarTesting()
    print("Ej2")
    pos_umbralTesting()
    print("Ej3")
    columnas_repetidasTesting()
    print("Ej4")
    cuenta_posiciones_por_nacionTesting()
    
testSuite()
