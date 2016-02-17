#Análisis Factorial 

library(foreign)

data<-read.spss("UE.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
attach(data)

ZCPIBASED<- scale(CPIBASED)

summary(ZCPIBASED)

ZGovernmentbonds<- scale(Governmentbonds)

summary(ZGovernmentbonds)

str(data)#ver descripción de la variable

data2<-subset(data,select=c(16,19,23,27,28), na.value=NULL)


is.matrix(data2)#ver si es una matriz (elementos en dos dimensiones - rectangular)

names(data2)#verificar

data3<-as.matrix(data2)#convertir en matriz

is.matrix(data3)#verificar


#Confiabilidad

install.packages("cocron")
library(cocron)

cronbach.alpha(data3, standardized = FALSE)

#Validez 

library(psych)
KMO(data3)
library(

#Analisis exploratorio de componentes

pairs.panels(data3)
data3<-na.omit(data3)
fit <- princomp(data3, cor=TRUE)

summary(fit)

library(GPArotation)

efacp<- principal(data2, nfactors=2, scores=TRUE, rotate="varimax")

summary(efacp)

print(efacp$loadings,cutoff=.33, sort=TRUE)

fa.diagram(efacp, col="red", main="Proyecto 2.0")





