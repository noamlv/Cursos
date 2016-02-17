#Correlacion 

install.packages(“foreign”) #para abrir datos de SPSS 
library (foreign)

PROYECTO<- read.spss("IOPGENERO.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
attach(PROYECTO)
cor(P1,P2, use="complete.obs") #para pedir correlación

cor.test(P1,P2, use="complete.obs") #para pedir correlación con significancia 
