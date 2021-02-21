##read the data set downloaded in plot1.R

Consumption_data<-read.table(file.path(data_path, "household_power_consumption.txt"), 
                             header = FALSE, skip = 0, sep = ";", dec = ".", na.strings = "?")

##rename the variables
colnames(Consumption_data)<- c("Date", "Time", "Global_active_power",
                               "global_reactive_power", "Voltage",
                               "Global_intensity", "Sub_metering_1",
                               "Sub_metering_2", "Sub_metering_3")

##eliminate the extra row
Consumption_data[-c(1),]

##subset the required rows

newconspm_data<- subset(Consumption_data, Consumption_data$Date=="1/2/2007"|
                          Consumption_data$Date=="2/2/2007")

##setting the dates form characters to objects

newconspm_data$Date<- as.Date(newconspm_data$Date, format = "%d/%m/%Y")
newconspm_data$Time<- strptime(newconspm_data$Time, format = "%H:%M:%S")

newconspm_data[1:1440,"Time"]<- format(newconspm_data[1:1440,"Time"],
                                       "2007-02-01 %H:%M:%S")
newconspm_data[1441:2880,"Time"]<- format(newconspm_data[1441:2880,"Time"],
                                          "2007-02-02 %H:%M:%S")

##set the margins in the graphical device

png("plot4.png")

par(mfrow=c(2,2))

##create the appropriate plots

plot(newconspm_data$Time,as.numeric(as.character(newconspm_data$Global_active_power)),
     type="l",xlab = "",ylab = "Global Active Power")



plot(newconspm_data$Time,as.numeric(as.character(newconspm_data$Voltage)),
     type="l",xlab = "datetime",ylab = "Voltage" )

plot(newconspm_data$Time,newconspm_data$Sub_metering_1, type= "n"
     ,xlab =  "",ylab = "Energy sub metering")

with(newconspm_data,lines(Time,as.numeric(as.character(Sub_metering_1)),type = "l"))
with(newconspm_data,lines(Time,as.numeric(as.character(Sub_metering_2)),type = "l" ,col="red"))
with(newconspm_data,lines(Time, as.numeric(as.character(Sub_metering_3)),type = "l", col="blue"))
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metereing_1","Sub_metering_2","Sub_metering_3"))

title(main = "Energy sub-metering")

plot(newconspm_data$Time,as.numeric(as.character(newconspm_data$global_reactive_power)),
     type="l",xlab = "datetime",ylab = "Global_reactive_power" )

dev.off()






