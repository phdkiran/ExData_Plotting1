#Open png device
png('plot3.png', width = 480, height = 480)

#plot 3
with (subData, {
  plot(DateTime, Sub_metering_1,   ylab = "Global Active Power (Kilo Watts)", type = "l")
  lines(DateTime, Sub_metering_2, col = 'red')
  lines(DateTime, Sub_metering_3, col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty= 1, lwd = 3, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
#save png and close device
dev.off()
