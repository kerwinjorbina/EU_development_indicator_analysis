# internention analysis

setwd("C:/Users/Anton/Documents/Education/DataMining/Project")
#setwd("C:/Users/Anton Yeshchenko/Desktop/Data mining/project")
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape)
library(scales)
library(forecast)
require(hydroGOF)
dev <- read.csv("Indicators.csv")
head(dev)
levels(dev$IndicatorName)

eu2004 <- c("Hungary","Slovenia","Slovak Republic","Poland","Lithuania","Latvia","Estonia","Czech Republic")

#these for further analysis as large enough
eu2004_1 <- c("Hungary","Slovak Republic","Poland","Czech Republic")

eu2007 <- c("Bulgaria","Romania")

ukraine <- c("Ukraine")

eeu2010 <- c("Russian Federation","Belarus","Kazakhstan","Armenia","Kyrgyz Republic")




plotCountriesGDP <- function(c) {
  compCountry <- c#countries to compare
  countryInd <- dev %>% filter(dev$CountryName %in% compCountry) %>% select(5,2,3,4,6)
  countryInd1 <- countryInd %>% select(1,2,4,5) %>% spread(key = IndicatorCode, value = Value)
  titleformat <- theme(plot.title = element_text(color = "blue", size = 16, face = "bold"))
  
  gdp2004 <- countryInd1 %>% select(Year, CountryCode, one_of(c("NY.GDP.PCAP.PP.CD"))) %>%
    filter(Year >=1990)
  gdp2004
  colnames(gdp2004)[3] <- c("GDP PPP")
  gdp20041 <- melt(gdp2004, id = c("Year", "CountryCode"))
  plot2 <- ggplot(gdp20041, aes(Year, value, col = CountryCode)) +
    geom_line(size = 1.3) + 
    facet_grid(.~variable) + 
    # scale_y_continuous(breaks=seq(0, 20, 2))+
    ylab("GDP numbers") +
    ggtitle("GDP per capita, PPP") +
    theme(axis.title.x = element_blank(),legend.justification = c(1,1), legend.position= c(0.2,1.1),legend.title=element_blank()) +
    titleformat 
  return(plot2)
}

plotCountriesGDP("Poland")

countryInd <- dev %>% filter(dev$CountryName %in% "Poland") %>% select(5,2,3,4,6)


countryInd1 <- countryInd %>% select(1,2,4,5) %>% spread(key = IndicatorCode, value = Value)
pol60_14 <- countryInd1 %>% select(Year, CountryCode, one_of(c("NY.GDP.PCAP.PP.CD"))) %>%
  filter(Year >=1990 & Year < 2015)


#gdp for poland for year 1990-2014

plot(pol60_14[,1], pol60_14[,3])


#Now cut data for poland, when they got to EU

pol60_04 <- countryInd1 %>% select(Year, CountryCode, one_of(c("NY.GDP.PCAP.PP.CD"))) %>%
  filter(Year >=1990 & Year < 2005)


plot(pol60_04[,1], pol60_04[,3])

# now try the arima model 

#approach from here 
#https://www.otexts.org/fpp/8/7

#install.packages("forecast")
library(forecast)

# we encounter the problem that our data is not stationary, that is the mean and variance 
# are changing over time

# that is because we can model ARIMA only on statinary data
# (concern of this theorem) https://en.wikipedia.org/wiki/Wold's_theorem

# so we need to make data stationary
#in order to do that we use wide-known technique taking difference between elements in time series


#these are to find autocorrelation and autovariance to ensure that the process in not stationary
acf(pol60_14[,3])
pacf(pol60_14[,3])


diff_y = pol60_04[-1,1]
diff_pol60_04 = diff(pol60_04[,3])
plot(diff_y, diff_pol60_04)

#try to check now

acf(diff_pol60_04)
pacf(diff_pol60_04)
diff_ydiff_pol60_04
auto.arima(pol60_04[,3], d=2, D=0)
?auto.arima
#order means 1 - order of diff (for our model is 1 better?)
# no seasonal component!
fit <- Arima(pol60_04[,3], order=c(0,2,0))
fit
?Arima

?auto.arima

pol60_04[,3]
gdp_pred = predict(fit, n.ahead = 10)
gdp_pred$pred

plot(pol60_14[,1], c(pol60_04[,3],gdp_pred$pred))

plot(fit)

#We will construct the table for one country, one feature, but with prediction and without
#columns will look like these:
# "Year" "Type" "Value"



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

plotPredictedVsReal(1990,2014,2004,fit,pol60_14[,3])

getDataByIndicator <- function(country, indicator) {
  countryInd <- dev %>% filter(dev$CountryName %in% country) %>% select(5,2,3,4,6)
  countryInd1 <- countryInd %>% select(1,2,4,5) %>% spread(key = IndicatorCode, value = Value)
  data <- countryInd1 %>% select(Year, CountryCode, one_of(indicator)) %>%
    filter(Year >=1990 & Year < 2015)
  return(data[,3])
}

giniPoland <- getDataByIndicator("Estonia", "SI.POV.GINI")


#if the model contains missing values 
#we use this interpretation:
#http://stats.stackexchange.com/questions/104565/how-to-use-auto-arima-to-impute-missing-values
#in order to estimate missing
#becaue the ARIMA supposes that we have all data in strickt sequence
# fit model
fit <- auto.arima(giniPoland)
# Kalman filter

kr <- KalmanRun(giniPoland, fit$model)
# impute missing values Z %*% alpha at each missing observation

id.na <- which(is.na(giniPoland))
for (i in id.na)
  giniPoland[i] <- fit$model$Z %*% kr$states[i,]



auto.arima(giniPoland)
fit <- Arima(giniPoland, order=c(0,0,1))
plotPredictedVsReal(1990,2014,2004,fit, giniPoland)


#now find the value that will show the quantative difference between 
#that have happened and what might have happened if there werent any intervention

getInterventionCoeficient <- function(startYear, endYear, intervYear, fit, val){
  # startYear = 1990
  # endYear = 2014
  # intervYear = 2004
  # fit = fit
  # val=giniPoland
  pr <- predict(fit, n.ahead = (endYear-intervYear))
  val <- tail(val,(endYear-intervYear))
  
  normal_factor <- max(c(pr$pred, val)) - min(c(pr$pred, val))
  
  interv = sum(pr$pred-val) / (normal_factor * (endYear-intervYear))
  return(interv)
}

getInterventionCoeficient(1990,2014,2004,fit, giniPoland)
plotPredictedVsReal(1990,2014,2004,fit, gdp_pred$pred)
getInterventionCoeficient(1990,2014,2004,fit, pol60_14[,3])

tail(1:10,4)

