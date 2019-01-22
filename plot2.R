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

# Plot # 2
quartz()
png(file="plot2.png", width=480, height = 480)

with(elecdata2, (plot(DateTime, Global_active_power, col="black",
                    type ="l",
                     ylab="Global Active Power (kilowatts)", 
                     xlab = "Date", 
                     main="Global Active Power"
                     )))
dev.off()