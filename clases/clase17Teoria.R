datos = read.csv("/home/emiliano/EstadisticaAplicada/Estadistica.Aplicada.2018/03_efectos_aleatorios_y_mixtos/datos/datos-dentista.txt", sep=" ")
#head(datos)
names(datos)
attach(datos)
fDent = as.factor(Dentista)
fMetodo = as.factor(Metodo)
fAleacion = as.factor(Aleacion)
interaction.plot(fAleacion, fMetodo, Respuesta)
# mixto
library(lme4)
m2 = lmer(Respuesta~fAleacion*fMetodo+(1|fDent)+(1|fDent:fMetodo)+(1|fDent:fAleacion), REML=TRUE)
summary(m2)
confint(m2)
