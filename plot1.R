# Set your working directory to access the data file "household_power_consumption.txt" 
setwd("C:/Users/Nacho/Desktop/Johns Hopkins Data Science/4. EXPLORATORY DATA ANALYSIS")
library(graphics)
library(grDevices)
# Load the data reading only values for 01/02/2007 and 02/02/2007
# Having a look at the file we can find where to start counting
# The process skips 66636 rows (all of the days before 01/02/2007) 
# Afterwards it reads 2880 rows that correspond to 01/02/2007 and 02/02/2007
household<-read.csv2("household_power_consumption.txt",header=TRUE,skip=66636,nrows=2880,col.names=c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3"))
# Create the variable to be plotted
GlobalActivePower<-as.numeric(as.character(household$GlobalActivePower))
# Plot the figure as described in the project 
png(filename="plot1.png",width=480,height=480,units="px",bg="transparent")
hist(GlobalActivePower,col="red",main=paste("Global Active Power"),xlab=paste("Global Active Power (kilowatts)"))
dev.off()
