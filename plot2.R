## read data sets
raw <-  read.table("household_power_consumption.txt", sep = ';', header = TRUE)
library(dplyr)
tidy <- raw %>% mutate(Time = strptime(paste(Date,Time), format = '%d/%m/%Y %H:%M:%S'), Date = as.Date(Date,'%d/%m/%Y')) %>% filter(Date<=as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))

## plot and save
dev.copy(png, 'plot2.png', width = 480, height = 480)
plot(tidy$Time,tidy$Global_active_power, 
     type = 'l',
     ylab = 'Global Active Power(killowatts)', 
     xlab = ''
)
dev.off()