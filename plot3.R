#plot 3
data = read.csv("household_power_consumption.txt",header = TRUE,sep=';',
                na.strings = "?",nrows = 2075259, check.names = FALSE,
                stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data_12 = subset(data,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
dt = paste(as.Date(data_12$Date),data_12$Time)
data_12$dt <- as.POSIXct(dt)
with(data_12,{ plot (Sub_metering_1 ~ dt, type = "l",
                     ylab = "energy sub metering", xlab = "")
               lines(Sub_metering_2 ~dt, col = 'Red')
               lines(Sub_metering_3 ~ dt , col = 'Blue') 
})
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))