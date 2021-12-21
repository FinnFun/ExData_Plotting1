## read data sets
raw <-  read.table("household_power_consumption.txt", sep = ';', header = TRUE)
library(dplyr)
tidy <- raw %>% mutate(Time = strptime(paste(Date,Time), format = '%d/%m/%Y %H:%M:%S'), Date = as.Date(Date,'%d/%m/%Y')) %>% filter(Date<=as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))

## plot and save
dev.copy(png, 'plot3.png', width = 480, height = 480)
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
dev.off()
