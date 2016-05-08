#clear data
rm(list=ls())

setwd("C:/Users/Kerwin/Documents/masters/datamining/project/EU-vs-EEU")

data = read.csv("C:/Users/Kerwin/Documents/masters/datamining/project/world-development-indicators/Indicators.csv", header=TRUE)

head(data[data$CountryName=="Ukraine"])

ukraine = subset(data, CountryCode == "UKR")

country
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
Debt.Slovenia = subset(Slovenia, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Slovakia = subset(Slovakia, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Poland = subset(Poland, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Malta = subset(Malta, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Lithuania = subset(Lithuania, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Latvia = subset(Latvia, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Hungary = subset(Hungary, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Estonia = subset(Estonia, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.CzechRepublic = subset(CzechRepublic, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Cyprus = subset(Cyprus, IndicatorCode == "DT.TDS.DECT.EX.ZS")

Debt.Armenia = subset(Armenia, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Belarus = subset(Belarus, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Kazakhstan = subset(Kazakhstan, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "DT.TDS.DECT.EX.ZS")
Debt.Russia = subset(Russia, IndicatorCode == "DT.TDS.DECT.EX.ZS")

# Foreign Direct Investment
Foreign.Slovenia = subset(Slovenia, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Slovakia = subset(Slovakia, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Poland = subset(Poland, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Malta = subset(Malta, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Lithuania = subset(Lithuania, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Latvia = subset(Latvia, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Hungary = subset(Hungary, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Estonia = subset(Estonia, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.CzechRepublic = subset(CzechRepublic, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Cyprus = subset(Cyprus, IndicatorCode == "BN.KLT.DINV.CD")

Foreign.Armenia = subset(Armenia, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Belarus = subset(Belarus, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Kazakhstan = subset(Kazakhstan, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "BN.KLT.DINV.CD")
Foreign.Russia = subset(Russia, IndicatorCode == "BN.KLT.DINV.CD")

# Export of Goods
Export.Slovenia = subset(Slovenia, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Slovakia = subset(Slovakia, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Poland = subset(Poland, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Malta = subset(Malta, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Lithuania = subset(Lithuania, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Latvia = subset(Latvia, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Hungary = subset(Hungary, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Estonia = subset(Estonia, IndicatorCode == "BX.GSR.GNFS.CD")
Export.CzechRepublic = subset(CzechRepublic, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Cyprus = subset(Cyprus, IndicatorCode == "BX.GSR.GNFS.CD")

Export.Armenia = subset(Armenia, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Belarus = subset(Belarus, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Kazakhstan = subset(Kazakhstan, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "BX.GSR.GNFS.CD")
Export.Russia = subset(Russia, IndicatorCode == "BX.GSR.GNFS.CD")

# GNI
GNI.Slovenia = subset(Slovenia, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Slovakia = subset(Slovakia, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Poland = subset(Poland, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Malta = subset(Malta, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Lithuania = subset(Lithuania, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Latvia = subset(Latvia, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Hungary = subset(Hungary, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Estonia = subset(Estonia, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.CzechRepublic = subset(CzechRepublic, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Cyprus = subset(Cyprus, IndicatorCode == "NY.GNP.MKTP.KD.ZG")

GNI.Armenia = subset(Armenia, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Belarus = subset(Belarus, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Kazakhstan = subset(Kazakhstan, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "NY.GNP.MKTP.KD.ZG")
GNI.Russia = subset(Russia, IndicatorCode == "NY.GNP.MKTP.KD.ZG")

# Household
Household.Slovenia = subset(Slovenia, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Slovakia = subset(Slovakia, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Poland = subset(Poland, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Malta = subset(Malta, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Lithuania = subset(Lithuania, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Latvia = subset(Latvia, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Hungary = subset(Hungary, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Estonia = subset(Estonia, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.CzechRepublic = subset(CzechRepublic, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Cyprus = subset(Cyprus, IndicatorCode == "NE.CON.PRVT.PP.CD")

Household.Armenia = subset(Armenia, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Belarus = subset(Belarus, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Kazakhstan = subset(Kazakhstan, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "NE.CON.PRVT.PP.CD")
Household.Russia = subset(Russia, IndicatorCode == "NE.CON.PRVT.PP.CD")

# Trade
Trade.Slovenia = subset(Slovenia, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Slovakia = subset(Slovakia, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Poland = subset(Poland, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Malta = subset(Malta, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Lithuania = subset(Lithuania, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Latvia = subset(Latvia, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Hungary = subset(Hungary, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Estonia = subset(Estonia, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.CzechRepublic = subset(CzechRepublic, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Cyprus = subset(Cyprus, IndicatorCode == "NE.TRD.GNFS.ZS")

Trade.Armenia = subset(Armenia, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Belarus = subset(Belarus, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Kazakhstan = subset(Kazakhstan, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Russia = subset(Russia, IndicatorCode == "NE.TRD.GNFS.ZS")

# Savings
Saving.Slovenia = subset(Slovenia, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Slovakia = subset(Slovakia, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Poland = subset(Poland, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Malta = subset(Malta, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Lithuania = subset(Lithuania, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Latvia = subset(Latvia, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Hungary = subset(Hungary, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Estonia = subset(Estonia, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.CzechRepublic = subset(CzechRepublic, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Cyprus = subset(Cyprus, IndicatorCode == "NY.ADJ.NNAT.CD")

Saving.Armenia = subset(Armenia, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Belarus = subset(Belarus, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Kazakhstan = subset(Kazakhstan, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "NY.ADJ.NNAT.CD")
Saving.Russia = subset(Russia, IndicatorCode == "NY.ADJ.NNAT.CD")


#Education Factor

# Intake
Intake.Slovenia = subset(Slovenia, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Slovakia = subset(Slovakia, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Poland = subset(Poland, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Malta = subset(Malta, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Lithuania = subset(Lithuania, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Latvia = subset(Latvia, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Hungary = subset(Hungary, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Estonia = subset(Estonia, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Cyprus = subset(Cyprus, IndicatorCode == "SE.PRM.GINT.ZS")

Intake.Armenia = subset(Armenia, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Belarus = subset(Belarus, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Kazakhstan = subset(Kazakhstan, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "SE.PRM.GINT.ZS")
Intake.Russia = subset(Russia, IndicatorCode == "SE.PRM.GINT.ZS")

# Secondary Intake
SecIntake.Slovenia = subset(Slovenia, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Slovakia = subset(Slovakia, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Poland = subset(Poland, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Malta = subset(Malta, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Lithuania = subset(Lithuania, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Latvia = subset(Latvia, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Hungary = subset(Hungary, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Estonia = subset(Estonia, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Cyprus = subset(Cyprus, IndicatorCode == "SE.SEC.PROG.ZS")

SecIntake.Armenia = subset(Armenia, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Belarus = subset(Belarus, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Kazakhstan = subset(Kazakhstan, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "SE.SEC.PROG.ZS")
SecIntake.Russia = subset(Russia, IndicatorCode == "SE.SEC.PROG.ZS")

# Primary Pupil to Teacher Ratio

PrimaryPTTRatio.Slovenia = subset(Slovenia, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Slovakia = subset(Slovakia, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Poland = subset(Poland, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Malta = subset(Malta, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Lithuania = subset(Lithuania, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Latvia = subset(Latvia, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Hungary = subset(Hungary, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Estonia = subset(Estonia, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Cyprus = subset(Cyprus, IndicatorCode == "SE.PRM.ENRL.TC.ZS")

PrimaryPTTRatio.Armenia = subset(Armenia, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Belarus = subset(Belarus, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Kazakhstan = subset(Kazakhstan, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "SE.PRM.ENRL.TC.ZS")
PrimaryPTTRatio.Russia = subset(Russia, IndicatorCode == "SE.PRM.ENRL.TC.ZS")

# Secondary Pupil to Teacher Ratio

SecondaryPTTRatio.Slovenia = subset(Slovenia, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Slovakia = subset(Slovakia, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Poland = subset(Poland, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Malta = subset(Malta, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Lithuania = subset(Lithuania, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Latvia = subset(Latvia, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Hungary = subset(Hungary, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Estonia = subset(Estonia, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Cyprus = subset(Cyprus, IndicatorCode == "SE.SEC.ENRL.TC.ZS")

SecondaryPTTRatio.Armenia = subset(Armenia, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Belarus = subset(Belarus, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Kazakhstan = subset(Kazakhstan, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "SE.SEC.ENRL.TC.ZS")
SecondaryPTTRatio.Russia = subset(Russia, IndicatorCode == "SE.SEC.ENRL.TC.ZS")

# Out of School Rate Primary

OutOfSchoolPrimary.Slovenia = subset(Slovenia, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Slovakia = subset(Slovakia, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Poland = subset(Poland, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Malta = subset(Malta, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Lithuania = subset(Lithuania, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Latvia = subset(Latvia, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Hungary = subset(Hungary, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Estonia = subset(Estonia, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Cyprus = subset(Cyprus, IndicatorCode == "SE.PRM.UNER")

OutOfSchoolPrimary.Armenia = subset(Armenia, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Belarus = subset(Belarus, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Kazakhstan = subset(Kazakhstan, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Kyrgyzstan = subset(Kyrgyzstan, IndicatorCode == "SE.PRM.UNER")
OutOfSchoolPrimary.Russia = subset(Russia, IndicatorCode == "SE.PRM.UNER")

countriesEU = c("SVN", "SVK", "POL", "MLT", "LTU", "LVA", "HUN", "EST", "CZE", "CYP")
indicators =c("NY.GDP.PCAP.CD", "FP.CPI.TOTL.ZG", "SL.UEM.TOTL.NE.ZS", "NY.GNP.MKTP.KD.ZG", "NE.CON.PRVT.PP.CD", "NE.TRD.GNFS.ZS")

cdata = c()
for(i in 1:length(countriesEU)){
  code = countriesEU[i]
  cdata = c(cdata, code)
  indicatorValues = c()
  for(j in 1:length(indicators)){
    ss = subset(data, CountryCode == code & IndicatorCode == indicators[j])
    years = ss$Year
    for(k in 1:length(years)){
      cdata = c(cdata, years[k])
    }
  }
}

years = CPI.Cyprus$Year
CPI.Cyprus$Value[CPI.Cyprus$Year == 1961]

cdata = matrix(, nrow = 440, ncol = 8)

year = 1961
for(k in 1:44){
  cdata[k, 1] = countriesEU[1]
  cdata[k, 2] = year + k - 1
}

for(k in 45:88){
  cdata[k, 1] = countriesEU[2]
  cdata[k, 2] = year + k - 45
}

for(k in 89:132){
  cdata[k, 1] = countriesEU[3]
  cdata[k, 2] = year + k - 89
}

for(k in 133:176){
  cdata[k, 1] = countriesEU[4]
  cdata[k, 2] = year + k - 133
}

for(k in 177:220){
  cdata[k, 1] = countriesEU[5]
  cdata[k, 2] = year + k - 177
}

for(k in 221:264){
  cdata[k, 1] = countriesEU[6]
  cdata[k, 2] = year + k - 221
}

for(k in 265:308){
  cdata[k, 1] = countriesEU[7]
  cdata[k, 2] = year + k - 265
}

for(k in 309:352){
  cdata[k, 1] = countriesEU[8]
  cdata[k, 2] = year + k - 309
}

for(k in 353:396){
  cdata[k, 1] = countriesEU[9]
  cdata[k, 2] = year + k - 353
}

for(k in 397:440){
  cdata[k, 1] = countriesEU[10]
  cdata[k, 2] = year + k - 397
}

cdataDF = as.data.frame(cdata)
colnames(cdataDF) = c("country", "year", "GDP", "CPI", "Unemployment", "GNI", "Household", "Trade")

cdataDF$GDP = as.numeric(cdataDF$GDP)
cdataDF$CPI = as.numeric(cdataDF$CPI)
cdataDF$Unemployment = as.numeric(cdataDF$Unemployment)
cdataDF$GNI = as.numeric(cdataDF$GNI)
cdataDF$Household = as.numeric(cdataDF$Household)
cdataDF$Trade = as.numeric(cdataDF$Trade)
yeardata = strtoi(cdataDF$year)
cdataDF$year = as.numeric(cdataDF$year)
for(i in 1:length(indicators)){
  for(j in 1:nrow(cdataDF)){
    if(sapply(cdataDF$country[j], as.character) == "SVN"){
      ss = subset(Slovenia, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "SVK"){
      ss = subset(Slovakia, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "POL"){
      ss = subset(Poland, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "MLT"){
      ss = subset(Malta, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "LTU"){
      ss = subset(Lithuania, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "LVA"){
      ss = subset(Latvia, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "HUN"){
      ss = subset(Hungary, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "EST"){
      ss = subset(Estonia, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "CZE"){
      ss = subset(CzechRepublic, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
    else if(sapply(cdataDF$country[j], as.character) == "CYP"){
      ss = subset(Cyprus, Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[i])
    }
#    ss = subset(data, CountryCode == sapply(cdataDF$country[j], as.character) & Year == sapply(cdataDF$year[j], as.character) & IndicatorCode == indicators[j])
#    if(nrow(ss) == 0)
#      next
    print(nrow(ss))
    if(nrow(ss) == 0)
      next
      
    if(indicators[i] == "NY.GDP.PCAP.CD"){
      cdataDF$GDP[j] = ss$Value
    }
    else if(indicators[i] == "FP.CPI.TOTL.ZG"){
      cdataDF$CPI[j] = ss$Value
    }
    else if(indicators[i] == "SL.UEM.TOTL.NE.ZS"){
      cdataDF$Unemployment[j] = ss$Value
    }
    else if(indicators[i] == "NY.GNP.MKTP.KD.ZG"){
      cdataDF$GNI[j] = ss$Value
    }
    else if(indicators[i] == "NE.CON.PRVT.PP.CD"){
      cdataDF$Household[j] = ss$Value
    }
    else if(indicators[i] == "NE.TRD.GNFS.ZS"){
      cdataDF$Trade[j] = ss$Value
    }
  }
}

#write.csv(cdataDF, file = "countriesData.csv")
cdataDF = read.csv("countriesData.csv", header=TRUE)

over94 <- cdataDF$year > 1994
cdataDF = cdataDF[!(numNAs > 5),]
cdataDF = cdataDF[!(over94 == FALSE),]

cdataDF = cdataDF[ , !(names(cdataDF) %in% c("X"))]

scoredata = matrix(, nrow = 10, ncol = 7)
scoredata = as.data.frame(scoredata)
colnames(scoredata) = c("country", "GDP", "CPI", "Unemployment", "GNI", "Household", "Trade")
scoredata$country[1] = "SVN"
scoredata$country[2] = "SVK"
scoredata$country[3] = "POL"
scoredata$country[4] = "MLT"
scoredata$country[5] = "LTU"
scoredata$country[6] = "LVA"
scoredata$country[7] = "HUN"
scoredata$country[8] = "EST"
scoredata$country[9] = "CZE"
scoredata$country[10] = "CYP"

cdataDF[is.na(cdataDF)] = 0

for(i in 1:length(countriesEU)){
  scoreGDP = 0
  scoreValues = cdataDF$GDP[cdataDF$country == countriesEU[i]]
  percentage = 0.1
  for(j in 1:10){
    scoreGDP = scoreGDP + scoreValues[j]*percentage
    percentage = percentage + 0.1
  }
  scoredata$GDP[i] = scoreGDP
}

for(i in 1:length(countriesEU)){
  scoreCPI = 0
  scoreValues = cdataDF$CPI[cdataDF$country == countriesEU[i]]
  percentage = 0.1
  for(j in 1:10){
    scoreCPI = scoreCPI + scoreValues[j]*percentage
    percentage = percentage + 0.1
  }
  scoredata$CPI[i] = scoreCPI
}


for(i in 1:length(countriesEU)){
  scoreUnem = 0
  scoreValues = cdataDF$Unemployment[cdataDF$country == countriesEU[i]]
  percentage = 0.1
  for(j in 1:10){
    scoreUnem = scoreUnem + scoreValues[j]*percentage
    percentage = percentage + 0.1
  }
  scoredata$Unemployment[i] = scoreUnem
}


for(i in 1:length(countriesEU)){
  scoreGNI = 0
  scoreValues = cdataDF$GNI[cdataDF$country == countriesEU[i]]
  percentage = 0.1
  for(j in 1:10){
    scoreGNI = scoreGNI + scoreValues[j]*percentage
    percentage = percentage + 0.1
  }
  scoredata$GNI[i] = scoreGNI
}

for(i in 1:length(countriesEU)){
  scoreHH = 0
  scoreValues = cdataDF$Household[cdataDF$country == countriesEU[i]]
  percentage = 0.1
  for(j in 1:10){
    scoreHH = scoreHH + scoreValues[j]*percentage
    percentage = percentage + 0.1
  }
  scoredata$Household[i] = scoreHH
}

for(i in 1:length(countriesEU)){
  scoreTrade = 0
  scoreValues = cdataDF$Trade[cdataDF$country == countriesEU[i]]
  percentage = 0.1
  for(j in 1:10){
    scoreTrade = scoreTrade + scoreValues[j]*percentage
    percentage = percentage + 0.1
  }
  scoredata$Trade[i] = scoreTrade
}

write.csv(scoredata, file = "countriesEconomicScores.csv")


