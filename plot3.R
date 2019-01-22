############### Exploratory Data Analysis Course ###########
############### Week 1 Peer Graded Assignment ##############

# Housekeeping - clears memory and sets working directory

rm(list=ls())

setwd("/Users/Glenn/RCode/Exploratory Data Analysis")

# Data was downloaded.  This reads data into a dataset

elecdata <- read.table("./DataWeek1/household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",
                       colClasses = c(Global_active_power = "numeric"))

# Selects only the rows for Feb 1, 2007 and Feb 2, 2007 

elecdata2 <- subset(elecdata, elecdata$Date == "1/2/2007"| elecdata$Date == "2/2/2007")

## Sets Date as Date format and Creates DateTime variable
elecdata2$Date <- as.Date(elecdata2$Date, "%d/%m/%Y")
elecdata2$DateTime <- as.POSIXct(paste(elecdata2$Date,elecdata2$Time))

# Plot # 3
quartz()
png(file="plot3.png", width=480, height = 480)

with(elecdata2, (plot(DateTime, Sub_metering_1, col="black",
                    type ="l",
                     ylab="Energy sub metering", 
                     xlab = "Date", 
                     main="Global Active Power"
                     )))
with(elecdata2,lines(DateTime, Sub_metering_2, col="red", type="l"))
with(elecdata2,lines(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty= 1:1)

dev.off()