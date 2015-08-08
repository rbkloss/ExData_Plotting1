plotname = "plot2.png"
###Common Reading structure
p1Data = read.table(
  file = "household_power_consumption.txt", header = T,sep =';', na= '?'
)

timeSubset = subset(p1Data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = plotname, 
    width = 480, height = 480, 
    units = "px")
###################################
datetime = paste(timeSubset$Date, timeSubset$Time)
datetime = strptime(datetime, "%d/%m/%Y %H:%M:%S")

plot(
  datetime, timeSubset$Global_active_power, 
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
  )
dev.off()

?strptime
