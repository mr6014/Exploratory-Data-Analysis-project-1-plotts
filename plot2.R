## read file in
dataF <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE, dec = ".")
## subset data by dates
subF <- subset(dataF, dataF$Date=="1/2/2007" | dataF=="2/2/2007")
## format date and time
date.time <- strptime(paste(subF$Date, subF$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
## open png device
png("plot2.png", width = 480, height = 480)
## build plot type "l" for lines
plot(date.time, as.numeric(as.character(subF$Global_active_power)),
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
## close png device
dev.off()