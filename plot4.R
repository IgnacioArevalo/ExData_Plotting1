# Set your working directory to access the data file "household_power_consumption.txt" 
setwd("C:/Users/Nacho/Desktop/Johns Hopkins Data Science/4. EXPLORATORY DATA ANALYSIS")
library(graphics)
library(grDevices)
# Load the data reading only values for 01/02/2007 and 02/02/2007
# Having a look at the file we can find where to start counting
# The process skips 66636 rows (all of the days before 01/02/2007) 
# Afterwards it reads 2880 rows that correspond to 01/02/2007 and 02/02/2007
household<-read.csv2("household_power_consumption.txt",header=TRUE,skip=66636,nrows=2880,col.names=c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3"))
# Create the variables to be plotted
GlobalActivePower<-as.numeric(as.character(household$GlobalActivePower))
GlobalReactivePower<-as.numeric(as.character(household$GlobalReactivePower))
Voltage<-as.numeric(as.character(household$Voltage))
Submetering1<-as.numeric(as.character(household$Submetering1))
Submetering2<-as.numeric(as.character(household$Submetering2))
Submetering3<-as.numeric(as.character(household$Submetering3))
# Plot the figure as described in the project
png(filename="plot4.png",width=480,height=480,units="px",bg="transparent")
# Create the frame for 4 plots
par(mfrow=c(2,2))
# Plot 1
plot(c(1:2880),GlobalActivePower,type="l",xlab="",ylab="Global Active Power",xaxp=c(1,2880,2),xaxt="n")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
# Plot 2
plot(c(1:2880),Voltage,type="l",xlab="datetime",ylab="Voltage",xaxp=c(1,2880,2),xaxt="n")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
# Plot 3
plot(c(1:2880),Submetering1,type="l",xlab="",ylab="Energy sub metering",xaxp=c(1,2880,2),xaxt="n")
lines(c(1:2880),Submetering2,type="l",col="red")
lines(c(1:2880),Submetering3,type="l",col="blue")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1,1),col=c("black","red","blue"))
# Plot 4
plot(c(1:2880),GlobalReactivePower,type="l",lwd=0.01,xlab="datetime",ylab="Global Reactive Power",xaxp=c(1,2880,2),xaxt="n")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
