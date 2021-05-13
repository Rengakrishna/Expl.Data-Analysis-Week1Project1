#Polt 2


setwd("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project")
library(readr)
household_power_consumption <- read_delim("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project/Data/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)

View(household_power_consumption)

PlotData <- household_power_consumption %>% mutate(ModDate=strptime(Date, format = "%d/%m/%Y")) 
plotdata1 <- subset(PlotData,ModDate >=as.Date("2007-02-01") & ModDate <= as.Date("2007-02-02"))
DateTime <- paste(as.Date(plotdata1$ModDate), plotdata1$Time)
plotdata1$DateTime <- as.POSIXct(DateTime)


png("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project/Plots_Codes/Plot2.png", width = 480, height = 480)
with(plotdata1, {
  plot(Global_active_power~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
