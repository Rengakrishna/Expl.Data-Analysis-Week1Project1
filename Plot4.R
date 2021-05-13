
#Plot 4
setwd("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project")
library(readr)
household_power_consumption <- read_delim("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project/Data/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)

View(household_power_consumption)

PlotData <- household_power_consumption %>% mutate(ModDate=strptime(Date, format = "%d/%m/%Y")) 
plotdata1 <- subset(PlotData,ModDate >=as.Date("2007-02-01") & ModDate <= as.Date("2007-02-02"))
DateTime <- paste(as.Date(plotdata1$ModDate), plotdata1$Time)
plotdata1$DateTime <- as.POSIXct(DateTime)


png("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project/Plots_Codes/Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plotdata1, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", inset=0.01,col=c("black", "red", "blue"), lty=1, lwd=2,cex=0.5, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})
dev.off()
