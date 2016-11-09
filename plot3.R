## read file in
dataF <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE, dec = ".")
## subset data by dates
subF <- subset(dataF, dataF$Date=="1/2/2007" | dataF=="2/2/2007")
## format date and time
date.time <- strptime(paste(subF$Date, subF$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
## open png device
png("plot3.png", width = 480, height = 480)
## build plot with sub meter 1
plot(date.time, as.numeric(subF$Sub_metering_1), type = "l", xlab = "", 
     ylab = "Energy sub metering" )
## add submiter 2 to plot
lines(date.time, as.numeric(subF$Sub_metering_2), type = "l", col = "red" )
## add submeter 3 to the plot
lines(date.time, as.numeric(subF$Sub_metering_3), type = "l", col = "blue")
## add legend to the plot - top right corner
legend("topright", c("Sub meter 1", "Sub meter 2", "Sub meter 3"),
       lty = 1, lwd = 3, col = c("black", "red", "blue"))
## close png device
dev.off()