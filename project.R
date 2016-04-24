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


#EACU members
russia = retrieveCountryData("Russian Federation")
belarus = retrieveCountryData("Belarus")
kazakhstan = retrieveCountryData("Kazakhstan")
armenia = retrieveCountryData("Armenia")
kyrgyzstan = retrieveCountryData("Kyrgyz Republic")

kyrgyzstan[,3]

ukr = ukraine[-(1394:1421),]
