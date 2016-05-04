setwd("C:/Users/Kerwin/Documents/masters/datamining/project/EU-vs-EEU")

data = read.csv("C:/Users/Kerwin/Documents/masters/datamining/project/world-development-indicators/Indicators.csv", header=TRUE)

head(data[data$CountryName=="Ukraine"])

ukraine = subset(data, CountryCode == "UKR")

# European Union 2004 Members
Slovenia = subset(data, CountryCode == "SVN")
Slovakia = subset(data, CountryCode == "SVK")
Poland = subset(data, CountryCode == "POL")
Malta = subset(data, CountryCode == "MLT")
Lithuania = subset(data, CountryCode == "LTU")
Latvia = subset(data, CountryCode == "LVA")
Hungary = subset(data, CountryCode == "HUN")
Estonia = subset(data, CountryCode == "EST")
CzechRepublic = subset(data, CountryCode == "CZE")
Cyprus = subset(data, CountryCode == "CYP")

# Eurasuan Economic Union 2010 Members
Armenia = subset(data, CountryCode == "ARM")
Belarus = subset(data, CountryCode == "BLR")
Kazakhstan = subset(data, CountryCode == "KAZ")
Kyrgyzstan = subset(data, CountryCode == "KGZ")
Russia = subset(data, CountryCode == "RUS")

# GDP

GDP.Slovenia = subset(Slovenia, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Slovakia = subset(Slovakia, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Poland = subset(Poland, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Malta = subset(Malta, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Lithuania = subset(Lithuania, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Latvia = subset(Latvia, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Hungary = subset(Hungary, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Estonia = subset(Estonia, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.CzechRepublic = subset(CzechRepublic, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Cyprus = subset(Cyprus, IndicatorCode == "NY.GDP.PCAP.CD")

GDP.Armenia = subset(Armenia, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Belarus = subset(Belarus, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Kazakhstan = subset(Kazakhstan, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Russia = subset(Russia, IndicatorCode == "NY.GDP.PCAP.CD")

# Consumer Price Index

CPI.Slovenia = subset(Slovenia, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Slovakia = subset(Slovakia, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Poland = subset(Poland, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Malta = subset(Malta, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Lithuania = subset(Lithuania, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Latvia = subset(Latvia, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Hungary = subset(Hungary, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Estonia = subset(Estonia, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.CzechRepublic = subset(CzechRepublic, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Cyprus = subset(Cyprus, IndicatorCode == "FP.CPI.TOTL.ZG")

CPI.Armenia = subset(Armenia, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Belarus = subset(Belarus, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Kazakhstan = subset(Kazakhstan, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "FP.CPI.TOTL.ZG")
CPI.Russia = subset(Russia, IndicatorCode == "FP.CPI.TOTL.ZG")

# Unemployment
UEmploy.Slovenia = subset(Slovenia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Slovakia = subset(Slovakia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Poland = subset(Poland, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Malta = subset(Malta, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Lithuania = subset(Lithuania, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Latvia = subset(Latvia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Hungary = subset(Hungary, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Estonia = subset(Estonia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Cyprus = subset(Cyprus, IndicatorCode == "SL.UEM.TOTL.NE.ZS")

UEmploy.Armenia = subset(Armenia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Belarus = subset(Belarus, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Kazakhstan = subset(Kazakhstan, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Russia = subset(Russia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")

# External Debt Value
Debt.Slovenia = subset(Slovenia, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Slovakia = subset(Slovakia, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Poland = subset(Poland, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Malta = subset(Malta, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Lithuania = subset(Lithuania, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Latvia = subset(Latvia, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Hungary = subset(Hungary, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Estonia = subset(Estonia, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.CzechRepublic = subset(CzechRepublic, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Cyprus = subset(Cyprus, IndicatorCode == "DT.DOD.PVLX.GN.ZS")

Debt.Armenia = subset(Armenia, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Belarus = subset(Belarus, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Kazakhstan = subset(Kazakhstan, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
Debt.Russia = subset(Russia, IndicatorCode == "DT.DOD.PVLX.GN.ZS")
#