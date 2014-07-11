# load the data
data <- read.csv2("household_power_consumption.txt", 
                  stringsAsFactors=FALSE,
                  colClasses=c("Date"="character",
                               "Time"="NULL", 
                               "Global_active_power"="character", rep("NULL", 6)))

# Convert the dates to Date objects
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Coerce the "Global_active_power" data to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Focus on the dates of interest
data2 <- subset(data, (Date == as.Date("2007-02-01", format="%Y-%m-%d")) 
                | (Date == as.Date("2007-02-02", format="%Y-%m-%d")))


# Now plot
hist(data2$Global_active_power, 
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")