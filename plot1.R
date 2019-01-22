############### Exploratory Data Analysis Course #######
######### Week 1 Peer Graded Assignment ##############
########## Read in Data on Power Usage and replicate four specific graphs

rm(list=ls())

setwd("/Users/Glenn/RCode/Exploratory Data Analysis")

# Data was downloaded.  This reads data into a dataset

elecdata <- read.table("./DataWeek1/household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",
                       colClasses = c(Global_active_power = "numeric"))

# Selects only the rows for Feb 1, 2007 and Feb 2, 2007 

elecdata2 <- subset(elecdata, elecdata$Date == "1/2/2007"| elecdata$Date == "2/2/2007")

# Plot # 1
quartz()

png(file="plot1.png", width=480, height = 480)

with(elecdata2, (hist(Global_active_power, col="red",
                     xlab="Global Active Power (kilowatts)", 
                     ylab = "Frequency", 
                     main="Global Active Power"
                     )))
dev.off()