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


# Calculate the differences in growth per year

cdata = matrix(, nrow = 60, ncol = 11)
cdataDF = as.data.frame(cdata)
colnames(cdataDF) = c("country", "indicator", "Y1", "Y2", "Y3", "Y4", "Y5", "Y6", "Y7", "Y8", "Y9")
countriesEU = c("SVN", "SVK", "POL", "MLT", "LTU", "LVA", "HUN", "EST", "CZE", "CYP")
indicators = c("GDP", "CPI", "Unemployment", "GINI", "Trade", "Health")

# populate countries
for(i in 1:length(indicators)){
  for(j in 1:length(countriesEU)){
    cdataDF[((i-1)*10)+j,1] = countriesEU[j]
  }
}

# populate indicators
for(i in 1:length(indicators)){
  for(j in 1:length(countriesEU)){
    cdataDF[((i-1)*10)+j,2] = indicators[i]
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
  j = j + 1
}

# calulate cpi diff
j = 3
for(i in 1995:2003){
  cdataDF[11,j] = countryDiff(country.Slovenia.CPI, i)
  cdataDF[12,j] = countryDiff(country.Slovakia.CPI, i)
  cdataDF[13,j] = countryDiff(country.Poland.CPI, i)
  cdataDF[14,j] = countryDiff(country.Malta.CPI, i)
  cdataDF[15,j] = countryDiff(country.Lithuania.CPI, i)
  cdataDF[16,j] = countryDiff(country.Latvia.CPI, i)
  cdataDF[17,j] = countryDiff(country.Hungary.CPI, i)
  cdataDF[18,j] = countryDiff(country.Estonia.CPI, i)
  cdataDF[19,j] = countryDiff(country.CzechRepublic.CPI, i)
  cdataDF[20,j] = countryDiff(country.Cyprus.CPI, i)
  j = j + 1
}

# calulate cpi diff
j = 8
for(i in 2000:2003){
  cdataDF[21,j] = countryDiff(country.Slovenia.Unemployment, i)
  cdataDF[22,j] = countryDiff(country.Slovakia.Unemployment, i)
  cdataDF[23,j] = countryDiff(country.Poland.Unemployment, i)
  cdataDF[24,j] = countryDiff(country.Malta.Unemployment, i)
  cdataDF[25,j] = countryDiff(country.Lithuania.Unemployment, i)
  cdataDF[26,j] = countryDiff(country.Latvia.Unemployment, i)
  cdataDF[27,j] = countryDiff(country.Hungary.Unemployment, i)
  cdataDF[28,j] = countryDiff(country.Estonia.Unemployment, i)
  cdataDF[29,j] = countryDiff(country.CzechRepublic.Unemployment, i)
  cdataDF[30,j] = countryDiff(country.Cyprus.Unemployment, i)
  j = j + 1
}


# calulate Trade diff
j = 3
for(i in 1995:2003){
  cdataDF[41,j] = countryDiff(country.Slovenia.Trade, i)
  cdataDF[42,j] = countryDiff(country.Slovakia.Trade, i)
  cdataDF[43,j] = countryDiff(country.Poland.Trade, i)
  cdataDF[44,j] = countryDiff(country.Malta.Trade, i)
  cdataDF[45,j] = countryDiff(country.Lithuania.Trade, i)
  cdataDF[46,j] = countryDiff(country.Latvia.Trade, i)
  cdataDF[47,j] = countryDiff(country.Hungary.Trade, i)
  cdataDF[48,j] = countryDiff(country.Estonia.Trade, i)
  cdataDF[49,j] = countryDiff(country.CzechRepublic.Trade, i)
  cdataDF[50,j] = countryDiff(country.Cyprus.Trade, i)
  j = j + 1
}

# calulate Health diff
j = 3
for(i in 1995:2003){
  cdataDF[51,j] = countryDiff(country.Slovenia.Health, i)
  cdataDF[52,j] = countryDiff(country.Slovakia.Health, i)
  cdataDF[53,j] = countryDiff(country.Poland.Health, i)
  cdataDF[54,j] = countryDiff(country.Malta.Health, i)
  cdataDF[55,j] = countryDiff(country.Lithuania.Health, i)
  cdataDF[56,j] = countryDiff(country.Latvia.Health, i)
  cdataDF[57,j] = countryDiff(country.Hungary.Health, i)
  cdataDF[58,j] = countryDiff(country.Estonia.Health, i)
  cdataDF[59,j] = countryDiff(country.CzechRepublic.Health, i)
  cdataDF[60,j] = countryDiff(country.Cyprus.Health, i)
  j = j + 1
}

cdataDF = cdataDF[-c(31, 32, 33, 34, 35, 36, 37, 38, 39, 40), ]

#write.csv(cdataDF, file = "countriesGrowth.csv")

#GDP CLUSTER
kmeans(as.matrix(cdataDF[1:10,3:11]), 3)
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
cdata2 = matrix(, nrow = 10, ncol = 41)
cdataDF2 = as.data.frame(cdata2)
colnames(cdataDF2) = c("country", "GDP_Y1", "GDP_Y2", "GDP_Y3", "GDP_Y4", "GDP_Y5",
                      "GDP_Y6", "GDP_Y7", "GDP_Y8", "GDP_Y9", "CPI_Y1", "CPI_Y2", "CPI_Y3", "CPI_Y4", 
                      "CPI_Y5", "CPI_Y6", "CPI_Y7", "CPI_Y8", "CPI_Y9",
                      "UE_Y6", "UE_Y7", "UE_Y8", "UE_Y9", "T_Y1", "T_Y2", "T_Y3", "T_Y4", "T_Y5", "T_Y6",
                      "T_Y7", "T_Y8", "T_Y9", "H_Y1", "H_Y2", "H_Y3", "H_Y4", "H_Y5",
                      "H_Y6", "H_Y7", "H_Y8", "H_Y9")
cdataDF2[,2:10] = cdataDF[1:10,3:11]
cdataDF2[,11:19] = cdataDF[11:20,3:11]
cdataDF2[,20:23] = cdataDF[21:30,8:11]
cdataDF2[,24:32] = cdataDF[31:40,3:11]
cdataDF2[,33:41] = cdataDF[41:50,3:11]

for(i in 1:length(countriesEU)){
  cdataDF2[i,1] = countriesEU[i]
}
#write.csv(cdataDF2, file = "countriesGrowthCombined.csv")

pca2 = prcomp(cdataDF2[,2:41],retx = TRUE, center = FALSE, scale.= FALSE)
kmeans(pca2$x[,1:2], 3)

sc2 = data.frame(pca2$x[,1:2])
sc2$Name = countriesEU

ggplot(sc2,aes(x = PC1, y = PC2)) + geom_point() + geom_text(aes(label=Name),color="red",size=4,hjust=1.1)

