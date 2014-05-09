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
sub_data$Global_active_power = as.numeric(sub_data$Global_active_power)

#open png Graphic Device, make plot(s), close png Graphic Device
png("plot1.png")
hist(sub_data$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()