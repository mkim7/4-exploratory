###plot3.R
# Read data
electricdata <-read.csv("./household_power_consumption.txt", header=T, nrows=2075259, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="")

# Change date format
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

# Subset data
electric <- subset(electricdata, Date=="2007-02-01"|Date=="2007-02-02")

# Convert date class
datetime <-paste(as.Date(electric$Date), electric$Time)
electric$Datetime <- as.POSIXct(datetime)

#Plot 3
with(electric, {
plot(Sub_metering_1~Datetime, type="l",
ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime, col="Red")
lines(Sub_metering_3~Datetime, col="Blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
