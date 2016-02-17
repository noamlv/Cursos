#Clusters 

library(foreign)

data<-read.spss("UE.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)


#Seleccion y corte de data 

data2<-subset(data,select=c(1,19,29), na.value=NULL)

str(data2)

attach(data2)

pais<- PaÃ.s         
         
mydata <- na.omit(data2) 

#Construccion de cluster jerarquico 

d <- dist(as.matrix(mydata))   
   
hc <- hclust(d)                
  
plot(hc)  

rect.hclust(hc, k=3, border="red")

install.packages("dendextend")
library(dendextend)

matrizdecluster <-cutree(hc,k=3:5)


#Seleccion de cluster 

matrizdecluster <-cutree(hc,k=3:5)

nuevosdatos <- data.frame(matrizdecluster,mydata)

str(nuevosdatos)

str(nuevosdatos$X3)

#Analisis interno 

aggregate(nuevosdatos$ZGDPDeflator, by = list(nuevosdatos$X3), FUN = sd)

aggregate(nuevosdatos$ZGDPDeflator, by = list(nuevosdatos$X4), FUN = sd)

aggregate(nuevosdatos$ZGDPDeflator, by = list(nuevosdatos$X5), FUN = sd)

aggregate(nuevosdatos$ZTotalReserves, by = list(nuevosdatos$X3), FUN = sd)

aggregate(nuevosdatos$ZTotalReserves, by = list(nuevosdatos$X4), FUN = sd)

aggregate(nuevosdatos$ZTotalReserves, by = list(nuevosdatos$X5), FUN = sd)


#Analisis externo 

fit <- aov(nuevosdatos$ZGDPDeflator ~ nuevosdatos$X3)

summary(fit)

fit1 <- aov(nuevosdatos$ZGDPDeflator ~ nuevosdatos$X4)

summary(fit1)

fit2 <- aov(nuevosdatos$ZGDPDeflator ~ nuevosdatos$X5)

summary(fit2)

fit3 <- aov(nuevosdatos$ZTotalReserves ~ nuevosdatos$X3)

summary(fit3)

fit3 <- aov(nuevosdatos$ZTotalReserves ~ nuevosdatos$X3)

summary(fit3)

fit5 <- aov(nuevosdatos$ZTotalReserves ~ nuevosdatos$X5)

summary(fit5)

rect.hclust(hc, k=4, border="blue")









