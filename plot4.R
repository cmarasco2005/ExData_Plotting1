##read in file from the zipped download & interpret all "?" characters as NA
HHP<-read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.txt"),header=T,sep=";",na.strings="?")

##convert the Date column from 'factor' to 'character' class
HHP$Date<-as.character(HHP$Date)

##subset February 1st and 2nd 
SubData<-HHP[HHP$Date=="1/2/2007"| HHP$Date=="2/2/2007",]

##paste the date and time columns into a single new column called Date_Time
SubData$Date_Time = paste(SubData$Date,SubData$Time)

##convert the classes of the 'Date_Time' column to dates and times
SubData$Date_Time <-strptime(SubData$Date_Time,"%d/%m/%Y %H:%M:%S")

##Plot4
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(SubData$Date_Time, SubData$Global_active_power, type="l",ylab="Global Active Power",xlab="")

plot(SubData$Date_Time, SubData$Voltage, type="l",ylab="Voltage",xlab="datetime")

plot(SubData$Date_Time, SubData$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(SubData$Date_Time, SubData$Sub_metering_2, col="red")
lines(SubData$Date_Time, SubData$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

plot(SubData$Date_Time, SubData$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()