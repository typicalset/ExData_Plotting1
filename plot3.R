# load the data
data <- read.csv2("household_power_consumption.txt", 
                  stringsAsFactors=FALSE,
                  colClasses=c("Date"="character",
                               "Time"="character", 
                               rep("NULL",4),
                               "Sub_metering_1"="character",
                               "Sub_metering_2"="character",
                               "Sub_metering_3"="character"))

# Convert the dates to Date objects
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Focus on the dates of interest
data2 <- subset(data, (Date == as.Date("2007-02-01", format="%Y-%m-%d")) 
                | (Date == as.Date("2007-02-02", format="%Y-%m-%d")))

# Create the "datetime" vector
dts <- paste(data2$Date, data2$Time)
datetimes <- strptime(dts, "%Y-%m-%d %H:%M:%S")

# Now plot
with(data=data2,  {
    plot(datetimes, Sub_metering_1,
         type="l",
         xlab=NA,
         ylab="Energy sub metering")
    lines(datetimes, Sub_metering_2, col="red")
    lines(datetimes, Sub_metering_3, col="blue")
    legend("topright",
           lty=1,
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"))
    })

