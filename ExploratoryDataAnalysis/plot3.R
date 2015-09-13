# Loading full dataset
household <- read.csv("household_power_consumption.txt", header=T,sep=';', na.strings="?",
                      stringsAsFactors=F)
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

#Subsetting the "Date" from 2007/02/01 to 2007/02/02
household_sub <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02" , ]

#Convert time
datetime <- paste(household_sub$Date, household_sub$Time)
household_sub$Datetime <- as.POSIXct(datetime)

#Plotting the file plot3.png
png("plot3.png", width=480, height=480)

with(household_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()