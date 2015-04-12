#Open png device
png('plot4.png', width = 480, height = 480)

#plot 4
#Create 2 by 2 matrix for pics with margin 1
par(mfrow = c(2,2), mar=c(4,4,2,3), oma = c(0,0,2,0))
with (subData, {
  plot(DateTime, Global_active_power,   ylab = "Global Active Power", xlab = "", type = "l")
  plot(DateTime, Voltage,   ylab = "Voltage", xlab="datetime", type = "l")
  
  plot(DateTime, Sub_metering_1,  xlab = '', ylab = "Energy Sub metering", type = "l")
  lines(DateTime, Sub_metering_2, col = 'red')
  lines(DateTime, Sub_metering_3, col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty= 1, lwd = 3, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power,   ylab = "Voltage", xlab="datetime", type = "l")
  
})
#save png and close device
dev.off()
