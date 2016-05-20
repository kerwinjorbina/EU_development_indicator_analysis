#intervention analysis 2 



setwd("C:/Users/Anton/Documents/Education/DataMining/Project")
#setwd("C:/Users/Anton Yeshchenko/Desktop/Data mining/project")
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape)
library(scales)
library(forecast)
require(hydroGOF)

data <- read.csv("Indicators.csv")


# European Union 2004 Members
Slovenia = subset(data, CountryCode == "SVN" & Year >= 1995)
Slovakia = subset(data, CountryCode == "SVK" & Year >= 1995)
Poland = subset(data, CountryCode == "POL" & Year >= 1995)
Malta = subset(data, CountryCode == "MLT" & Year >= 1995)
Lithuania = subset(data, CountryCode == "LTU" & Year >= 1995)
Latvia = subset(data, CountryCode == "LVA" & Year >= 1995)
Hungary = subset(data, CountryCode == "HUN" & Year >= 1995)
Estonia = subset(data, CountryCode == "EST" & Year >= 1995)
CzechRepublic = subset(data, CountryCode == "CZE" & Year >= 1995)
Cyprus = subset(data, CountryCode == "CYP" & Year >= 1995)

#To compare with
Croatia = subset(data, CountryCode == "HRV" & Year >= 1995)
Romania = subset(data, CountryCode == "ROM" & Year >= 1995)
Bulgaria = subset(data, CountryCode == "BGR" & Year >= 1995)




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

## to compare with
GDP.Croatia = subset(Croatia, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Romania = subset(Romania, IndicatorCode == "NY.GDP.PCAP.CD")
GDP.Bulgaria = subset(Bulgaria, IndicatorCode == "NY.GDP.PCAP.CD")


# Consumer Price Index

CPI.Slovenia = subset(Slovenia, IndicatorCode == "FP.CPI.TOTL")
CPI.Slovakia = subset(Slovakia, IndicatorCode == "FP.CPI.TOTL")
CPI.Poland = subset(Poland, IndicatorCode == "FP.CPI.TOTL")
CPI.Malta = subset(Malta, IndicatorCode == "FP.CPI.TOTL")
CPI.Lithuania = subset(Lithuania, IndicatorCode == "FP.CPI.TOTL")
CPI.Latvia = subset(Latvia, IndicatorCode == "FP.CPI.TOTL")
CPI.Hungary = subset(Hungary, IndicatorCode == "FP.CPI.TOTL")
CPI.Estonia = subset(Estonia, IndicatorCode == "FP.CPI.TOTL")
CPI.CzechRepublic = subset(CzechRepublic, IndicatorCode == "FP.CPI.TOTL")
CPI.Cyprus = subset(Cyprus, IndicatorCode == "FP.CPI.TOTL")

## to compare with
CPI.Croatia = subset(Croatia, IndicatorCode == "FP.CPI.TOTL")
CPI.Romania = subset(Romania, IndicatorCode == "FP.CPI.TOTL")
CPI.Bulgaria = subset(Bulgaria, IndicatorCode == "FP.CPI.TOTL")

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

## to compare with
UEmploy.Croatia = subset(Croatia, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Romania = subset(Romania, IndicatorCode == "SL.UEM.TOTL.NE.ZS")
UEmploy.Bulgaria = subset(Bulgaria, IndicatorCode == "SL.UEM.TOTL.NE.ZS")


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

## to compare with
Trade.Croatia = subset(Croatia, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Romania = subset(Romania, IndicatorCode == "NE.TRD.GNFS.ZS")
Trade.Bulgaria = subset(Bulgaria, IndicatorCode == "NE.TRD.GNFS.ZS")


# Savings
HealthExpenditure.Slovenia = subset(Slovenia, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Slovakia = subset(Slovakia, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Poland = subset(Poland, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Malta = subset(Malta, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Lithuania = subset(Lithuania, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Latvia = subset(Latvia, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Hungary = subset(Hungary, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Estonia = subset(Estonia, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.CzechRepublic = subset(CzechRepublic, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Cyprus = subset(Cyprus, IndicatorCode == "SH.XPD.PCAP")

## to compare with
HealthExpenditure.Croatia = subset(Croatia, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Romania = subset(Romania, IndicatorCode == "SH.XPD.PCAP")
HealthExpenditure.Bulgaria = subset(Bulgaria, IndicatorCode == "SH.XPD.PCAP")

countriesEU = c("SVN", "SVK", "POL", "MLT", "LTU", "LVA", "HUN", "EST", "CZE", "CYP")
indicators =c("NY.GDP.PCAP.CD", "FP.CPI.TOTL.ZG", "SL.UEM.TOTL.NE.ZS",  "NE.CON.PRVT.PP.CD", "NE.TRD.GNFS.ZS")



####################################################################################
#################
################   Additional functions
################
####################################################################################

#these are to find autocorrelation and autovariance to ensure that the process in not stationary


getInterventionCoeficient <- function(fit, val){
  pr <- predict(fit, n.ahead = 5)
  val <- values_indicator_2004_2008(val)
  interv = sum((val - pr$pred)/pr$pred)
  return(interv)
}
getInterventionCoeficientABS <- function(fit, val){
  pr <- predict(fit, n.ahead = 5)
  val <- values_indicator_2004_2008(val)
  interv = abs(sum((val - pr$pred)/pr$pred))
  return(interv)
}


#this one for reverse situation (when we expect ressession)
getInterventionCoeficient_res <- function(fit, val){
  pr <- predict(fit, n.ahead = 5)
  pr$pred[pr$pred < 0] = 0
  val <- values_indicator_2004_2008(val)
  interv = sum((pr$pred - val)/val)
  return(interv)
}

getGrowthInterventionVector <- function(fit, val){
  pr <- predict(fit, n.ahead = 5)
  val <- values_indicator_2004_2008(val)
  return(val - pr$pred)
}
#
getGrowthInterventionVector_res <- function(fit, val){
  pr <- predict(fit, n.ahead = 5)
  pr$pred[pr$pred < 0] = 0
  val <- values_indicator_2004_2008(val)
  return(pr$pred - val)
}


plotPredictedVsReal <- function(startYear, endYear, intervYear, fit, val, color_real = "blue", color_pred = "green"){
  pr <- predict(fit, n.ahead = (endYear-intervYear + 1))
  pr$pred[pr$pred < 0] = 0
  mat      <- data.frame(year=startYear:endYear, value=val)
  mat_pred <- data.frame(year = (intervYear):endYear, value = pr$pred)
  colnames(mat_pred) <- c("year", "value")
  colnames(mat) <- c("year", "value")
  
  
  ggplot()+
    geom_line(data=mat,  aes(year,value), size=2, color=color_real)+ 
    geom_line(data=mat_pred, aes(year,value),size=2,  color=color_pred)
}


first_year <- function(indicator) {
  return(indicator[1,5])
}
last_year <- function(indicator) {
  return(indicator[nrow(indicator),5])
}

missing_present <- function(indicator){
  return(sum(is.na(indicator[,6])))
}

values_indicator <- function(indicator){
  return(indicator[,6])
}



values_indicator_2004_2008 <- function(indicator){
   ind <- subset(indicator, Year <= 2008 & Year >= 2004)
   return(ind[,6])
}

values_indicator_before_intervention <- function(indicator, intervention = 2004){
  return(subset(indicator, Year < 2004)[,6])
}

####################################################################################
#################
################   Additional functions END END END END
################
####################################################################################


Countr <- c("Poland",
            "Slovenia" ,
            "Slovakia"  ,
            "Lithuania",
            "Latvia",  
            "Hungary", 
            "Estonia",
            "CzechRepublic" ,
            "Cyprus",
            "Malta","Croatia","Romania", "Bulgaria")

NumberOfCountries = 13

Yea <- c(2004:2008)

#this is overall coefficients for every country
K_PRED = matrix(nrow = 5,ncol = NumberOfCountries)
colnames(K_PRED) <- Countr
rownames(K_PRED) <- c("GDP","CPI", "Unemployment", "Trade", "HealthExpenditure")
K_PRED <- as.data.frame(K_PRED)


####################################################################################
#################
#Start with GDP 

GDP.Slovenia 
GDP.Slovakia  
GDP.Poland 
GDP.Malta  
GDP.Lithuania
GDP.Latvia  
GDP.Hungary 
GDP.Estonia
GDP.CzechRepublic 
GDP.Cyprus

GDP_PRED = matrix(nrow = 5,ncol = NumberOfCountries)
rownames(GDP_PRED) <- Yea
colnames(GDP_PRED) <- Countr
GDP_PRED <- as.data.frame(GDP_PRED)


PLOTG_NICE = matrix(nrow = 108, ncol = 4)
colnames(PLOTG_NICE) <-  c("id", "order", "Year", "Value")
PLOTG_NICE <- as.data.frame(PLOTG_NICE)


####################################### POLAND

missing_present(GDP.Poland)
first_year(GDP.Poland)
last_year(GDP.Poland)


auto.arima(values_indicator_before_intervention(GDP.Poland))
fit <- Arima(values_indicator_before_intervention(GDP.Poland), order=c(3,3,0))
plotPredictedVsReal(first_year(GDP.Poland), last_year(GDP.Poland), 2004, fit,values_indicator(GDP.Poland) )


GDP_PRED$Poland <- getGrowthInterventionVector(fit,GDP.Poland)
K_PRED$Poland[1] <- getInterventionCoeficient(fit,GDP.Poland)
K_PRED

####################
######  FOR PLOT

PLOTG_NICE
N_CURRENT = 0
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTG_NICE[i,1] = "Poland"
  PLOTG_NICE[i,2] = "Actual"
  PLOTG_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTG_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTG_NICE[i,1] = "Poland"
  PLOTG_NICE[i,2] = "Predicted"
  PLOTG_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTG_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7



current_coef <- GDP.Slovenia
  
missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,4))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Slovenia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Slovenia[1] <- getInterventionCoeficient(fit,current_coef)
K_PRED

####################################################################################
###### Slovakia

current_coef <- GDP.Slovakia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(3,1,5))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Slovakia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Slovakia[1] <- getInterventionCoeficient(fit,current_coef)
K_PRED

####################################################################################
################# Lithuania

current_coef <- GDP.Lithuania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Lithuania <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Lithuania[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTG_NICE[i,1] = "Lithuania"
  PLOTG_NICE[i,2] = "Actual"
  PLOTG_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTG_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTG_NICE[i,1] = "Lithuania"
  PLOTG_NICE[i,2] = "Predicted"
  PLOTG_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTG_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
################# Latvia

current_coef <- GDP.Latvia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Latvia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Latvia[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTG_NICE[i,1] = "Latvia"
  PLOTG_NICE[i,2] = "Actual"
  PLOTG_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTG_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTG_NICE[i,1] = "Latvia"
  PLOTG_NICE[i,2] = "Predicted"
  PLOTG_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTG_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
################# Hungary

current_coef <- GDP.Hungary

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,3))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Hungary <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Hungary[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED


####################################################################################
################# Estonia

current_coef <- GDP.Estonia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Estonia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Estonia[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTG_NICE[i,1] = "Estonia"
  PLOTG_NICE[i,2] = "Actual"
  PLOTG_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTG_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTG_NICE[i,1] = "Estonia"
  PLOTG_NICE[i,2] = "Predicted"
  PLOTG_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTG_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
#################CzechRepublic
current_coef <- GDP.CzechRepublic

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$CzechRepublic <- getGrowthInterventionVector(fit,current_coef)
K_PRED$CzechRepublic[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

####################################################################################
################# Cyprus
current_coef <- GDP.Cyprus

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(4,2,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Cyprus <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Cyprus[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

####################################################################################
################# Malta
current_coef <- GDP.Malta

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Malta <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Malta[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

####################################################################################
################# Croatia
current_coef <- GDP.Croatia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Croatia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Croatia[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTG_NICE[i,1] = "Croatia"
  PLOTG_NICE[i,2] = "Actual"
  PLOTG_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTG_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTG_NICE[i,1] = "Croatia"
  PLOTG_NICE[i,2] = "Predicted"
  PLOTG_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTG_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
################# Romania
current_coef <- GDP.Romania 

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Romania <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Romania[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

####################################################################################
################# Bulgaria
current_coef <- GDP.Bulgaria

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


GDP_PRED$Bulgaria <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Bulgaria[1] <- getInterventionCoeficient(fit,current_coef)
GDP_PRED
K_PRED

c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTG_NICE[i,1] = "Bulgaria"
  PLOTG_NICE[i,2] = "Actual"
  PLOTG_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTG_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTG_NICE[i,1] = "Bulgaria"
  PLOTG_NICE[i,2] = "Predicted"
  PLOTG_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTG_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7





####################################################################################
####################################################################################
####################################################################################
####################################################################################
############      CPI
############  Here we have Consumer price index
############ 
####################################################################################
####################################################################################
####################################################################################
####################################################################################


CPI_PRED = matrix(nrow = 5,ncol = NumberOfCountries)
rownames(CPI_PRED) <- Yea
colnames(CPI_PRED) <- Countr
CPI_PRED <- as.data.frame(CPI_PRED)

####################################### POLAND

current_coef <- CPI.Poland

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Poland <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Poland[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED






####################################################################################
################# Slovenia

current_coef <- CPI.Slovenia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Slovenia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Slovenia[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED



####################################################################################
################# Slovakia

current_coef <- CPI.Slovakia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Slovakia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Slovakia[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED

####################################################################################
################# Lithuania

current_coef <- CPI.Lithuania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Lithuania <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Lithuania[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED
####################################################################################
################# Latvia

current_coef <- CPI.Latvia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Latvia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Latvia[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED


####################################################################################
################# Hungary

current_coef <- CPI.Hungary

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Hungary<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Hungary[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED




####################################################################################
################# Estonia

current_coef <- CPI.Estonia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Estonia<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Estonia[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED



####################################################################################
################# ChechRepublic

current_coef <- CPI.CzechRepublic

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,5))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$CzechRepublic<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$CzechRepublic[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED


####################################################################################
################# Cyprus

current_coef <- CPI.Cyprus

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,5))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Cyprus<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Cyprus[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED


####################################################################################
################# Malta

current_coef <- CPI.Malta

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Malta<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Malta[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED

####################################################################################
################# Croatia

current_coef <- CPI.Croatia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Croatia<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Croatia[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED


####################################################################################
################# Romania

current_coef <- CPI.Romania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Romania<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Romania[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED


####################################################################################
################# Bulgaria

current_coef <- CPI.Bulgaria

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


CPI_PRED$Bulgaria<- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Bulgaria[2] <- getInterventionCoeficient_res(fit,current_coef)
CPI_PRED
K_PRED

####################################################################################
####################################################################################
####################################################################################
####################################################################################
############  
############      Unemployment
############
####################################################################################
####################################################################################
####################################################################################
####################################################################################


UNEMP_PRED = matrix(nrow = 5,ncol = NumberOfCountries)
rownames(UNEMP_PRED) <- Yea
colnames(UNEMP_PRED) <- Countr
UNEMP_PRED <- as.data.frame(UNEMP_PRED)

####################################################################################
####################################### POLAND

current_coef <- UEmploy.Poland

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Poland <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Poland[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Slovenia

current_coef <- UEmploy.Slovenia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Slovenia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Slovenia[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Slovakia

current_coef <- UEmploy.Slovakia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Slovakia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Slovakia[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Lithuania

current_coef <- UEmploy.Lithuania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Lithuania <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Lithuania[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED


####################################################################################
####################################### Latvia

current_coef <- UEmploy.Latvia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Latvia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Latvia[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Hungary

current_coef <- UEmploy.Hungary

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Hungary <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Hungary[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED


####################################################################################
####################################### Estonia

current_coef <- UEmploy.Estonia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Estonia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Estonia[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED


####################################################################################
####################################### CzechRepublic

current_coef <- UEmploy.CzechRepublic

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$CzechRepublic <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$CzechRepublic[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED


####################################################################################
####################################### cyprus

current_coef <- UEmploy.Cyprus

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Cyprus <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Cyprus[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Malta

current_coef <- UEmploy.Malta

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Malta <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Malta[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Croatia

current_coef <- UEmploy.Croatia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Croatia <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Croatia[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED

####################################################################################
####################################### Romania

current_coef <- UEmploy.Romania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Romania <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Romania[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED


####################################################################################
####################################### Bulgaria

current_coef <- UEmploy.Bulgaria

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


UNEMP_PRED$Bulgaria <- getGrowthInterventionVector_res(fit,current_coef)
K_PRED$Bulgaria[3] <- getInterventionCoeficient_res(fit,current_coef)
UNEMP_PRED
K_PRED






####################################################################################
####################################################################################
####################################################################################
####################################################################################
############  
############      Trade
############
####################################################################################
####################################################################################
####################################################################################
####################################################################################


TRADE_PRED = matrix(nrow = 5,ncol = NumberOfCountries)
rownames(TRADE_PRED) <- Yea
colnames(TRADE_PRED) <- Countr
TRADE_PRED <- as.data.frame(TRADE_PRED)

####
############
###################
#############################

PLOT_NICE = matrix(nrow = 90, ncol = 4)
colnames(PLOT_NICE) <-  c("id", "order", "Year", "Value")
PLOT_NICE <- as.data.frame(PLOT_NICE)


####################################################################################
####################################### POLAND

current_coef <- Trade.Poland

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )

PLOT_NICE
N_CURRENT = 1
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in 1:11){
  PLOT_NICE[i,1] = "Poland"
  PLOT_NICE[i,2] = "Actual"
  PLOT_NICE[i,3] = c[i,5]
  PLOT_NICE[i,4] = c[i,6]
}
N_CURRENT = N_CURRENT + 10
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOT_NICE[i,1] = "Poland"
  PLOT_NICE[i,2] = "Predicted"
  PLOT_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOT_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7

TRADE_PRED$Poland <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Poland[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED



####################################################################################
####################################### Slovenia

current_coef <- Trade.Slovenia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Slovenia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Slovenia[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED

####################################################################################
####################################### Slovakia

current_coef <- Trade.Slovakia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Slovakia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Slovakia[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED


####################################################################################
####################################### Lithuania

current_coef <- Trade.Lithuania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Lithuania <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Lithuania[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED

####################
######  FOR PLOT

PLOT_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOT_NICE[i,1] = "Lithuania"
  PLOT_NICE[i,2] = "Actual"
  PLOT_NICE[i,3] = c[i-N_CURRENT,5]
  PLOT_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOT_NICE[i,1] = "Lithuania"
  PLOT_NICE[i,2] = "Predicted"
  PLOT_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOT_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7



####################################################################################
####################################### Latvia

current_coef <- Trade.Latvia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Latvia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Latvia[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED

#######################
#############
#######     For plot

PLOT_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOT_NICE[i,1] = "Latvia"
  PLOT_NICE[i,2] = "Actual"
  PLOT_NICE[i,3] = c[i-N_CURRENT,5]
  PLOT_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOT_NICE[i,1] = "Latvia"
  PLOT_NICE[i,2] = "Predicted"
  PLOT_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOT_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
####################################### hUNGARY

current_coef <- Trade.Hungary

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Hungary <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Hungary[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED


####################################################################################
####################################### Estonia

current_coef <- Trade.Estonia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Estonia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Estonia[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED

#######################
#############
#######     For plot

PLOT_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOT_NICE[i,1] = "Estonia"
  PLOT_NICE[i,2] = "Actual"
  PLOT_NICE[i,3] = c[i-N_CURRENT,5]
  PLOT_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOT_NICE[i,1] = "Estonia"
  PLOT_NICE[i,2] = "Predicted"
  PLOT_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOT_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7



####################################################################################
####################################### CzechRepublic

current_coef <- Trade.CzechRepublic


missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(3,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$CzechRepublic <- getGrowthInterventionVector(fit,current_coef)
K_PRED$CzechRepublic[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED


####################################################################################
####################################### Cyprus

current_coef <- Trade.Cyprus


missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Cyprus <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Cyprus[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED


####################################################################################
####################################### Malta

current_coef <- Trade.Malta

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Malta <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Malta[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED
####################################################################################
####################################### Croatia

current_coef <- Trade.Croatia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,1,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Croatia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Croatia[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED


#######################
#############
#######     For plot

PLOT_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOT_NICE[i,1] = "Croatia"
  PLOT_NICE[i,2] = "Actual"
  PLOT_NICE[i,3] = c[i-N_CURRENT,5]
  PLOT_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOT_NICE[i,1] = "Croatia"
  PLOT_NICE[i,2] = "Predicted"
  PLOT_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOT_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
####################################### Romania

current_coef <- Trade.Romania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Romania <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Romania[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED


####################################################################################
####################################### Bulgaria

current_coef <- Trade.Bulgaria

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


TRADE_PRED$Bulgaria <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Bulgaria[4] <- getInterventionCoeficient(fit,current_coef)
TRADE_PRED
K_PRED



#######################
#############
#######     For plot

PLOT_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOT_NICE[i,1] = "Bulgaria"
  PLOT_NICE[i,2] = "Actual"
  PLOT_NICE[i,3] = c[i-N_CURRENT,5]
  PLOT_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOT_NICE[i,1] = "Bulgaria"
  PLOT_NICE[i,2] = "Predicted"
  PLOT_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOT_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7


####################################################################################
####################################################################################
####################################################################################
####################################################################################
############  
############      Health Expenditure
############
####################################################################################
####################################################################################
####################################################################################
####################################################################################


HEALTH_PRED = matrix(nrow = 5,ncol = NumberOfCountries)
rownames(HEALTH_PRED) <- Yea
colnames(HEALTH_PRED) <- Countr
HEALTH_PRED <- as.data.frame(HEALTH_PRED)


PLOTH_NICE = matrix(nrow = 90, ncol = 4)
colnames(PLOTH_NICE) <-  c("id", "order", "Year", "Value")
PLOTH_NICE <- as.data.frame(PLOTH_NICE)



####################################################################################
####################################### POLAND

current_coef <- HealthExpenditure.Poland

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(3,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$Poland <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Poland[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED

########

PLOTH_NICE
N_CURRENT = 1
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in 1:11){
  PLOTH_NICE[i,1] = "Poland"
  PLOTH_NICE[i,2] = "Actual"
  PLOTH_NICE[i,3] = c[i,5]
  PLOTH_NICE[i,4] = c[i,6]
}
N_CURRENT = N_CURRENT + 10
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTH_NICE[i,1] = "Poland"
  PLOTH_NICE[i,2] = "Predicted"
  PLOTH_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTH_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7



####################################################################################
####################################### Slovenia

current_coef <- HealthExpenditure.Slovenia 

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,3))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$Slovenia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Slovenia[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################################################################################
####################################### Slovakia

current_coef <- HealthExpenditure.Slovakia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef))

a <- c(values_indicator(current_coef)[1:6],
  ((values_indicator(current_coef)[6]+values_indicator(current_coef)[7])/2),
  values_indicator(current_coef)[7:18])



HEALTH_PRED$Slovakia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Slovakia[5] <- getInterventionCoeficientABS(fit,current_coef)
HEALTH_PRED
K_PRED


####################################################################################
####################################### Lithuania
######
######    NO DATA AVALIALABLE TO MAKE A PREDICTION
######



current_coef <- HealthExpenditure.Lithuania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,0,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef))



HEALTH_PRED$Lithuania <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Lithuania[5] <- getInterventionCoeficientABS(fit,current_coef)
HEALTH_PRED
K_PRED


####################
######  FOR PLOT

PLOTH_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTH_NICE[i,1] = "Lithuania"
  PLOTH_NICE[i,2] = "Actual"
  PLOTH_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTH_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTH_NICE[i,1] = "Lithuania"
  PLOTH_NICE[i,2] = "Predicted"
  PLOTH_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTH_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7
####################################################################################
####################################### Latvia

current_coef <- HealthExpenditure.Latvia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$Latvia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Latvia[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################
######  FOR PLOT

PLOTH_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTH_NICE[i,1] = "Latvia"
  PLOTH_NICE[i,2] = "Actual"
  PLOTH_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTH_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTH_NICE[i,1] = "Latvia"
  PLOTH_NICE[i,2] = "Predicted"
  PLOTH_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTH_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7

####################################################################################
####################################### Hungary

current_coef <- HealthExpenditure.Hungary

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,5))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$Hungary <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Hungary[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################################################################################
####################################### Estonia

current_coef <- HealthExpenditure.Estonia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$Estonia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Estonia[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################
######  FOR PLOT

PLOTH_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTH_NICE[i,1] = "Estonia"
  PLOTH_NICE[i,2] = "Actual"
  PLOTH_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTH_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTH_NICE[i,1] = "Estonia"
  PLOTH_NICE[i,2] = "Predicted"
  PLOTH_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTH_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7

####################################################################################
####################################### CzechRepublic

current_coef <- HealthExpenditure.CzechRepublic

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$CzechRepublic <- getGrowthInterventionVector(fit,current_coef)
K_PRED$CzechRepublic[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################################################################################
####################################### Cyprus

current_coef <- HealthExpenditure.Cyprus

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,1,2))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef) )


HEALTH_PRED$Cyprus <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Cyprus[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED

####################################################################################
####################################### Malta

current_coef <- HealthExpenditure.Malta

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,3))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef))


HEALTH_PRED$Malta <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Malta[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################################################################################################################################
################################################################################################################

####################################################################################
####################################### Croatia

current_coef <- HealthExpenditure.Croatia

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(2,2,1))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef))


HEALTH_PRED$Croatia <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Croatia[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################
######  FOR PLOT

PLOTH_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTH_NICE[i,1] = "Croatia"
  PLOTH_NICE[i,2] = "Actual"
  PLOTH_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTH_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTH_NICE[i,1] = "Croatia"
  PLOTH_NICE[i,2] = "Predicted"
  PLOTH_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTH_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7
####################################################################################
####################################### Romania

current_coef <- HealthExpenditure.Romania

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(1,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef))


HEALTH_PRED$Romania <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Romania[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED

####################################################################################
####################################### Bulgaria

current_coef <- HealthExpenditure.Bulgaria

missing_present(current_coef)
first_year(current_coef)
last_year(current_coef)

acf(values_indicator_before_intervention(current_coef))
pacf(values_indicator_before_intervention(current_coef))

auto.arima(values_indicator_before_intervention(current_coef))
fit <- Arima(values_indicator_before_intervention(current_coef), order=c(0,2,0))
plotPredictedVsReal(first_year(current_coef), last_year(current_coef), 2004, fit,values_indicator(current_coef))


HEALTH_PRED$Bulgaria <- getGrowthInterventionVector(fit,current_coef)
K_PRED$Bulgaria[5] <- getInterventionCoeficient(fit,current_coef)
HEALTH_PRED
K_PRED


####################
######  FOR PLOT

PLOTH_NICE
c = subset(current_coef, Year <= 2010 & Year >= 2000)
for (i in (1+N_CURRENT):(11+N_CURRENT)){
  PLOTH_NICE[i,1] = "Bulgaria"
  PLOTH_NICE[i,2] = "Actual"
  PLOTH_NICE[i,3] = c[i-N_CURRENT,5]
  PLOTH_NICE[i,4] = c[i-N_CURRENT,6]
}
N_CURRENT = N_CURRENT + 11
Ppr <- predict(fit, n.ahead = 7)
for (i in (1+N_CURRENT):(7+N_CURRENT)){
  PLOTH_NICE[i,1] = "Bulgaria"
  PLOTH_NICE[i,2] = "Predicted"
  PLOTH_NICE[i,3] = c(2004:2010)[i-N_CURRENT]
  PLOTH_NICE[i,4] = Ppr$pred[i-N_CURRENT]
}
N_CURRENT = N_CURRENT + 7

####################################################################################################################################
################################################################################################################

normalizeOverall <- function(data){
  d1 <- data
  for (i in 1:5) {
    e <- data[i,] + abs(min(data[i,],na.rm = T))
    e <- e / (max(e,na.rm = T) - min(e,na.rm = T))
    d1[i,] <- e
  }  
  return(d1)
}


normalized <- normalizeOverall(K_PRED)

betternessCoeficient <- function(data){
  better = matrix(nrow = 1,ncol = NumberOfCountries)
  rownames(better) <- c("Coefficient")
  colnames(better) <- Countr
  better <- as.data.frame(better)
  
  for (i in 1:NumberOfCountries) {
    better[,i] <- sum(data[,i], na.rm = T)  
  }
  return(better)
}





who_is_more <- betternessCoeficient(normalized)

who_is_more <- as.data.frame(who_is_more)

who = matrix(nrow = 13,ncol = 2)
who <- as.data.frame(who)
who[,1] <- Countr
who[,2] <- c(as.matrix(who_is_more[1,])[1,])

colnames(who) <- c("Country", "Projected growth score")

ggplot(data=who, aes(x=Country, y=`Projected growth score`, fill=Country)) +
  geom_bar(stat="identity")

################################################################################################################################################
################################################################################################################################################
################################################################################################################################################
########################  BAR PLOT FOR ALL 
######################################################################## 
########################################################################
########################################################################
K_PRED

who_all = matrix(nrow = 13,ncol = 6)
who_all <- as.data.frame(who_all)
who_all[,1] <- Countr
who_all
who_all[,2] <- c(as.matrix(K_PRED[1,])[1,])
who_all[,3] <- c(as.matrix(K_PRED[2,])[1,])
who_all[,4] <- c(as.matrix(K_PRED[3,])[1,])
who_all[,5] <- c(as.matrix(K_PRED[4,])[1,])
who_all[,6] <- c(as.matrix(K_PRED[5,])[1,])
colnames(who_all) <- c("Country", "GDP", "CPI","Unemployment", "Trade", "HealthExpenditure")

who_all
library(grid)
bar1 <- ggplot(data=who_all, aes(x=Country, y=GDP, fill=Country)) + geom_bar(stat="identity")
bar2 <- ggplot(data=who_all, aes(x=Country, y=CPI, fill=Country)) + geom_bar(stat="identity")
bar3 <- ggplot(data=who_all, aes(x=Country, y=Unemployment, fill=Country)) + geom_bar(stat="identity")
bar4 <- ggplot(data=who_all, aes(x=Country, y=Trade, fill=Country)) + geom_bar(stat="identity")
bar5 <- ggplot(data=who_all, aes(x=Country, y=HealthExpenditure, fill=Country)) + geom_bar(stat="identity")
multiplot(bar1,bar2,bar3,bar4,bar5)


multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


write.csv(GDP_PRED, file = "GDP_PRED.csv")
write.csv(HEALTH_PRED, file = "HEALTH_PRED.csv")
write.csv(TRADE_PRED, file="TRADE_PRED.csv")
write.csv(UNEMP_PRED, file="UNEMP_PRED.csv")
write.csv(CPI_PRED, file = "CPI_PRED.csv")