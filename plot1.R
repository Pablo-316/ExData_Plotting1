setwd("C:/Users/pramirez/ExData_plotting1")

##Download and assign data to a variable
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl1,destfile="./data/household.zip")
unzip("./data/household.zip")
householdData <- "./household_power_consumption.txt"

##Getting Plotting Data
plotData <- read.table(householdData, header=T, sep=";", na.strings="?")

## Getting data only in the dates we want
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Getting plot1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
