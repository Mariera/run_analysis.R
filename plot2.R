##read the data set from consumtion data created in plot1.R

Consumption_data<-read.table(file.path(data_path, "household_power_consumption.txt"), 
                 header = FALSE, skip = 0, sep = ";", dec = ".",
                 na.strings = "?")

##eliminate the extra row
Consumption_data[-c(1),]


##rename the variables

colnames(Consumption_data)<- c("Date", "Time", "Global_active_power",
                               "global_reactive_power", "Voltage",
                               "Global_intensity", "Sub_metering_1",
                               "Sub_metering_2", "Sub_metering_3")


##subset the need rows

newconspm_data<- subset(Consumption_data, Consumption_data$Date=="1/2/2007"|
                          Consumption_data$Date=="2/2/2007")



##setting the dates form characters to objects

newconspm_data$Date<- as.Date(newconspm_data$Date, format = "%d/%m/%Y")
newconspm_data$Time<- strptime(newconspm_data$Time, format = "%H:%M:%S")

newconspm_data[1:1440,"Time"]<- format(newconspm_data[1:1440,"Time"],
                                       "2007-02-01 %H:%M:%S")
newconspm_data[1441:2880,"Time"]<- format(newconspm_data[1441:2880,"Time"],
                                          "2007-02-02 %H:%M:%S")


##calling the plot function
png("plot2.png")

plot(newconspm_data$Time,as.numeric(as.character(newconspm_data$Global_active_power)),
     type="l",xlab = "",ylab = "Global Active Power(kilowatts)" )

title(main = "Global Active Power Vs Time", )

##switch off the graphical device
dev.off()

