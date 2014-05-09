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
sub_data$datetime = strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")
sub_data$Global_active_power = as.numeric(as.character(sub_data$Global_active_power))

#open png Graphic Device, make plot(s), close png Graphic Device
png("plot2.png")
with(sub_data, plot(datetime, Global_active_power,
                    type="l",
                    xlab="",
                    ylab="Global Active Power (kilowatts)")
     )
dev.off()

