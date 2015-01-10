#plot1 Global Active Power
file_power <- file("household_power_consumption.txt")
names = c("Data","Time","Global_active_power", "Global_reactive_power", 
              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file_power),value = TRUE),col.names = names, 
                   sep = ";",header = TRUE)
hist(data$Global_active_power, col = "red", main =paste("Global Active Power1"),xlab="kilowatts")