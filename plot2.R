# load the data
data <- read.csv2("household_power_consumption.txt", 
                  stringsAsFactors=FALSE,
                  colClasses=c("Date"="character",
                               "Time"="character", 
                               "Global_active_power"="character", rep("NULL", 6)))

# Convert the dates to Date objects
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Coerce the "Global_active_power" data to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Focus on the dates of interest
data2 <- subset(data, (Date == as.Date("2007-02-01", format="%Y-%m-%d")) 
                | (Date == as.Date("2007-02-02", format="%Y-%m-%d")))

# Create the "datetime" vector
dts <- paste(data2$Date, data2$Time)
datetimes <- strptime(dts, "%Y-%m-%d %H:%M:%S")

# Now plot
png("plot2.png",width=480,height=480,units="px")
with(data=data2,  {
    plot(datetimes, Global_active_power,
         type="l",
         xlab=NA,
         ylab="Global Active Power (kilowatts)")
    })
dev.off()
