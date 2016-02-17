#prueba de normalidad 

install.packages(“foreign”) #para abrir datos de SPSS 
library (foreign)
library(Hmisc)
Data<- read.spss("WVS2015.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
install.packages(nortest) #para pedir test’s de normalidad
data1<-Data[Data$V2=="Peru",]
str(data1)
head(data1)
summary(data1)
library(nortest)

describe(data1$RESEMAVAL)
lillie.test(data1$RESEMAVAL)$p.value #para pedir test de Shapiro-Wilk
shapiro.test(data1$RESEMAVAL)$p.value #para pedir test de Kolmogorov-Smirnov
describe(data1$SACSECVAL)
lillie.test(data1$SACSECVAL)$p.value #para pedir test de Shapiro-Wilk
shapiro.test(data1$SACSECVAL)$p.value #para pedir test de Kolmogorov-Smirnov

