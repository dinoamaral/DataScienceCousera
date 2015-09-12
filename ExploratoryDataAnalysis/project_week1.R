household <- read.csv("household_power_consumption.txt", header=TRUE,sep=";")
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

household_sub <- household[ household$Date >= "2007-02-01" & household$Date <= "2007-02-02" , ]
household_sub$Global_active_power <- as.numeric(household_sub$Global_active_power)

datetime <- paste(as.Date(household_sub$Date), household_sub$Date)
household_sub$Datetime <- as.POSIXct(datetime)

png(filename="plot1.png", width=480, height=480, bg = "transparent")

hist(household_sub$Global_active_power/1000, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" , breaks = 12, ylim=c(0,1200))

dev.off()
