        rm(list=ls())
        EUPOP <-read.csv("../DATA/EU_top_10_pop..csv")
        EUPOP$Country <- as.factor(EUPOP$Country)
        barplot(Population~Country,EUPOP, main="Top 10 EU Counties by Population")
        #
        EUCOVID <- read.csv("../DATA/COVID-19-ECDPC-2020-07-28.csv")
        EUCOVID$dateRep <- gsub("/","-",EUCOVID$dateRep)
        EUCOVID$dateRep <- as.Date(EUCOVID$dateRep,format="%m-%d-%Y")
        spain <- subset(EUCOVID,geoId =="ES")
        plot(spain$dateRep,spain$cases,type="l", main="Spain: Total Daily Cases",ylim=c(0,max(spain$cases)))
        plot(spain$dateRep,spain$deaths,type="l", main="Spain: Total Daily Deaths",ylim=c(0,max(spain$deaths)))
        #
        # EU GeoID codes
        # Spain = ES; Germany = DE, France = FR, Britain = UK, Italy = IT
        # Poland = PL, Romania = RO, Netherlands = NL, Belgium = BE, Greece = EL
        ##
        ## Germany Plot of Daily Cases and Deaths
        ##
        DE <- subset(EUCOVID,geoId =="DE")
        plot(DE$dateRep,DE$cases,type="l", main="Spain vs Germany: Total Daily Cases",col="blue")
        lines(spain$dateRep,spain$cases,col="red")
        legend("topleft",
               c("Germany","Spain"),
               col=c("blue","red"),
               lty = c(1, 1),
               cex = 0.6)
        grid()
        #
        plot(DE$dateRep,DE$deaths,type="l", main="Spain vs Germany: Total Daily Deaths",col="blue")
        lines(spain$dateRep,spain$deaths,col="red")
        legend("topleft",
               c("Germany","Spain"),
               col=c("blue","red"),
               lty = c(1, 1),
               cex = 0.6)
        grid()
        #
## France Plots of Daily Cases and Deaths
##
FR <- subset(EUCOVID,geoId =="FR")
plot(FR$dateRep,FR$cases,type="l", main="Spain vs France: Total Daily Cases",col="blue"   )
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("France","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()
#
plot(FR$dateRep,FR$deaths,type="l", main="Spain vs France: Total Daily Deaths",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("France","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()
##
## Great Britain Plots of Daily Cases and Deaths
##
UK <- subset(EUCOVID,geoId =="UK")
plot(UK$dateRep,UK$cases,type="l", main="Spain vs Great Britain: Total Daily Cases",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Great Britain","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()

plot(UK$dateRep,UK$deaths,type="l", main="Spain vs Great Britain: Total Daily Deaths",col="blue")
lines(spain$dateRep,spain$deaths,col="red")
legend("topleft",
       c("Great Britain","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()
##
## Great Poland Plots of Daily Cases and Deaths
##
PL <- subset(EUCOVID,geoId =="PL")
plot(PL$dateRep,PL$cases,type="l", main="Spain vs Poland: Total Daily Cases",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Poland","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()


plot(PL$dateRep,PL$deaths,type="l", main="Poland: Total Daily Deaths",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Poland","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
       
grid()
##
## Italy  Plots of Daily Cases and Deaths.
IT <- subset(EUCOVID,geoId =="PL")
plot(IT$dateRep,IT$cases,type="l", main="Spain vs Italy: Total Daily Cases",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Italy","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()
plot(IT$dateRep,IT$deaths,type="l", main=" Spain vs Italy: Total Daily Deaths",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Italy","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()
##
## Combine country cases and deaths into single data.frame
##
EUCOMBINED <- rbind(DE,FR,IT,PL,spain,UK)
# Calc daily aggregate for cases and deaths
CASESSUM <- aggregate(x=EUCOMBINED$cases,by=list(EUCOMBINED$dateRep),FUN=sum)
DEATHSSSUM <- aggregate(x=EUCOMBINED$deaths,by=list(EUCOMBINED$dateRep),FUN=sum)
##
## Calculate Daily Mean/Average for Cases and Deaths
CASESAVG <- aggregate(x=EUCOMBINED$cases,by=list(EUCOMBINED$dateRep),FUN=mean)
DEATHSAVG <- aggregate(x=EUCOMBINED$deaths,by=list(EUCOMBINED$dateRep),FUN=mean)
##
## Plot Daily Totals for Gang of Five + Spain
##
plot(CASESSUM$Group.1,CASESSUM$x,type="l", main="EU Gang of 5 + Spain: Total Daily Cases",
     xlab="Date Reported",ylab="Daily Cases")
grid()
#
plot(DEATHSSSUM$Group.1,DEATHSSSUM$x,type="l", main="EU Gang of 5 + Spain: Total Daily Deaths",
     xlab="Date Reported",ylab="Daily Cases")
grid()
##
## Comparing Spain's daily Cases and Deaths to Daily Mean
##
plot(CASESAVG$Group.1,CASESAVG$x,type="l", main="EU Gang of 5 + Spain: Mean Daily Cases",
     xlab="Date Reported",ylab="Daily Mean Cases",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Gang of Five","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()

plot(DEATHSAVG$Group.1,DEATHSAVG$x,type="l", main="EU Gang of 5 + Spain: Mean Daily Deaths",
     xlab="Date Reported",ylab="Daily Mean Deaths",col="blue")
lines(spain$dateRep,spain$cases,col="red")
legend("topleft",
       c("Gang of Five","Spain"),
       col=c("blue","red"),
       lty = c(1, 1),
       cex = 0.6)
grid()
