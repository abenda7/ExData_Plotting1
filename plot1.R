
epc <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,
                  header=TRUE, sep=";",na.strings="?")
epcf <- epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]
rm(epc)
epcf$Date <- as.Date( epcf$Date,format="%d/%m/%Y")
hist(epcf$Global_active_power,col="red"
     ,xlab= "Global Active Power (kilowatts)"
     ,main=" Global Active Power"
     ,breaks=12, xlim=c(0,6), ylim=c(0,1200)
)
dev.copy(png,file="plot1.png")
dev.off()
