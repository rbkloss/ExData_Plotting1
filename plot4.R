plotname = "plot4.png"
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

with(timeSubset, {
  par(mpfrow = c(2,2))

  plot(
    datetime, timeSubset$Global_active_power, 
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
  )
  
  plot(
    datetime, timeSubset$Voltage , 
    type = "l",
    xlab = "",
    ylab = "Voltage"
  )
  
  plot(
    datetime, timeSubset$Sub_metering_1, 
    type = "l",
    xlab = "",
    ylab = "Energy sub metering",
    col = "black"
  )
  
  lines(
    datetime, timeSubset$Sub_metering_2, 
    col = "red"
  )
  
  lines(
    datetime, timeSubset$Sub_metering_3, 
    col = "blue"
  )
  
  legend("topright", pch='-',  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(
    datetime, timeSubset$Global_reactive_power, 
    type = "l",
    xlab = "",
    ylab = "Global_reactive_power"
  )

}
)
dev.off()
