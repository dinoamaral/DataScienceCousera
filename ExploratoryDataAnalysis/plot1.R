# Loading full dataset
household <- read.csv("household_power_consumption.txt", header=T,sep=';', na.strings="?",
                      stringsAsFactors=F)
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

#Subsetting the "Date" from 2007/02/01 to 2007/020/02 and convert "Global_active_power" to numeric
household_sub <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02" , ]
household_sub$Global_active_power <- as.numeric(household_sub$Global_active_power)

#Convert Date 
datetime <- paste(as.Date(household_sub$Date), household_sub$Date)
household_sub$Datetime <- as.POSIXct(datetime)

#Plotting the file plot1.png
png(filename="plot1.png", width=480, height=480, unit = "px")

hist(household_sub$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" , breaks = 12, ylim=c(0,1200))

dev.off()
