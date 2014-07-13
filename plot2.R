# set working directory:

setwd("C:\\Users\\Ana\\Documents\\Online_Courses\\_Specialization_Data_Science\\4_Exploratory_Data_Analysis_July_2104")



# read and format data:

install.packages("data.table")
library("data.table")

colNames <- colnames(fread(".\\orig\\exdata-data-household_power_consumption\\household_power_consumption.txt", sep=";", nrows=1))

EPowerData <- fread(".\\orig\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, nrows=2879, skip=66636)

colnames(EPowerData) <- colNames

is.na(EPowerData) <- EPowerData=="?"



# create POSIXlt DateTime variable

DateTime <- strptime(paste(EPowerData$Date, EPowerData$Time), "%d/%m/%Y %H:%M:%S")

EPowerDataTime <- cbind(as.data.frame(EPowerData), DateTime)



# make plot2 (Global Active Power over Time):

EPowerDataTime$Global_active_power <- as.numeric(EPowerDataTime$Global_active_power)

png(filename = ".\\plots\\plot2.png",
    width = 480, height = 480)

library(datasets)

plot(EPowerDataTime$DateTime, EPowerDataTime$Global_active_power, type="l", 
     xlab ="", ylab = "Global Active Power (kilowatts)")

dev.off()
