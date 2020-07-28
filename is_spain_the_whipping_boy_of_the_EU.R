rm(list=ls())
EUPOP <-read.csv("../DATA/EU_top_10_pop..csv")
EUPOP$Country <- as.factor(EUPOP$Country)
barplot(Population~Country,EUPOP, main="Top 10 EU Counties by Population")
#
EUCOVID <- read.csv("../DATA/COVID-19-ECDPC-2020-07-28.csv")
EUCOVID$dateRep <- gsub("/","-",EUCOVID$dateRep)
EUCOVID$dateRep <- as.Date(EUCOVID$dateRep,format="%m-%d-%Y")
spain <- subset(EUCOVID,geoId =="ES")
plot(spain$dateRep,spain$cases,type="l", main="Spain: Total Daily Cases")
plot(spain$dateRep,spain$deaths,type="l", main="Spain: Total Daily Deaths")
#
# EU GeoID codes
# Spain = ES; Germany = DE, France = FR, Britain = UK, Italy = IT
# Poland = PL, Romania = RO, Netherlands = NL, Belgium = BE, Greece = EL
##
## Germany Plot of Daily Cases and Deaths
##
DE <- subset(EUCOVID,geoId =="DE")
plot(DE$dateRep,DE$cases,type="l", main="Germany: Total Daily Cases")
plot(DE$dateRep,DE$deaths,type="l", main="Germany: Total Daily Deaths")
#
## France Plots of Daily Cases and Deaths
##
FR <- subset(EUCOVID,geoId =="FR")
plot(FR$dateRep,FR$cases,type="l", main="France: Total Daily Cases")
plot(FR$dateRep,FR$deaths,type="l", main="France: Total Daily Deaths")
##
## Great Britain Plots of Daily Cases and Deaths
##
UK <- subset(EUCOVID,geoId =="UK")
plot(UK$dateRep,UK$cases,type="l", main="Great Britain: Total Daily Cases")
plot(UK$dateRep,UK$deaths,type="l", main="Great Britain: Total Daily Deaths")
##
## Great Italy Plots of Daily Cases and Deaths
##
IT <- subset(EUCOVID,geoId =="IT")
plot(IT$dateRep,IT$cases,type="l", main="Italy: Total Daily Cases")
plot(IT$dateRep,IT$deaths,type="l", main="Italy: Total Daily Deaths")
##