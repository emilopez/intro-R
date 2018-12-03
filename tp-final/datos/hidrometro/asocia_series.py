fceneha = open("ceneha-cada12hs.csv")
fprefec = open("prefecturaSFe.csv")
foutput = open("ceneha_vs_prefectura.csv", "w")


data_ceneha = dict()
data_prefec = dict()

for linea in fceneha.readlines():
    fecha, altura = linea.split(";")
    data_ceneha[fecha] = altura

for linea in fprefec.readlines():
    fecha, altura = linea.split(";")
    data_prefec[fecha] = altura



for fecha,altura in data_ceneha.items():
    if data_prefec.get(fecha, False):
        foutput.write("{fecha} ; {altceneha} ; {altprefec}".format(fecha=fecha, altceneha=altura.strip(), altprefec=data_prefec[fecha]))
    else:
        foutput.write("{fecha} ; {altceneha} ; {altprefec}".format(fecha=fecha, altceneha=altura.strip(), altprefec="****************"))