#clear data
rm(list=ls())

setwd("C:/Users/Kerwin/Documents/masters/datamining/project/EU-vs-EEU")

gdp_pred = read.csv("GDP_PRED.csv", header=TRUE)
cpi_pred = read.csv("CPI_PRED.csv", header=TRUE)
unemp_pred = read.csv("UNEMP_PRED.csv", header=TRUE)
trade_pred = read.csv("TRADE_PRED.csv", header=TRUE)
health_pred = read.csv("HEALTH_PRED.csv", header=TRUE)

#transposed data
gdp_pred <- t(gdp_pred)
cpi_pred <- t(cpi_pred)
unemp_pred <- t(unemp_pred)
trade_pred <- t(trade_pred)
health_pred <- t(health_pred)

gdp_pred = as.data.frame(gdp_pred)
cpi_pred = as.data.frame(cpi_pred)
unemp_pred = as.data.frame(unemp_pred)
trade_pred = as.data.frame(trade_pred)
health_pred = as.data.frame(health_pred)

gdp_pred = gdp_pred[-1,]
cpi_pred = cpi_pred[-1,]
unemp_pred = unemp_pred[-1,]
trade_pred = trade_pred[-1,]
health_pred = health_pred[-1,]

normal_gdp_pred = gdp_pred
for(i in 1:nrow(gdp_pred)){
  normal_gdp_pred[i,] = (gdp_pred[i,] - min(gdp_pred[i,]))/ (max(gdp_pred[i,]) - min(gdp_pred[i,]))
}

normal_cpi_pred = cpi_pred
for(i in 1:nrow(cpi_pred)){
  normal_cpi_pred[i,] = (cpi_pred[i,] - min(cpi_pred[i,]))/ (max(cpi_pred[i,]) - min(cpi_pred[i,]))
}

normal_unemp_pred = unemp_pred
for(i in 1:nrow(unemp_pred)){
  normal_unemp_pred[i,] = (unemp_pred[i,] - min(unemp_pred[i,]))/ (max(unemp_pred[i,]) - min(unemp_pred[i,]))
}

normal_trade_pred = trade_pred
for(i in 1:nrow(trade_pred)){
  normal_trade_pred[i,] = (trade_pred[i,] - min(trade_pred[i,]))/ (max(trade_pred[i,]) - min(trade_pred[i,]))
}

normal_health_pred = health_pred
for(i in 1:nrow(health_pred)){
  normal_health_pred[i,] = (health_pred[i,] - min(health_pred[i,]))/ (max(health_pred[i,]) - min(health_pred[i,]))
}

afterData = cbind(normal_gdp_pred, normal_cpi_pred, normal_unemp_pred, normal_trade_pred, normal_health_pred)
colnames(afterData) = c("GDP_Y1", "GDP_Y2", "GDP_Y3", "GDP_Y4", "GDP_Y5", "CPI_Y1", "CPI_Y2", "CPI_Y3", "CPI_Y4", "CPI_Y5",
                        "UE_Y1", "UE_Y2", "UE_Y3", "UE_Y4", "UE_Y5", "T_Y1", "T_Y2", "T_Y3", "T_Y4", "T_Y5",
                        "H_Y1", "H_Y2", "H_Y3", "H_Y4", "H_Y5")

# write.csv(afterData, file = "countriesGrowthCombinedNormalAfter.csv")
#for normal data
pcaAfterNormal = prcomp(afterData,retx = TRUE, center = FALSE, scale.= FALSE)
clustersAfter = kmeans(pcaAfterNormal$x[,1:2], 3)

#write.csv(cdataDF2Normal, file = "countriesGrowthCombinedNormal.csv")

sc2NormalAfter = data.frame(pcaAfterNormal$x[,1:2])
sc2NormalAfter$Name = c("POL","SVN","SVK","LTU","LVA","HUN","EST","CZE","CYP","MLT","HRV","ROM","BGR")
sc2NormalAfter$cluster = as.factor(clustersAfter$cluster)
sc2NormalAfter$color[sc2NormalAfter$cluster == 1] = "red"
sc2NormalAfter$color[sc2NormalAfter$cluster == 2] = "blue"
sc2NormalAfter$color[sc2NormalAfter$cluster == 3] = "green"

g <- ggplot(sc2NormalAfter,aes(PC1,PC2, size=4))
g +
  geom_point(aes(colour = factor(cluster)))+
  geom_text(aes(label=Name),color="black",size=3,hjust=0, vjust=0)

g <- ggplot(sc2NormalAfter,aes(PC1,PC2,group=cluster,colour=cluster))
g +
  geom_point()+
  scale_shape_manual(values=c(19,20,21))+
  scale_colour_manual(values=c("blue", "red","green", "violet")) +
  geom_text(aes(label=Name),color="black",size=3,hjust=1.1)