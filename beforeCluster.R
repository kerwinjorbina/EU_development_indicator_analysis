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
country.Slovenia.CPI = subset(country.Slovenia, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Slovakia.CPI = subset(country.Slovakia, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Poland.CPI = subset(country.Poland, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Malta.CPI = subset(country.Malta, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Lithuania.CPI = subset(country.Lithuania, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Latvia.CPI = subset(country.Latvia, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Hungary.CPI = subset(country.Hungary, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Estonia.CPI = subset(country.Estonia, IndicatorCode == "FP.CPI.TOTL.ZG")
country.CzechRepublic.CPI = subset(country.CzechRepublic, IndicatorCode == "FP.CPI.TOTL.ZG")
country.Cyprus.CPI = subset(country.Cyprus, IndicatorCode == "FP.CPI.TOTL.ZG")

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

# GINI
country.Slovenia.GINI = subset(country.Slovenia, IndicatorCode == "SI.POV.GINI")
country.Slovakia.GINI = subset(country.Slovakia, IndicatorCode == "SI.POV.GINI")
country.Poland.GINI = subset(country.Poland, IndicatorCode == "SI.POV.GINI")
country.Malta.GINI = subset(country.Malta, IndicatorCode == "SI.POV.GINI")
country.Lithuania.GINI = subset(country.Lithuania, IndicatorCode == "SI.POV.GINI")
country.Latvia.GINI = subset(country.Latvia, IndicatorCode == "SI.POV.GINI")
country.Hungary.GINI = subset(country.Hungary, IndicatorCode == "SI.POV.GINI")
country.Estonia.GINI = subset(country.Estonia, IndicatorCode == "SI.POV.GINI")
country.CzechRepublic.GINI = subset(country.CzechRepublic, IndicatorCode == "SI.POV.GINI")
country.Cyprus.GINI = subset(country.Cyprus, IndicatorCode == "SI.POV.GINI")

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