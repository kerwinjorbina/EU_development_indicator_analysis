setwd("C:/Users/Anton Yeshchenko/Desktop/Data mining/project")

library(dplyr)
library(readr)
countries <- read_csv("WDI_data.csv")



retrieveCountryData <- function(countryName, data = countries){
  return(countries[which(countries$`Country Name` == countryName),])
}



ukraine = retrieveCountryData("Ukraine")

#these countries joined EU in 2004
hungary = retrieveCountryData("Hungary")
slovenia = retrieveCountryData("Slovenia")
slovakia = retrieveCountryData("Slovak Republic")
poland = retrieveCountryData("Poland")
lithuania = retrieveCountryData("Lithuania")
latvia = retrieveCountryData("Latvia")
estonia = retrieveCountryData("Estonia")
czech_republic = retrieveCountryData("Czech Republic")

#these countries joined EU in 2007
bulgaria = retrieveCountryData("Bulgaria")
romania = retrieveCountryData("Romania")


#EACU members
russia = retrieveCountryData("Russian Federation")
belarus = retrieveCountryData("Belarus")
kazakhstan = retrieveCountryData("Kazakhstan")
armenia = retrieveCountryData("Armenia")
kyrgyzstan = retrieveCountryData("Kyrgyz Republic")

plot (kyrgyzstan$)

################################################################
##                                                            ##
##          D e s c r i p t i v e   s t a t i s t i c s       ##
##  `                                                         ##
################################################################
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape)
library(scales)



compCountry <- c("Lithuania","Latvia","Estonia", "Ukraine") #countries to compare
countryInd <- countries %>% filter(countries$`Country Name` %in% compCountry) %>% select(5,2,3,4,6)
countryInd1 <- countryInd %>% select(1,2,4,5) %>% spread(key = IndicatorCode, value = Value)
titleformat <- theme(plot.title = element_text(color = "blue", size = 16, face = "bold"))


dev <- read.csv("Indicators.csv")


compCountry <- c("Russian Federation", "Lithuania","Latvia","Estonia","Ukraine", "Finland", "United Kingdom" )#countries to compare
countryInd <- dev %>% filter(dev$CountryName %in% compCountry) %>% select(5,2,3,4,6)
countryInd1 <- countryInd %>% select(1,2,4,5) %>% spread(key = IndicatorCode, value = Value)
titleformat <- theme(plot.title = element_text(color = "blue", size = 16, face = "bold"))

population <- countryInd1 %>% select(Year, CountryCode, one_of(c("SP.POP.0014.TO.ZS", "SP.POP.1564.TO.ZS", "SP.POP.65UP.TO.ZS")))
colnames(population)[3:5] <- c("0-14", "15-64", "65 & above")
population <- melt(population, id= c("Year", "CountryCode"))
plot1 <- ggplot(subset(population,!is.na(value)), aes(Year, value, fill = variable)) + 
  geom_bar(stat = "identity",position = "stack") +
  facet_grid (.~CountryCode) + ylab("Population(%)")+
  scale_fill_discrete(name = "age range") +
  ggtitle("POPULATION MIX") + 
  theme(legend.justification = c(1,1), legend.position = c(1,.85), axis.title.x = element_blank()) +
  titleformat

plot1

unemployment <- countryInd1 %>% select(Year, CountryCode, one_of(c("SL.UEM.TOTL.ZS", "SL.UEM.TOTL.FE.ZS", "SL.UEM.TOTL.MA.ZS"))) %>%
  filter(Year >=1990)
colnames(unemployment)[3:5] <- c("Total", "Female", "Male")
unemployment1 <- melt(unemployment, id = c("Year", "CountryCode"))
plot2 <- ggplot(unemployment1, aes(Year, value, col = CountryCode)) +
  geom_line(size = 1.5) + 
  facet_grid(.~variable) + 
  scale_y_continuous(breaks=seq(0, 20, 2))+
  ylab("Unemployment (% of total") +
  ggtitle("Unemployment level") +
  theme(axis.title.x = element_blank(),legend.justification = c(1,1), legend.position= c(1,1),legend.title=element_blank()) +
  titleformat      
plot2