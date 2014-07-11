###plot2.R
# Read data
electricdata <-read.csv("./household_power_consumption.txt", header=T, nrows=2075259, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="")

# Change date format
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

# Subset data
electric <- subset(electricdata, Date=="2007-02-01"|Date=="2007-02-02")

# Convert date class
datetime <-paste(as.Date(electric$Date), electric$Time)
electric$Datetime <- as.POSIXct(datetime)


#Plot 2
plot(electric$Global_active_power~electric$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Save
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
