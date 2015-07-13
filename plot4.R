
epc <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,
                  header=TRUE, sep=";",na.strings="?")
epcf <- epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]
rm(epc)
dt <- paste(epcf$Date, epcf$Time)
strptime(dt, "%d/%m/%Y %H:%M:%S")
epcf$Date <- strptime(dt, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
with(epcf, {
   plot(epcf$Date,epcf$Global_active_power,type="l" 
       ,ylab= "Global Active Power (kilowatts)",xlab = ""
   )
   plot(epcf$Date,epcf$Voltage,type="l" 
        ,ylab= "Voltage",xlab = "datetime"
   )

   plot(epcf$Date,epcf$Sub_metering_1,type="l" 
     ,ylab= "Energy sub metering",xlab = "")
   points(epcf$Date,epcf$Sub_metering_2,type="l", col="red")  
   points(epcf$Date,epcf$Sub_metering_3,type="l", col="blue") 
   legend("topright", pch = "___", col =c("black","red","blue")
      ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
   

   plot(epcf$Date,epcf$Global_reactive_power,type="l" 
        ,xlab = "datetime"
        ##,ylab= "Global Active Power (kilowatts)"
   )
   
} )

   
dev.copy(png,file="plot4.png")
dev.off()
