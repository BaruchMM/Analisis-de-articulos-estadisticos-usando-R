library(questionr)

attack = read.csv("Attack.csv",header=TRUE,sep=",")
n=12
attack


RiskRatio=c()
Min=c()
Max=c()
p_value=c()
region=c()
for (i in 1:n){
  region=append(region,attack[i,1])
  M <- matrix(c(attack[i,2],attack[i,4],attack[i,5],attack[i,7]), ncol = 2)
  RR = round(odds.ratio(M)[1,1],4)
  RiskRatio = append(RiskRatio,RR)
  Min=append(Min,round(odds.ratio(M)[1,2],4))
  Max=append(Max,round(odds.ratio(M)[1,3],4))
  p_value=append(p_value,round(odds.ratio(M)[1,4],4))
}
Razon_de_riesgo=data.frame(region,RiskRatio,Min,Max,p_value)
Razon_de_riesgo
Razon_de_riesgo=matrix(c(region,RiskRatio,Min,Max,attack[,2],attack[,5]),ncol = 6)
Razon_de_riesgo
write.csv(Razon_de_riesgo , 'plotear_Riesgo.csv',row.names = F, col.names = F)

severe = read.csv("Severe_Critical.csv",header=TRUE,sep=",")
n=12
severe

#Calculamos el RR para cada grupo de regi�n.

OddsRatio=c()
Min=c()
Max=c()
p_value=c()
region=c()
for (i in 1:n){
  region=append(region,severe[i,1])
  M <- matrix(c(severe[i,2],severe[i,4],severe[i,5],severe[i,7]), ncol = 2)
  OR = round(odds.ratio(M)[1,1],4)
  OddsRatio = append(OddsRatio,OR)
  Min=append(Min,round(odds.ratio(M)[1,2],4))
  Max=append(Max,round(odds.ratio(M)[1,3],4))
  p_value=append(p_value,round(odds.ratio(M)[1,4],4))
}
Severe_and_Critical=data.frame(region,OddsRatio,Min,Max,p_value)
Severe_and_Critical
Severe_and_Critical=matrix(c(region,OddsRatio,Min,Max,severe[,2],severe[,5]),ncol = 6)
Severe_and_Critical
write.csv(Severe_and_Critical , 'plotear_severe.csv',row.names = F, col.names = F)

## Casos fatales por sexo en cada regi�n

fatal = read.csv("Fatal.csv",header=TRUE,sep=",")
n=12
fatal

OddsRatio=c()
Min=c()
Max=c()
p_value=c()
region=c()
for (i in 1:n){
  region=append(region,fatal[i,1])
  M <- matrix(c(fatal[i,2],fatal[i,4],fatal[i,5],fatal[i,7]), ncol = 2)
  if (fatal[i,2]==0 ||fatal[i,4]==0 ||fatal[i,5]==0 ||fatal[i,7]==0 ){
    OR = 0
    OddsRatio = append(OddsRatio,OR)
    Min=append(Min,0)
    Max=append(Max,0)
    p_value=append(p_value,0)
  } else {
    OR = round(odds.ratio(M)[1,1],4)
    OddsRatio = append(OddsRatio,OR)
    Min=append(Min,round(odds.ratio(M)[1,2],4))
    Max=append(Max,round(odds.ratio(M)[1,3],4))
    p_value=append(p_value,round(odds.ratio(M)[1,4],4))
  }
  
}
fatales=data.frame(region,OddsRatio,Min,Max,p_value)
fatales
fatales=matrix(c(region,OddsRatio,Min,Max,fatal[,2],fatal[,5]),ncol = 6)
fatales

write.csv(fatales , 'plotear_fatal.csv',row.names = F, col.names = F)
