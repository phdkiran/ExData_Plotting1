#Read full data set with na charatcters as '?'
data <-  read.csv("./household_power_consumption.txt", header = T, sep = ';', na.strings = "?", stringsAsFactors = F, comment.char = "", quote = '\"')
#build subset to match dates 1/2/2007 and 2/2/2007
subData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
#Delete original data set
rm(data)
#combine subData dates to readable format 
subData$DateTime <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")

#Open png device
png('plot1.png', width = 480, height = 480)

#plot 1
hist(subData$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (Kilo Watts)")

#save png and close device
dev.off()
