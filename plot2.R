#Open png device
png('plot2.png', width = 480, height = 480)

#plot 2
plot(subData$DateTime, subData$Global_active_power,   ylab = "Global Active Power (Kilo Watts)", type = "l")

#save png and close device
dev.off()

