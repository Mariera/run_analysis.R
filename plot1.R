##Loading Data into R
if(!file.exists("Ex.D")){
  dir.create("Ex.D")
}


dataUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataUrl, destfile = "./Ex.D/Consumption.zip", mode = 'wb')

##unzip the file

unzip(zipfile = "./Ex.D/Consumption.zip", exdir = "./Ex.D")

##create a path for the data

data_path<- file.path("C:/Users/MARIERA.MOCHOGE/Documents/Ex.D/Ex.D")

list.files(data_path)
as.Date()
##read the data from the lines 2007-02-01 & 2007-02-02

Consumption_data<-read.table(file.path(data_path, "household_power_consumption.txt"), 
           header = FALSE, skip = 0, sep = ";")




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

##call the dims function to determine if you've made the correct subset
dim(newconspm_data)
names(newconspm_data)



##create the plot
hist(as.numeric(as.character(newconspm_data$Global_active_power)),col="red",
     main="Global Active Power",
     xlab="Global Active power(kilowatts)")

##switch off the device

dev.off()



