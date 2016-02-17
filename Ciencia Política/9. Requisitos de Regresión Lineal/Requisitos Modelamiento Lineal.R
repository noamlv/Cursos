#Requisitos Modelamiento Lineal 

library(foreign)
library(Hmisc)
library(relimp)

install.packages("car")
library(car)



data<-read.spss("UE.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)

attach(data)


#PARTE II: MODELO INICIAL
modelo2 <- lm(GDPDeflator ~ TotalReservesMinusGold + ConsumerPrices + Governmentbonds, data=data)#Para INTERACCION veo con *
summary(modelo2)
 
str(modelo2)
head(modelo2)
#PARTE III: LOCALIZANDO INFLUYENTES

#ubicando ATÍPICOS
outlierTest(modelo2)  #cuando es menor a 0.05 hay observaciones atípicas

#ubicando PALANCAS
which.max(hatvalues(modelo2)) #¿quienes son palancas?

#confirmando INFLUYENTES
which.max(cooks.distance(modelo2))



#eliminando INFLUYENTES
data[7:11, ]#PARA VER LOS CASOS DEL 11 AL 13 (entre ellos el 12)
summary(update(modelo2, subset= -c(8))) #modelo de regresion sin el influyente
summary(update(modelo2, subset= -c(10)))

ue<-data[-8,]  #CREAR Y GUARDAR nueva data

ue[7:11, ]#verificar que el valor sea el siguiente
ue1<-data[-10,] 
ue1[7:11]


#MODELO SIN OUTLIER:
modelo4 <- lm(GDPDeflator ~ TotalReservesMinusGold + ConsumerPrices + Governmentbonds, data=ue1)#cambiar data
summary(modelo4)





#PARTE IV:VERIFICANDO REQUISITOS

#LINEALIDAD
cr.plots(modelo4, one.page=TRUE, ask=FALSE)# GRÁFICAMENTE

 

#MULTICOLINEALIDAD
vif(modelo4)#debe ser mayor a 1 y menor a 10
sqrt(vif(modelo4))# DEBE SALIR FALSE (no hay colinealidad)


#NORMALIDAD DE RESIDUOS
res<-residuals(modelo4)
hist(res,prob=TRUE,ylim=c(0,0.4)) ; lines(density(res))#GRAFICAMENTE

install.packages("nortest")
library(nortest) #libreria para ver normalidad.

sf.test(res)#Probando normalidad HO: se distribuyrn normalmente
                                                                    

#HOMOCEDASTICIDAD
spread.level.plot(modelo4)
ncvTest(modelo4)#Ho: HAY HOMOCEDASTICIDAD
install.packages("lmtest")
library(lmtest)
bptest(modelo4)#segunda forma Ho: HAY HOMOCEDASTICIDAD


#INDEPENDENCIA DE ERRORES (NO AUTOCORRELACION)


dwtest(modelo4)