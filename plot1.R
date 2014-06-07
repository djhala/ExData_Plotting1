## read the source data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

## restric the number of rows
final <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## conversion
final$Global_active_power <- as.numeric(final$Global_active_power)

## Create a png device
png(filename="plot1.png", height=480, width=480)

## Plot a histogram
hist(final$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()