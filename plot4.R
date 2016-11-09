## read file in
dataF <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE, dec = ".")
## subset data by dates
subF <- subset(dataF, dataF$Date=="1/2/2007" | dataF=="2/2/2007")
## format date and time
date.time <- strptime(paste(subF$Date, subF$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
## open png device
png("plot4.png", width = 480, height = 480)
## set global parameter for plots to be built row wise
par(mfrow= c(2,2))
## add first plot
plot(date.time, as.numeric(subF$Global_active_power),type = "l", xlab = "",
     ylab = "Global Active Power", cex = 0.3)
## add second plot
plot(date.time, as.numeric(subF$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
## add third plot with 3 sub meters
plot(date.time, as.numeric(subF$Sub_metering_1), type = "l", xlab = "", 
     ylab = "Energy sub metering" )
lines(date.time, as.numeric(subF$Sub_metering_2), type = "l", col = "red" )
lines(date.time, as.numeric(subF$Sub_metering_3), type = "l", col = "blue")
## add legend to the third plot 
legend("topright", c("Sub meter 1", "Sub meter 2", "Sub meter 3"),
       lty = , lwd = 3, bty = "n", col = c("black", "red", "blue"))
## add fourth plot
plot(date.time, as.numeric(subF$Global_reactive_power), type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
## close png device
dev.off()