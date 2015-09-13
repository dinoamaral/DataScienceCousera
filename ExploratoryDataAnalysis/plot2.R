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

#Plotting the file plot2.png
png("plot2.png", width=480, height=480)

plot(household_sub$Global_active_power~household_sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
