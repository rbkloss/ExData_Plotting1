p1Data = read.table(
  file = "household_power_consumption.txt", header = T,sep =';', na= '?'
  )

timeSubset = subset(p1Data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px")

hist(
  timeSubset$Global_active_power, 
  col = "red", 
  main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)",
  breaks = 12, ylim = c(0, 1200)
  )
dev.off()
