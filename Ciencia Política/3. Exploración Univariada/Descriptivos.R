#Estadisticos descriptivos
#medidas de centralidad 

install.packages(“foreign”) #para abrir datos de SPSS 
library (foreign)
library(Hmisc)
Data<- read.spss("WVS2015.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)  #LAPOPPe2010
attach(Data)
str(Data)
V131A<-as.numeric(V131)
describe(V131A)
summary(V131A) #para pedir estadísticos descriptivos de centralidad
ggplot(Data, aes(x=V131A)) + geom_histogram(aes(y=..density..),binwidth=1.5, colour="blue", fill="gray")+ ggtitle("Impuestos vs Subsidios")+ geom_density(alpha=0.95,fill="#FF6666")

V132A<-as.numeric(V132)
summary(V132A)
ggplot(Data, aes(x=V132A)) + geom_histogram(aes(y=..density..),binwidth=1.5, colour="blue", fill="darkgreen")+ ggtitle("Interpretación Religiosa")+ geom_density(alpha=0.7,fill="#FF6666")



#medidas de dispersion 

install.packages(“psych”) #para pedir estadísticos descriptivos de dispersión 
library(psych)

V133A<-as.numeric(V133)
describe(V133A) #con psych, el comando describe incluye medidas de dispersión

V134A<-as.numeric(V134)
describe(V134A)


boxplot(V133A,V134A) #para pedir boxplots

V135A<-as.numeric(V135)
describe(V135A)

V136A<-as.numeric(V136)
describe(V136A)
boxplot(V135A, V136A) 


#medidas de orden y sesgo


V137A<-as.numeric(V137)
quantile(V137A,na.rm="true") #para pedir medidas  de orden
describe(V137A)
IQR(V137A,na.rm="true") #para pedir Rango Intercuartil
boxplot(V137A)
decil <- seq(0, 1, 0.1)
decil
quantile(V137A, decil,na.rm="true")

V138A<-as.numeric(V138)
quintil <- seq(0,1, 0.2)
quintil
quantile(V138A, quintil, na.rm="true")

V139A<-as.numeric(V139)
quantile(V139A,na.rm="true", probs=c(.33, .44, .66, .855))

Per <- ecdf(V139A) #para pedir un porcentaje a través de valor
Per(7)



