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



# make plot3 (Energy sub metering):

png(filename = ".\\plots\\plot3.png",
    width = 480, height = 480)

library(datasets)

plot(EPowerDataTime$DateTime, EPowerDataTime$Sub_metering_1, type="l", 
     xlab ="", ylab = "Energy sub metering", col = "black")

lines(EPowerDataTime$DateTime, EPowerDataTime$Sub_metering_2, type="l", 
     xlab ="", ylab = "Energy sub metering", col = "red")

lines(EPowerDataTime$DateTime, EPowerDataTime$Sub_metering_3, type="l", 
     xlab ="", ylab = "Energy sub metering", col = "blue")

legend("topright", col = c("black", "red", "blue"), lty=1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
