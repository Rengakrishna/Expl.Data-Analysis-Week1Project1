library(readr)
household_power_consumption <- read_delim("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project/Data/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)

View(household_power_consumption)
dim(household_power_consumption)

PlotData <- household_power_consumption %>% mutate(ModDate=strptime(Date, format = "%d/%m/%Y")) 
plotdata1 <- subset(PlotData,ModDate >=as.Date("2007-02-01") & ModDate <= as.Date("2007-02-02"))
DateTime <- paste(as.Date(plotdata1$ModDate), plotdata1$Time)
plotdata1$DateTime <- as.POSIXct(DateTime)


#test <-PlotData[PlotData$ModDate >= "2007-02-01" & PlotData$ModDate <= "2007-02-02", ]

png("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_1/Project/Plots_Codes/Plot1.png", width = 480, height = 480)

hist(plotdata1$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (Kilowatts)",
     
     col="red",
     freq=TRUE
)
dev.off()