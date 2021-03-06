preview <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, nrows = 50)
classes <- sapply(preview, class)
df <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, colClasses = classes)
dfcomplete <- df[complete.cases(df),]
dfcomplete$Time <- strptime(paste(dfcomplete$Date, dfcomplete$Time), "%e/%m/%Y %H:%M:%S")
dfcomplete$Date <- as.Date(dfcomplete$Date, "%e/%m/%Y")
starttime <- as.Date("01/02/2007", "%e/%m/%Y")
endtime <- as.Date("02/02/2007", "%e/%m/%Y")
d <- dfcomplete[(dfcomplete$Date >= starttime & dfcomplete$Date <= endtime), ]
plot(d$Time, d$Global_active_power, type='l', xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()