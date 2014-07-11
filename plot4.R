# load the data
data <- read.csv2("household_power_consumption.txt", 
                  stringsAsFactors=FALSE,
                  colClasses="character")

# Convert the dates to Date objects
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Focus on the dates of interest
data2 <- subset(data, (Date == as.Date("2007-02-01", format="%Y-%m-%d")) 
                | (Date == as.Date("2007-02-02", format="%Y-%m-%d")))

# Create the "datetime" vector
dts <- paste(data2$Date, data2$Time)
datetimes <- strptime(dts, "%Y-%m-%d %H:%M:%S")

# Coerce the "Global_active_power" data to numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

# Coerce the "Global_reactive_power" data to numeric
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)

# Coerce the "Voltage" data to numeric
data2$Voltage <- as.numeric(data2$Voltage)

par(mfrow = c(2,2))

# Now plot
with(data=data2,  {
    plot(datetimes, Global_active_power,
         type="l",
         xlab=NA,
         ylab="Global Active Power (kilowatts)")
    
    plot(datetimes, Voltage,
         type="l",
         ylab="Voltage")
    
    plot(datetimes, Sub_metering_1,
         type="l",
         xlab=NA,
         ylab="Energy sub metering")
    lines(datetimes, Sub_metering_2, col="red")
    lines(datetimes, Sub_metering_3, col="blue")
    legend("topright",
           bty="n",
           lty=1,
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"))
    
    plot(datetimes, Global_reactive_power,
         type="l")   
    })

