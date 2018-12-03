datos = read.csv("datos/hidrometro/ceneha-cada12hs.csv", sep = ";")
str(datos)
attach(datos)

plot(Altura)