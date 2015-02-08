# read csv file
electData <- read.csv('household_power_consumption.txt', sep=';', 
                      nrows=100000, na.strings='?',
                      colClasses=c(rep('character', 2), rep('numeric',7)))
electData$Date <- as.Date(electData$Date, '%d/%m/%Y')

# keep only 02/01/2007 and 02/02/2007 data
electData <- subset(electData, electData$Date %in% as.Date(c('2007-02-01','2007-02-02')) )

# plot data
par(mfrow=c(2,2))

with(electData, plot(Global_active_power, type='n', xaxt='n', ann=F))
title(ylab='Global Active Power')
with(electData, lines(Global_active_power))
axis(1, at=c(0, 1440, 2880), labels=c('Thu','Fri','Sat'))

with(electData, plot(Voltage, type='n', xaxt='n', ann=F))
title(xlab='datetime', ylab='Voltage')
with(electData, lines(Voltage))
axis(1, at=c(0, 1440, 2880), labels=c('Thu','Fri','Sat'))

with(electData, plot(Sub_metering_1, type='n', xaxt='n', ann=F))
title(ylab='Energy sub metering')
with(electData, {
                lines(Sub_metering_1, col='black')
                lines(Sub_metering_2, col='red')
                lines(Sub_metering_3, col='blue')
        }
     )
axis(1, at=c(0, 1440, 2880), labels=c('Thu','Fri','Sat'))
legend(x=1500,y=35, col=c('black','red','blue'), cex=0.75, y.intersp=0.25, x.intersp=0.25,
       xjust=1, legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1)

with(electData, plot(Global_reactive_power, type='n', xaxt='n', ann=F))
with(electData, lines(Global_reactive_power))
axis(1, at=c(0, 1440, 2880), labels=c('Thu','Fri','Sat'))
title(xlab='datetime', ylab='Global_reactive_power')

# save to png file
#dev.copy(png, 'plot4.png')
#dev.off()

