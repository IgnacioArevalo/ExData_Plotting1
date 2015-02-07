setwd("C:/Users/Nacho/Desktop/Johns Hopkins Data Science/4. EXPLORATORY DATA ANALYSIS")
library(graphics)
library(grDevices)
household<-read.csv2("household_power_consumption.txt",header=TRUE,skip=66636,nrows=2880,col.names=c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3")
GlobalActivePower<-as.numeric(as.character(household$GlobalActivePower))
png(filename="plot1.png",width=480,height=480,units="px",bg="transparent")
hist(GlobalActivePower,col="red",main=paste("Global Active Power"),xlab=paste("Global Active Power (kilowatts)"))
dev.off()