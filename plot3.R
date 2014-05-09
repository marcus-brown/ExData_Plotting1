#download and unzip file if it does not exist (created on windows machine)
if (!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip",
                  "household_power_consumption.zip")
    unzip("household_power_consumption.zip")
}

#read data (Electric power consumption data must be in working directory)
data <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")

#subset out desired dates
sub_data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#format data
sub_data$date_time = strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")

#open png Graphic Device, make plot(s), close png Graphic Device
png("plot3.png")
with(sub_data, plot(date_time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(sub_data, points(date_time, Sub_metering_1, type="l"))
with(sub_data, points(date_time, Sub_metering_2, type="l", col="red"))
with(sub_data, points(date_time, Sub_metering_3, type="l", col="blue"))
legend("topright",
       col=c("black", "red", "blue"),
       lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_merering_3"))
dev.off()

