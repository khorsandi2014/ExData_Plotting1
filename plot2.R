#plot2
data = read.csv("household_power_consumption.txt",header = TRUE,sep=';',
                na.strings = "?",nrows = 2075259, check.names = FALSE,
                stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data_12 = subset(data,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
dt = paste(as.Date(data_12$Date),data_12$Time)
data_12$dt <- as.POSIXct(dt)

plot(data_12$Global_active_power~data_12$dt, type = "l",ylab="global active power(kw)",xlab="")