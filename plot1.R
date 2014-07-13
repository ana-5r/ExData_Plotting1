# set working directory:

setwd("C:\\Users\\Ana\\Documents\\Online_Courses\\_Specialization_Data_Science\\4_Exploratory_Data_Analysis_July_2104")



# read and format data:

install.packages("data.table")
library("data.table")

colNames <- colnames(fread(".\\orig\\exdata-data-household_power_consumption\\household_power_consumption.txt", sep=";", nrows=1))

EPowerData <- fread(".\\orig\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, nrows=2879, skip=66636)

colnames(EPowerData) <- colNames

is.na(EPowerData) <- EPowerData=="?"



# make plot1 (Frequency of the Global Active Power):

EPowerData$Global_active_power <- as.numeric(EPowerData$Global_active_power)

png(filename = ".\\plots\\plot1.png",
    width = 480, height = 480)

library(datasets)

hist(EPowerData$Global_active_power, 
              main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              col = "red")

dev.off()
