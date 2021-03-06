# internention analysis of clustered data, and deriving solid coefficients

setwd("C:/Users/Anton/Documents/Education/DataMining/Project")
#setwd("C:/Users/Anton Yeshchenko/Desktop/Data mining/project")
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape)
library(scales)
library(forecast)
require(hydroGOF)
library(forecast)


#Our research found that by economic indicators, from EU, the nearest to Ukraine are 
#Czeck republic and Hungary (until 2004 year), so let's find out economic growth of these countries


# first we deal with Hungary

GDP.Hungary[,6]
CPI.Hungary[,6]
UEmploy.Hungary[,6]
GNI.Hungary[,6] 
Household.Hungary[,6]
Trade.Hungary[,6]

fit <- auto.arima(CPI.Hungary[,6])
fit
fit <- Arima(CPI.Hungary[,6], order=c(0,1,1))
fit
plotPredictedVsReal(1990,2014,2004,fit,CPI.Hungary[,6])

arima_pred <- function(co){
  fit <- auto.arima(co)
  fit <- Arima(co, order=arimaorder(fit))
  return(fit)
}

plotAR <- function(data){
  plotPredictedVsReal(data[1,5],2014,2004,arima_pred(data[,6]),data[,6])
}

plotAR(GDP.Hungary)
plotAR(CPI.Hungary)
plotAR(UEmploy.Hungary)
plotAR(GNI.Hungary)
plotAR(Household.Hungary)
plotAR(Trade.Hungary)

fit <- auto.arima(GDP.Ukraine[,6])
fit
data = subset(GDP.Ukraine, Year <= 2004 )

fit1 <- Arima(data[,6], order=c(3,2,3))
plotPredictedVsReal(1990,2014,2004,fit1,GDP.Ukraine[,6])

#####

fit <- auto.arima(GDP.Poland[,6])
fit
data = subset(GDP.Poland, Year <= 2004 )

fit1 <- Arima(data[,6], order=c(3,2,3))
plotPredictedVsReal(1990,2014,2004,fit1,GDP.Poland[,6])



acf(diff(GDP.Hungary[,6]))

#loess ggplot2 to smooth

#logistic growth 
  


# Debt.Hungary
# Foreign.Hungary
# Export.Hungary
# Saving.Hungary
# SecIntake.Hungary
# PrimaryPTTRatio.Hungary
# SecondaryPTTRatio.Hungary
# OutOfSchoolPrimary.Hungary




















data = read.csv("Indicators.csv", header=TRUE)

data = subset(data, Year>=1990)

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
GDP.Ukraine =  subset(ukraine, IndicatorCode == "NY.GDP.PCAP.CD")
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


plotPredictedVsReal <- function(startYear, endYear, intervYear, fit, val, color_real = "blue", color_pred = "green"){
  #startYear = 1990 
  #endYear = 2014 
  #intervYear = 2004 
  #fit = fit 
  #val=pol60_14[,3]
  pr <- predict(fit, n.ahead = (endYear-intervYear))
  
  mat      <- data.frame(year=startYear:endYear, value=val)
  mat_pred <- data.frame(year = (intervYear+1):endYear, value = pr$pred)
  colnames(mat_pred) <- c("year", "value")
  colnames(mat) <- c("year", "value")
  
  
  ggplot()+
    geom_line(data=mat,  aes(year,value), size=2, color=color_real)+
    geom_line(data=mat_pred, aes(year,value),size=2,  color=color_pred)
}


a <- matrix(ncol = 2,nrow = 3)
for (i in 1:3){
  a[i,] <- c(1,2)
  
}

