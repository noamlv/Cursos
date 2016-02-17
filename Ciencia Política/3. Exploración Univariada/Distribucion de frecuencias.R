
#Distribucion de frecuencias 

install.packages(“foreign”) #para abrir datos de SPSS 
library (foreign)
library(ggplot2)
Data<- read.spss("WVS2015.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
install.packages(“Hmisc”) #para pedir frecuencias
library(Hmisc)

describe(Data)
attach(Data)

describe(V25)
ggplot(Data) + geom_bar(aes(V25), fill="red" ) + xlab("Membresia") + ylab("Frecuencia") + ggtitle("Membresia a la Iglesia")


describe(V109)
ggplot(Data) + geom_bar(aes(V109),colour="gray", fill="blue" ) + xlab("Confianza") + ylab("Frecuencia") + ggtitle("Confianza en las Fuerzas Armadas")


describe(V117)
ggplot(Data) + geom_bar(aes(V117),fill="gray",colour="blue" ) + xlab("Confianza") + ylab("Frecuencia") + ggtitle("Confianza en la Policia")

describe(V126)
ggplot(Data) + geom_bar(aes(V126),fill="brown",colour="black" ) + xlab("Confianza") + ylab("Frecuencia") + ggtitle("Confianza en las Naciones Unidas")

