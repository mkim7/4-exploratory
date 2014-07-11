###plot1.R
# Read data
electricdata <-read.csv("./household_power_consumption.txt", header=T, nrows=2075259, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="")

# Change date format
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

# Subset data
electric <- subset(electricdata, Date=="2007-02-01"|Date=="2007-02-02")

#Set background as white
par(bg="white")

#Plot 1
hist(electric$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", bg="white")

#Save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
