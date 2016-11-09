## read file in
dataF <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE, dec = ".")
## subset data by dates
subF <- subset(dataF, dataF$Date=="1/2/2007" | dataF=="2/2/2007")
## open png devise
png("plot1.png", width = 480, height = 480)
## build plot
hist(as.numeric(as.character(subF$Global_active_power)),col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## close png devise
dev.off()

