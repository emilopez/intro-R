finput = open("ceneha.csv")
salida = open("ceneha-fixed.csv", "w")

for l in finput.readlines():
    fecha, demas = l.split(" ")
    d, m, a      = fecha.split("/")
    afixed       = "20" + a
    nuevalinea   = d + "/" + m + "/" + afixed + " " + demas
    salida.write(nuevalinea)


