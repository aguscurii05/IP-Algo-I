import Parcial2 as p
from queue import Queue as Cola

testin1 = Cola()
testin1.put(("pepe","vip")),testin1.put(("juan","comun")),testin1.put(("cabille","comun")),testin1.put(("marco","vip"))
testout1 = Cola()
testout1.put("pepe"),testout1.put("marco"),testout1.put("juan"),testout1.put("cabille")
testin2 = Cola()
testin2.put(("agus","vip"))
testin3 = Cola()
testin3.put(("agus","comun"))
testout = Cola()
testout.put("agus")
testin4 = Cola()
testin4.put(("muse","vip")),testin4.put(("indios","comun")),testin4.put(("cerati","vip")),testin4.put(("udsñ","comun")),testin4.put(("ryan","comun")),testin4.put(("top","vip")),testin4.put(("pepe","comun"))
testout4=Cola()
testout4.put("muse"),testout4.put("cerati"),testout4.put("top"),testout4.put("indios"),testout4.put("udsñ"),testout4.put("ryan"),testout4.put("pepe")

def exactas_bankTesting():
    a= p.exactas_bank(testin1).queue==testout1.queue
    b= p.exactas_bank(testin2).queue==testout.queue
    c= p.exactas_bank(testin3).queue==testout.queue
    d= p.exactas_bank(testin4).queue==testout4.queue

    bien,mal,tests=0,0,[a,b,c,d]
    for test in tests:
        if test==True:
            bien+=1
        else:
            mal+=1
            print(test)
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Error: "+str(mal))
    

def torneo_de_gallinas_testing():
    a= p.torneo_de_gallinas({"agus":"me desvio siempre",
                             "cami":"me la banco y no me desvio",
                             "clancy":"me la banco y no me desvio",
                             "coco":"me desvio siempre"})=={"agus":-40,"cami":15,"clancy":15,"coco":-40}
    b= p.torneo_de_gallinas({"agus":"me la banco y no me desvio","cami":"me desvio siempre"})=={"agus":10,"cami":-15}
    c= p.torneo_de_gallinas({"agus":"me desvio siempre",
                             "tyler":"me desvio siempre",
                             "josh":"me desvio siempre"})=={"agus":-20,"tyler":-20,"josh":-20}
    d= p.torneo_de_gallinas({"gus":"me la banco y no me desvio",
                             "zeta":"me la banco y no me desvio",
                             "charly":"me la banco y no me desvio"})=={"gus":-10,"zeta":-10,"charly":-10}
    bien,mal,tests=0,0,[a,b,c,d]
    for i in range(len(tests)):
        if tests[i]==True:
            bien+=1
        else:
            mal+=1
            print(i)
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Error: "+str(mal))
    

def quien_gano_el_tateti_facilitoTesting():
    a = p.quien_gano_el_tateti_facilito([['X','O','O','O','O'],
                                         ['O','X','X','X','X'],
                                         ['O','X','X','X','X'],
                                         ['X','O','O','O','O'],
                                         ['O','X','O','X','O']])==0
    
    b = p.quien_gano_el_tateti_facilito([['X','O','O','O','O'],
                                         ['O','X','X','X','X'],
                                         ['O','X','X','X','X'],
                                         ['X','O','X','O','O'],
                                         ['O','X','O','X','O']])==1
    
    c = p.quien_gano_el_tateti_facilito([['X','O','O','O','O'],
                                         ['O','X','X','X','X'],
                                         ['O','X','X','X','O'],
                                         ['X','O','O','O','O'],
                                         ['O','X','O','X','O']])==2
    
    d = p.quien_gano_el_tateti_facilito([['X','O','O','O','O','O'],
                                         ['O','X','X','X','X','O'],
                                         ['O','X','X','X','X','O'],
                                         ['X','O','O','O','O','X'],
                                         ['O','X','O','X','O','X'],
                                         ['X','X','X','X','X','X']])==3
    
    e = p.quien_gano_el_tateti_facilito([['O','O','O','O','O'],
                                         ['O','X','X','X','X'],
                                         ['O','X','X','X','X'],
                                         ['X','O','O','O','O'],
                                         ['O','X','O','X','O']])==2
    
    f = p.quien_gano_el_tateti_facilito([['O','X','O','X','O','X','X','X'],
                                         ['O','X','O','X','O','X','X','X'],
                                         ['X','O','X','O','X','O','O','O'],
                                         ['X','O','X','O','X','O','O','O'],
                                         ['O','X','O','X','O','X','X','X'],
                                         ['O','X','O','X','O','X','O','X'],
                                         ['X','O','X','O','X','O','O','O'],
                                         ['X','O','X','O','X','O','O','O'],
                                         ])==2
    g = p.quien_gano_el_tateti_facilito([['','','','','','','','',''],
                                         ['','','','','','','','',''],
                                         ['','O','','','','','','',''],
                                         ['','O','','','','','','',''],
                                         ['','','','','','','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','','','',''],])==1
    
    h = p.quien_gano_el_tateti_facilito([['','','','','','','','',''],
                                         ['','','','','','','','',''],
                                         ['','O','','','','','','',''],
                                         ['','O','','','','','','',''],
                                         ['','O','','','','','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','','','',''],])==3
    
    ii = p.quien_gano_el_tateti_facilito([['','','','','','','','',''],
                                         ['','O','','','','','','',''],
                                         ['','O','','','','X','','',''],
                                         ['','O','','','','','','',''],
                                         ['','','','','','','','',''],
                                         ['','','','','','O','','',''],
                                         ['','X','','','','X','','',''],
                                         ['','','','','','X','','',''],
                                         ['','','','','','','','',''],])==2
    

    bien,mal,tests=0,0,[a,b,c,d,e,f,g,h,ii]
    for i in range(len(tests)):
        if tests[i]==True:
            bien+=1
        else:
            mal+=1
            print("Error Caso "+chr(i+97))
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Error: "+str(mal))
    

def cuantos_sufijos_son_palindromosTesting():
    a= p.cuantos_sufijos_son_palindromos("a")==1
    b= p.cuantos_sufijos_son_palindromos("aaa")==3
    c= p.cuantos_sufijos_son_palindromos("nene")==2
    d= p.cuantos_sufijos_son_palindromos("abrigo")==1
    e= p.cuantos_sufijos_son_palindromos("neuquenneuquen")==3
    
    bien,mal,tests=0,0,[a,b,c,d,e]
    for i in range(len(tests)):
        if tests[i]==True:
            bien+=1
        else:
            mal+=1
            print("Error Caso "+chr(i+97))
    print("Cases: "+str(len(tests))+" || Good: "+str(bien)+" || Error: "+str(mal))
    
    
def testSuite():
    exactas_bankTesting()
    torneo_de_gallinas_testing()
    quien_gano_el_tateti_facilitoTesting()
    cuantos_sufijos_son_palindromosTesting()
    
testSuite()
    