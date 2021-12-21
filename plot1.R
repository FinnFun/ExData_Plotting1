## read data sets
raw <-  read.table("household_power_consumption.txt", sep = ';', header = TRUE)
library(dplyr)
tidy <- raw %>% mutate(Time = strptime(paste(Date,Time), format = '%d/%m/%Y %H:%M:%S'),Date = as.Date(Date,'%d/%m/%Y')) %>% filter(Date<=as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))

## plot and save
dev.copy(png, 'plot1.png', width = 480, height = 480)
hist(as.numeric(tidy$Global_active_power), 
     xlab = 'Global Active Power(killowatts)', 
     ylab = 'Frenquency', col = 'red', 
     main = 'Global Active Power', 
     ylim = c(0,1200)
     )
dev.off()