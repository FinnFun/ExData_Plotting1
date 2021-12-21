## read data sets
raw <-  read.table("household_power_consumption.txt", sep = ';', header = TRUE)
library(dplyr)
tidy <- raw %>% mutate(Time = strptime(paste(Date,Time), format = '%d/%m/%Y %H:%M:%S'), Date = as.Date(Date,'%d/%m/%Y')) %>% filter(Date<=as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))

## plot and save
dev.copy(png, 'plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
## plot4-1
plot(tidy$Time,tidy$Global_active_power, 
     type = 'l',
     ylab = 'Global Active Power', 
     xlab = ''
)
## plot4-2
plot(tidy$Time,tidy$Voltage,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Voltage'
     )
## plot4-3
plot(tidy$Time,tidy$Sub_metering_1,
     type = 'l', 
     ylab = 'Energy sub metering', 
     xlab = '',
     col = 'gray')
lines(tidy$Time,tidy$Sub_metering_2, 
      type = 'l', 
      col = 'red')
lines(tidy$Time,tidy$Sub_metering_3, 
      type = 'l', 
      col = 'blue')
legend('topright',
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd = 1,
       col = c('gray', 'red', 'blue'))
## plot4-4
plot(tidy$Time,tidy$Global_reactive_power,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Global_reactive'
)
dev.off()
dev.off()