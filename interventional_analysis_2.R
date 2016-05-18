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


# Savings
HealthExpenditure.Slovenia = subset(Slovenia, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Slovakia = subset(Slovakia, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Poland = subset(Poland, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Malta = subset(Malta, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Lithuania = subset(Lithuania, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Latvia = subset(Latvia, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Hungary = subset(Hungary, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Estonia = subset(Estonia, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.CzechRepublic = subset(CzechRepublic, IndicatorCode == "NY.ADJ.NNAT.CD")
HealthExpenditure.Cyprus = subset(Cyprus, IndicatorCode == "NY.ADJ.NNAT.CD")

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
            "Malta")
Yea <- c(2004:2008)

#this is overall coefficients for every country
K_PRED = matrix(nrow = 5,ncol = 10)
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

GDP_PRED = matrix(nrow = 5,ncol = 10)
rownames(GDP_PRED) <- Yea
colnames(GDP_PRED) <- Countr
GDP_PRED <- as.data.frame(GDP_PRED)

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


CPI_PRED = matrix(nrow = 5,ncol = 10)
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
################# Cyprus

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


UNEMP_PRED = matrix(nrow = 5,ncol = 10)
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


TRADE_PRED = matrix(nrow = 5,ncol = 10)
rownames(TRADE_PRED) <- Yea
colnames(TRADE_PRED) <- Countr
TRADE_PRED <- as.data.frame(TRADE_PRED)

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

