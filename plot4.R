###plot4.R
# Read data
electricdata <-read.csv("./household_power_consumption.txt", header=T, nrows=2075259, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="")

# Change date format
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

# Subset data
electric <- subset(electricdata, Date=="2007-02-01"|Date=="2007-02-02")

# Convert date class
datetime <-paste(as.Date(electric$Date), electric$Time)
electric$Datetime <- as.POSIXct(datetime)

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(electric, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global_reactive_power", xlab="datetime")
})

#Save
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
