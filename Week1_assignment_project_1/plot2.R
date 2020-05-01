library(data.table)
library(dplyr)
library(lubridate)
data<-fread("household_power_consumption.txt",na.strings="?")
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png",width=480,height=480)
plot(x = data[, dateTime]
     , y = data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()