#asociacion 

install.packages(“foreign”) #para abrir datos de SPSS 
library (foreign)
library(Hmisc)

PROYECTO<- read.spss("IOPGENERO.sav",use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
attach(PROYECTO)
#tablas de contingencia 

describe(P4B)

describe(P4C)

install.packages(“descr”) #para pedir tablas de contingencia
library(descr)

table(P4B,P4C)

prop.table(table(P4B,P4C),2)*100 #para convertir la tabla a frecuencias 

newtable<- table(P4B,P4C) #para guardar la tabla 


#requisitoChi2

chisq.test(newtable) #para pedir Chi2

#Asociacion variables nominales 

install.packages("vcd") #para pedir estadísticos de asociación nominal
library(vcd) 

assocstats(newtable) #para pedir estadísticos de asociación nominal


#asociacion ordinales 

install.packages(“vdcExtra”) #para pedir estadísticos de asociación ordinales
library(vcdExtra)

describe(GD)

describe(P39)

library(descr) 

table(GD,P39)

TABordi<-table(GD,P39)

chisq.test(TABordi)

GKgamma(TABordi) #para pedir estadísticos de asociación ordinal



 

