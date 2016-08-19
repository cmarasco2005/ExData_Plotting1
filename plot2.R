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

##Plot2
png(filename="plot2.png",width=480,height=480)
plot(SubData$Date_Time, SubData$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


