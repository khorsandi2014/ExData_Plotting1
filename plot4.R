#plot 4
data = read.csv("household_power_consumption.txt",header = TRUE,sep=';',
                na.strings = "?",nrows = 2075259, check.names = FALSE,
                stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data_12 = subset(data,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
dt = paste(as.Date(data_12$Date),data_12$Time)
data_12$dt <- as.POSIXct(dt)
par(mfrow = c(2,2), mar = c (4,4,2,1), oma = c(0,0,2,0))
with(data_12,{
  plot(Global_active_power ~ dt, type = "l",
       ylab = "global active power", xlab = "")
  plot(Voltage ~ dt, type = "l", ylab = "voltage", xlab = "date time")
  plot(Sub_metering_1 ~ dt, type = "l", ylab = "energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ dt, col = 'Red')
  lines(Sub_metering_3 ~dt, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ dt, type="l", ylab= "global reactive power", xlab = "date time")
})