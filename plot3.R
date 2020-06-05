## Plot 3 ##

hpc <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3")

## Subset Dates ##
new.hpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

## New Format for Date and Time ##
new.hpc$Date <- as.Date(new.hpc$Date, format = "%d/%m/%Y")
new.hpc$Time <- strptime(new.hpc$Time, format = "%H:%M:%S")
new.hpc[1:1440,"Time"] <- format(new.hpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
new.hpc[1441:2880,"Time"] <- format(new.hpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Plot the Data ##
plot(new.hpc$Time, new.hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(new.hpc,lines(as.numeric(as.character(Sub_metering_1))))
with(new.hpc,lines(as.numeric(as.character(Sub_metering_2)), col = "red"))
with(new.hpc,lines(as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Title ##
title(main = "Energy sub-metering")