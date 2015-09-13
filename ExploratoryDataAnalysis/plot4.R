# Loading full dataset
household <- read.csv("household_power_consumption.txt", header=T,sep=';', na.strings="?",
                      stringsAsFactors=F)
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

#Subsetting the "Date" from 2007/02/01 to 2007/02/02 and convert "Global_active_power" to numeric
household_sub <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02" , ]
household_sub$Global_active_power <- as.numeric(household_sub$Global_active_power)

#Convert time
datetime <- paste(household_sub$Date, household_sub$Time)
household_sub$Datetime <- as.POSIXct(datetime)

#Plotting the file plot4.png

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

with(household_sub, {
  plot(household_sub$Global_active_power~household_sub$Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(household_sub$Voltage~household_sub$Datetime, type="l",
       ylab="Voltage(volts)", xlab="")
  
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(household_sub$Global_reactive_power~household_sub$Datetime, type="l", xlab="")
  
})

dev.off()
