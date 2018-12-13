rm(list=ls())
datos = read.csv("hidrometro/ceneha.csv", sep = ";")
names(datos)
attach(datos)

plot(altura[0:100]~fechayhora[0:100])

