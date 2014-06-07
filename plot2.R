## read the source data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

## restric the number of rows
final <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## conversion
final$datetime <- strptime(paste(final$Date, final$Time), "%d/%m/%Y %H:%M:%S")
final$Global_active_power <- as.numeric(final$Global_active_power)

## Create a png device
png(filename="plot2.png", height=480, width=480)

## Line Plot

plot(final$datetime, final$Global_active_power, type = 'l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
