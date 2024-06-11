import Parcial3 as p

def filtrar_codigos_primosTesting():
    a= p.filtrar_codigos_primos([343123,44332,343222,344167,343139])==[344167,343139]
    b= p.filtrar_codigos_primos([2342324342,554565656,3243424554])==[]
    c= p.filtrar_codigos_primos([3434691,343547,3434593])==[3434691,343547,3434593]
    
    bien,mal,tests=0,0,[a,b,c]
    
    for i in range(len(tests)):
        if tests[i]:
            bien+=1
        else:
            mal+=1
            print("Error test "+chr(i+97))
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Bad: "+str(mal))
    
filtrar_codigos_primosTesting()

def stock_productosTesting():
    a = p.stock_productos([("ibu",12),("antib",7),("lax",8),("ibu",3),("antib",15),("ibu",6),("lax",4)])=={'ibu':(3,12),'antib':(7,15),'lax':(4,8)}
    b = p.stock_productos([])=={}
    c = p.stock_productos([("ibu",12)])=={'ibu':(12,12)}
    d = p.stock_productos([("ibu",12),("ibu",20),("ibu",2),("ibu",1)])=={'ibu':(1,20)}
    e = p.stock_productos([("ibu",0),("ibu",0),("ibu",0),("ibu",0)])=={'ibu':(0,0)}
    f = p.stock_productos([("ibu",10),("ibu",10),("ibu",10),("ibu",10)])=={'ibu':(10,10)}
    g = p.stock_productos([("ibu",12),("antib",7),("lax",8),("ibu",3),("lax",13),("antib",4),("antib",15),("ibu",6),("lax",4),("ibu",1)])=={'ibu':(1,12),'antib':(4,15),'lax':(4,13)}
    bien,mal,tests=0,0,[a,b,c,d,e,f,g]
    
    for i in range(len(tests)):
        if tests[i]:
            bien+=1
        else:
            mal+=1
            print("Error test "+chr(i+97))
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Bad: "+str(mal))
    
stock_productosTesting()

def un_responsable_por_turnoTesting():
    a = p.un_responsanble_por_turno([["juan","gus"],
                                     ["juan","gus"],
                                     ["juan","gus"],
                                     ["juan","gus"],
                                     ["juan","gus"],
                                     ["juan","gus"],
                                     ["juan","gus"],
                                     ["juan","gus"]])==[(True,True),(True,True)]
    
    b= p.un_responsanble_por_turno([["lam","gus","chris","wos","chano","miranda","spinetta"],
                                    ["lam","gus","chris","wos","chano","miranda","charly"],
                                    ["lam","gus","chris","wos","miranda","miranda","charly"],
                                    ["lam","gus","chris","wos","chano","miranda","charly"],
                                    ["chris","gus","chris","wos","chano","miranda","charly"],
                                    ["lam","zeta","chris","wos","chano","miranda","charly"],
                                    ["lam","gus","chris","wos","chano","miranda","charly"],
                                    ["lam","gus","chris","wos","chano","miranda","charly"],])==[(True,False),(True,False),(True,True),(True,True),(False,True),(True,True),(False,True)]
    
    c= p.un_responsanble_por_turno([["lam","gus","chris","wos","miranda","miranda","spinetta"],
                                    ["lam","gus","chris","wos","miranda","miranda","spinetta"],
                                    ["lam","gus","chris","wos","miranda","miranda","spinetta"],
                                    ["lam","gus","chris","wos","miranda","miranda","spinetta"],
                                    ["chris","zeta","agus","nicky","chano","miranda","charly"],
                                    ["chris","zeta","agus","nicky","chano","miranda","charly"],
                                    ["chris","zeta","agus","nicky","chano","miranda","charly"],
                                    ["chris","zeta","agus","nicky","chano","miranda","charly"],])==[(True,True),(True,True),(True,True),(True,True),(True,True),(True,True),(True,True)]
    
    d = p.un_responsanble_por_turno([["muse"],["muse"],["muse"],["muse"],["top"],["top"],["top"],["top"]])==[(True,True)]
    e = p.un_responsanble_por_turno([["muse"],["muse"],["muse"],["muse"],["pepe"],["top"],["top"],["top"]])==[(True,False)]
    f = p.un_responsanble_por_turno([["muse"],["muse"],["pepe"],["muse"],["top"],["top"],["top"],["top"]])==[(False,True)]
    g = p.un_responsanble_por_turno([["muse"],["muse"],["p"],["muse"],["p"],["top"],["top"],["top"]])==[(False,False)]
    
    bien,mal,tests=0,0,[a,b,c,d,e,f,g]
    
    for i in range(len(tests)):
        if tests[i]:
            bien+=1
        else:
            mal+=1
            print("Error test "+chr(i+97))
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Bad: "+str(mal))
    
    
un_responsable_por_turnoTesting()

pe="perro"
g="gato"

def subsecuencia_mas_largaTesting():
    a = p.subsecuencia_mas_larga(["perro"])==0
    b = p.subsecuencia_mas_larga(["gato"])==0
    c = p.subsecuencia_mas_larga([pe,pe,pe,g,g,g,g,g,pe,pe,pe,"juan","ju","a",pe,pe,pe,pe,pe,pe,pe,pe])==14
    d = p.subsecuencia_mas_larga([pe,pe,pe,g,g,g,g,g,g,g,g,pe,pe,pe,"juan","ju","a",pe,pe,pe,pe,pe,pe,pe,pe])==3
    e = p.subsecuencia_mas_larga([pe,pe,pe,g,g,g,g,g,g,g,g,pe,pe,pe,"juan","ju","a",pe,pe,pe,pe,pe,pe,pe,pe,g,g,g,g,g,g,g,g])==3
    f = p.subsecuencia_mas_larga([pe,pe,pe,g,g,g,g,g,g,g,g,pe,pe,pe,"juan","ju","a",pe,pe,pe,pe,pe,pe,pe,pe,g,g,g,g,g,g,g,g,g])==25

    
    bien,mal,tests=0,0,[a,b,c,d,e,f]
    
    for i in range(len(tests)):
        if tests[i]:
            bien+=1
        else:
            mal+=1
            print("Error test "+chr(i+97))
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Bad: "+str(mal))
    
subsecuencia_mas_largaTesting()
    

    

    