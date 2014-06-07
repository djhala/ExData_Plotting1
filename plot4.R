## read the source data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

## restric the number of rows. Read the entries for 1/2/2007 and 2/2/2007
final <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## conversion
final$dt <- strptime(paste(final$Date, final$Time), "%d/%m/%Y %H:%M:%S")
final$Sub_metering_1 <- as.numeric(final$Sub_metering_1)
final$Sub_metering_2 <- as.numeric(final$Sub_metering_2)
final$Sub_metering_3 <- as.numeric(final$Sub_metering_3)
final$Global_active_power <- as.numeric(final$Global_active_power)
final$Global_reactive_power <- as.numeric(final$Global_reactive_power)
final$Voltage <- as.numeric(final$Voltage)


## Create a png device
png(filename="plot4.png", height=480, width=480)

## 2x2 plot
par(mfcol=c(2, 2))

# Plot1 :Global Active Power
with(final, plot(dt, Global_active_power, type="l", xlab = "", ylab="Global Active Power"))

# Plot2 :Energy sub metering
with(final, {
  plot(dt, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dt, Sub_metering_2, type="l", col="red")
  lines(dt, Sub_metering_3, type="l", col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), box.lty=0)
box()

# Plot 3:Voltage
with(final, plot(dt, Voltage, type="l", xlab = "datetime"))

# Plot4 :Global Reactive Power
with(final, plot(dt, Global_reactive_power, type="l", xlab = "datetime"))

dev.off()