finput = open("ceneha-fixed.csv")
output = open("ceneha-cada12hs.csv", "w")

data = dict()

# cargo todo en un diccionario
for linea in finput.readlines():
    # dejo solo un valor cada 15 minutos
    fecha, altura = linea.split(";")
    data[fecha] = altura

# guardo solamente los de las 00:00 y 12:00
data2 = dict()
for k,v in data.items():
    fecha, _ = k.split(" ")
    key12 = fecha + " 12:00"
    key00 = fecha + " 00:00"
    if data.get(key12, "ko") != "ko":
        #print(key12, data[key12], end="") 
        data2[key12] = data[key12]
    if data.get(key00, "ko") != "ko":
        #print(key00, data[key00], end="")
        data2[key00] = data[key00]

for k,v in data2.items():
    output.write(k + ";" + v)
