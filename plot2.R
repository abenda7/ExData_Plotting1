
epc <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,
                  header=TRUE, sep=";",na.strings="?")
epcf <- epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]
rm(epc)
dt <- paste(epcf$Date, epcf$Time)
strptime(dt, "%d/%m/%Y %H:%M:%S")
epcf$Date <- strptime(dt, "%d/%m/%Y %H:%M:%S")

##libary(lubridate)
plot(epcf$Date,epcf$Global_active_power,type="l" 
     ,ylab= "Global Active Power (kilowatts)",xlab = ""
)
dev.copy(png,file="plot2.png")
dev.off()
