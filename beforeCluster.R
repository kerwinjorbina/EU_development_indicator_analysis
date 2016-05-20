#clear data
rm(list=ls())

setwd("C:/Users/Kerwin/Documents/masters/datamining/project/EU-vs-EEU")

data = read.csv("C:/Users/Kerwin/Documents/masters/datamining/project/world-development-indicators/Indicators.csv", header=TRUE)

# European Union 2004 Members
country.Slovenia = subset(data, CountryCode == "SVN")
country.Slovakia = subset(data, CountryCode == "SVK")
country.Poland = subset(data, CountryCode == "POL")
country.Malta = subset(data, CountryCode == "MLT")
country.Lithuania = subset(data, CountryCode == "LTU")
country.Latvia = subset(data, CountryCode == "LVA")
country.Hungary = subset(data, CountryCode == "HUN")
country.Estonia = subset(data, CountryCode == "EST")
country.CzechRepublic = subset(data, CountryCode == "CZE")
country.Cyprus = subset(data, CountryCode == "CYP")

#To compare with
country.Croatia = subset(data, CountryCode == "HRV")
country.Romania = subset(data, CountryCode == "ROM")
country.Bulgaria = subset(data, CountryCode == "BGR")

# GDP
country.Slovenia.GDP = subset(country.Slovenia, IndicatorCode == "NY.GDP.PCAP.CD")
country.Slovakia.GDP = subset(country.Slovakia, IndicatorCode == "NY.GDP.PCAP.CD")
country.Poland.GDP = subset(country.Poland, IndicatorCode == "NY.GDP.PCAP.CD")
country.Malta.GDP = subset(country.Malta, IndicatorCode == "NY.GDP.PCAP.CD")
country.Lithuania.GDP = subset(country.Lithuania, IndicatorCode == "NY.GDP.PCAP.CD")
country.Latvia.GDP = subset(country.Latvia, IndicatorCode == "NY.GDP.PCAP.CD")
country.Hungary.GDP = subset(country.Hungary, IndicatorCode == "NY.GDP.PCAP.CD")
country.Estonia.GDP = subset(country.Estonia, IndicatorCode == "NY.GDP.PCAP.CD")
country.CzechRepublic.GDP = subset(country.CzechRepublic, IndicatorCode == "NY.GDP.PCAP.CD")
country.Cyprus.GDP = subset(country.Cyprus, IndicatorCode == "NY.GDP.PCAP.CD")

country.Croatia.GDP = subset(country.Croatia, IndicatorCode == "NY.GDP.PCAP.CD")
country.Romania.GDP = subset(country.Romania, IndicatorCode == "NY.GDP.PCAP.CD")
country.Bulgaria.GDP = subset(country.Bulgaria, IndicatorCode == "NY.GDP.PCAP.CD")

# CPI
country.Slovenia.CPI = subset(country.Slovenia, IndicatorCode == "FP.CPI.TOTL")
country.Slovakia.CPI = subset(country.Slovakia, IndicatorCode == "FP.CPI.TOTL")
country.Poland.CPI = subset(country.Poland, IndicatorCode == "FP.CPI.TOTL")
country.Malta.CPI = subset(country.Malta, IndicatorCode == "FP.CPI.TOTL")
country.Lithuania.CPI = subset(country.Lithuania, IndicatorCode == "FP.CPI.TOTL")
country.Latvia.CPI = subset(country.Latvia, IndicatorCode == "FP.CPI.TOTL")
country.Hungary.CPI = subset(country.Hungary, IndicatorCode == "FP.CPI.TOTL")
country.Estonia.CPI = subset(country.Estonia, IndicatorCode == "FP.CPI.TOTL")
country.CzechRepublic.CPI = subset(country.CzechRepublic, IndicatorCode == "FP.CPI.TOTL")
country.Cyprus.CPI = subset(country.Cyprus, IndicatorCode == "FP.CPI.TOTL")

country.Croatia.CPI = subset(country.Croatia, IndicatorCode == "FP.CPI.TOTL")
country.Romania.CPI = subset(country.Romania, IndicatorCode == "FP.CPI.TOTL")
country.Bulgaria.CPI = subset(country.Bulgaria, IndicatorCode == "FP.CPI.TOTL")

# Unemployment
country.Slovenia.Unemployment = subset(country.Slovenia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Slovakia.Unemployment = subset(country.Slovakia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Poland.Unemployment = subset(country.Poland, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Malta.Unemployment = subset(country.Malta, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Lithuania.Unemployment = subset(country.Lithuania, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Latvia.Unemployment = subset(country.Latvia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Hungary.Unemployment = subset(country.Hungary, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Estonia.Unemployment = subset(country.Estonia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.CzechRepublic.Unemployment = subset(country.CzechRepublic, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Cyprus.Unemployment = subset(country.Cyprus, IndicatorCode == "SL.UEM.TOTL.NE.ZS")

country.Croatia.Unemployment = subset(country.Croatia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Romania.Unemployment = subset(country.Romania, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
country.Bulgaria.Unemployment = subset(country.Bulgaria, IndicatorCode == "SL.UEM.TOTL.NE.ZS")

# Trade
country.Slovenia.Trade = subset(country.Slovenia, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Slovakia.Trade = subset(country.Slovakia, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Poland.Trade = subset(country.Poland, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Malta.Trade = subset(country.Malta, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Lithuania.Trade = subset(country.Lithuania, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Latvia.Trade = subset(country.Latvia, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Hungary.Trade = subset(country.Hungary, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Estonia.Trade = subset(country.Estonia, IndicatorCode == "NE.TRD.GNFS.ZS")
country.CzechRepublic.Trade = subset(country.CzechRepublic, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Cyprus.Trade = subset(country.Cyprus, IndicatorCode == "NE.TRD.GNFS.ZS")

country.Croatia.Trade = subset(country.Croatia, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Romania.Trade = subset(country.Romania, IndicatorCode == "NE.TRD.GNFS.ZS")
country.Bulgaria.Trade = subset(country.Bulgaria, IndicatorCode == "NE.TRD.GNFS.ZS")

# Health expenditure per capita
country.Slovenia.Health = subset(country.Slovenia, IndicatorCode == "SH.XPD.PCAP")
country.Slovakia.Health = subset(country.Slovakia, IndicatorCode == "SH.XPD.PCAP")
country.Poland.Health = subset(country.Poland, IndicatorCode == "SH.XPD.PCAP")
country.Malta.Health = subset(country.Malta, IndicatorCode == "SH.XPD.PCAP")
country.Lithuania.Health = subset(country.Lithuania, IndicatorCode == "SH.XPD.PCAP")
country.Latvia.Health = subset(country.Latvia, IndicatorCode == "SH.XPD.PCAP")
country.Hungary.Health = subset(country.Hungary, IndicatorCode == "SH.XPD.PCAP")
country.Estonia.Health = subset(country.Estonia, IndicatorCode == "SH.XPD.PCAP")
country.CzechRepublic.Health = subset(country.CzechRepublic, IndicatorCode == "SH.XPD.PCAP")
country.Cyprus.Health = subset(country.Cyprus, IndicatorCode == "SH.XPD.PCAP")

country.Croatia.Health = subset(country.Croatia, IndicatorCode == "SH.XPD.PCAP")
country.Romania.Health = subset(country.Romania, IndicatorCode == "SH.XPD.PCAP")
country.Bulgaria.Health = subset(country.Bulgaria, IndicatorCode == "SH.XPD.PCAP")

# Calculate the differences in growth per year

cdata = matrix(, nrow = 65, ncol = 11)
cdataDF = as.data.frame(cdata)
colnames(cdataDF) = c("country", "indicator", "Y1", "Y2", "Y3", "Y4", "Y5", "Y6", "Y7", "Y8", "Y9")
countriesEU = c("SVN", "SVK", "POL", "MLT", "LTU", "LVA", "HUN", "EST", "CZE", "CYP", "HRV", "ROM", "BGR")
indicators = c("GDP", "CPI", "Unemployment", "Trade", "Health")

# populate countries
for(i in 1:length(indicators)){
  for(j in 1:length(countriesEU)){
    cdataDF[((i-1)*13)+j,1] = countriesEU[j]
  }
}

# populate indicators
for(i in 1:length(indicators)){
  for(j in 1:length(countriesEU)){
    cdataDF[((i-1)*13)+j,2] = indicators[i]
  }
}

countryDiff = function(countryData, year){
  countryData$Value[countryData$Year == (year + 1)] - countryData$Value[countryData$Year == year]
}

# calulate gdp diff
j = 3
for(i in 1995:2003){
  cdataDF[1,j] = countryDiff(country.Slovenia.GDP, i)
  cdataDF[2,j] = countryDiff(country.Slovakia.GDP, i)
  cdataDF[3,j] = countryDiff(country.Poland.GDP, i)
  cdataDF[4,j] = countryDiff(country.Malta.GDP, i)
  cdataDF[5,j] = countryDiff(country.Lithuania.GDP, i)
  cdataDF[6,j] = countryDiff(country.Latvia.GDP, i)
  cdataDF[7,j] = countryDiff(country.Hungary.GDP, i)
  cdataDF[8,j] = countryDiff(country.Estonia.GDP, i)
  cdataDF[9,j] = countryDiff(country.CzechRepublic.GDP, i)
  cdataDF[10,j] = countryDiff(country.Cyprus.GDP, i)
  cdataDF[11,j] = countryDiff(country.Croatia.GDP, i)
  cdataDF[12,j] = countryDiff(country.Romania.GDP, i)
  cdataDF[13,j] = countryDiff(country.Bulgaria.GDP, i)
  j = j + 1
}

#normalize per row
normalCDataDF = cdataDF
for(i in 1:nrow(cdataDF)){
  normalCDataDF[i,3:11] = (cdataDF[i,3:11] - min(cdataDF[i,3:11]))/ (max(cdataDF[i,3:11]) - min(cdataDF[i,3:11]))
}

for(i in 27:39){
  normalCDataDF[i,8:11] = (cdataDF[i,8:11] - min(cdataDF[i,8:11]))/ (max(cdataDF[i,8:11]) - min(cdataDF[i,8:11]))
}


# calulate cpi diff
j = 3
for(i in 1995:2003){
  cdataDF[14,j] = countryDiff(country.Slovenia.CPI, i)
  cdataDF[15,j] = countryDiff(country.Slovakia.CPI, i)
  cdataDF[16,j] = countryDiff(country.Poland.CPI, i)
  cdataDF[17,j] = countryDiff(country.Malta.CPI, i)
  cdataDF[18,j] = countryDiff(country.Lithuania.CPI, i)
  cdataDF[19,j] = countryDiff(country.Latvia.CPI, i)
  cdataDF[20,j] = countryDiff(country.Hungary.CPI, i)
  cdataDF[21,j] = countryDiff(country.Estonia.CPI, i)
  cdataDF[22,j] = countryDiff(country.CzechRepublic.CPI, i)
  cdataDF[23,j] = countryDiff(country.Cyprus.CPI, i)
  
  cdataDF[24,j] = countryDiff(country.Croatia.CPI, i)
  cdataDF[25,j] = countryDiff(country.Romania.CPI, i)
  cdataDF[26,j] = countryDiff(country.Bulgaria.CPI, i)
  j = j + 1
}

# calulate cpi diff
j = 8
for(i in 2000:2003){
  cdataDF[27,j] = countryDiff(country.Slovenia.Unemployment, i)
  cdataDF[28,j] = countryDiff(country.Slovakia.Unemployment, i)
  cdataDF[29,j] = countryDiff(country.Poland.Unemployment, i)
  cdataDF[30,j] = countryDiff(country.Malta.Unemployment, i)
  cdataDF[31,j] = countryDiff(country.Lithuania.Unemployment, i)
  cdataDF[32,j] = countryDiff(country.Latvia.Unemployment, i)
  cdataDF[33,j] = countryDiff(country.Hungary.Unemployment, i)
  cdataDF[34,j] = countryDiff(country.Estonia.Unemployment, i)
  cdataDF[35,j] = countryDiff(country.CzechRepublic.Unemployment, i)
  cdataDF[36,j] = countryDiff(country.Cyprus.Unemployment, i)
  
  cdataDF[37,j] = countryDiff(country.Croatia.Unemployment, i)
  cdataDF[38,j] = countryDiff(country.Romania.Unemployment, i)
  cdataDF[39,j] = countryDiff(country.Bulgaria.Unemployment, i)
  j = j + 1
}


# calulate Trade diff
j = 3
for(i in 1995:2003){
  cdataDF[40,j] = countryDiff(country.Slovenia.Trade, i)
  cdataDF[41,j] = countryDiff(country.Slovakia.Trade, i)
  cdataDF[42,j] = countryDiff(country.Poland.Trade, i)
  cdataDF[43,j] = countryDiff(country.Malta.Trade, i)
  cdataDF[44,j] = countryDiff(country.Lithuania.Trade, i)
  cdataDF[45,j] = countryDiff(country.Latvia.Trade, i)
  cdataDF[46,j] = countryDiff(country.Hungary.Trade, i)
  cdataDF[47,j] = countryDiff(country.Estonia.Trade, i)
  cdataDF[48,j] = countryDiff(country.CzechRepublic.Trade, i)
  cdataDF[49,j] = countryDiff(country.Cyprus.Trade, i)
  
  cdataDF[50,j] = countryDiff(country.Croatia.Trade, i)
  cdataDF[51,j] = countryDiff(country.Romania.Trade, i)
  cdataDF[52,j] = countryDiff(country.Bulgaria.Trade, i)
  j = j + 1
}

# calulate Health diff
j = 3
for(i in 1995:2003){
  cdataDF[53,j] = countryDiff(country.Slovenia.Health, i)
  cdataDF[54,j] = countryDiff(country.Slovakia.Health, i)
  cdataDF[55,j] = countryDiff(country.Poland.Health, i)
  cdataDF[56,j] = countryDiff(country.Malta.Health, i)
  cdataDF[57,j] = countryDiff(country.Lithuania.Health, i)
  cdataDF[58,j] = countryDiff(country.Latvia.Health, i)
  cdataDF[59,j] = countryDiff(country.Hungary.Health, i)
  cdataDF[60,j] = countryDiff(country.Estonia.Health, i)
  cdataDF[61,j] = countryDiff(country.CzechRepublic.Health, i)
  cdataDF[62,j] = countryDiff(country.Cyprus.Health, i)
  
  cdataDF[63,j] = countryDiff(country.Croatia.Health, i)
  cdataDF[64,j] = countryDiff(country.Romania.Health, i)
  cdataDF[65,j] = countryDiff(country.Bulgaria.Health, i)
  j = j + 1
}

#write.csv(cdataDF, file = "countriesGrowth.csv")

#GDP CLUSTER
kmeans(as.matrix(cdataDF[1:13,3:11]), 3)
pca = prcomp(cdataDF[1:10,3:11],retx = TRUE, center = FALSE, scale.= FALSE)

ev = pca$sdev^2

kmeans(pca$x[,1:2], 3)

# Let's plot the countries on the 2D scatter plot using first two PCA scores 
sc = data.frame(pca$x[,1:2])
sc$Name = countriesEU
library(ggplot2)

ggplot(sc,aes(x = PC1, y = PC2)) + geom_point() + geom_text(aes(label=Name),color="red",size=4,hjust=1.1)

# Let's plot PCA loadings and scores on the same plot
biplot(pca)


# combining data
cdata2 = matrix(, nrow = 13, ncol = 41)
cdataDF2 = as.data.frame(cdata2)
colnames(cdataDF2) = c("country", "GDP_Y1", "GDP_Y2", "GDP_Y3", "GDP_Y4", "GDP_Y5",
                      "GDP_Y6", "GDP_Y7", "GDP_Y8", "GDP_Y9", "CPI_Y1", "CPI_Y2", "CPI_Y3", "CPI_Y4", 
                      "CPI_Y5", "CPI_Y6", "CPI_Y7", "CPI_Y8", "CPI_Y9",
                      "UE_Y6", "UE_Y7", "UE_Y8", "UE_Y9", "T_Y1", "T_Y2", "T_Y3", "T_Y4", "T_Y5", "T_Y6",
                      "T_Y7", "T_Y8", "T_Y9", "H_Y1", "H_Y2", "H_Y3", "H_Y4", "H_Y5",
                      "H_Y6", "H_Y7", "H_Y8", "H_Y9")
for(i in 1:length(countriesEU)){
  cdataDF2[i,1] = countriesEU[i]
}

cdataDF2[,2:10] = cdataDF[1:13,3:11]
cdataDF2[,11:19] = cdataDF[14:26,3:11]
cdataDF2[,20:23] = cdataDF[27:39,8:11]
cdataDF2[,24:32] = cdataDF[40:52,3:11]
cdataDF2[,33:41] = cdataDF[53:65,3:11]

cdataDF2Normal = cdataDF2
cdataDF2Normal[,2:10] = normalCDataDF[1:13,3:11]
cdataDF2Normal[,11:19] = normalCDataDF[14:26,3:11]
cdataDF2Normal[,20:23] = normalCDataDF[27:39,8:11]
cdataDF2Normal[,24:32] = normalCDataDF[40:52,3:11]
cdataDF2Normal[,33:41] = normalCDataDF[53:65,3:11]


#write.csv(cdataDF2, file = "countriesGrowthCombined.csv")

pca2 = prcomp(cdataDF2[,2:41],retx = TRUE, center = FALSE, scale.= FALSE)
kmeans(pca2$x[,1:2], 3)

sc2 = data.frame(pca2$x[,1:2])
sc2$Name = countriesEU

ggplot(sc2,aes(x = PC1, y = PC2)) + geom_point() + geom_text(aes(label=Name),color="red",size=4,hjust=1.1)

#for normal data
pcaNormal = prcomp(cdataDF2Normal[,2:41],retx = TRUE, center = FALSE, scale.= FALSE)
clusters = kmeans(pcaNormal$x[,1:2], 3)

#write.csv(cdataDF2Normal, file = "countriesGrowthCombinedNormal.csv")
cdataDF2Normal = read.csv("countriesGrowthCombinedNormal.csv", header=TRUE)

sc2Normal = data.frame(pcaNormal$x[,1:2])
sc2Normal$Name = countriesEU
sc2Normal$cluster = as.factor(clusters$cluster)
sc2Normal$color[sc2Normal$cluster == 1] = "red"
sc2Normal$color[sc2Normal$cluster == 2] = "blue"
sc2Normal$color[sc2Normal$cluster == 3] = "green"

g <- ggplot(sc2Normal,aes(PC1,PC2, size=4))
g +
  geom_point(aes(colour = factor(cluster)))+
  geom_text(aes(label=Name),color="black",size=3,hjust=0, vjust=0)

ggplot(sc2Normal,aes(x = PC1, y = PC2, group=cluster, colour = cluster)) + geom_point() + geom_text(aes(label=Name),color="red",size=4,hjust=1.1)
