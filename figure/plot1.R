URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(URL,"fichero.zip")
unzip("fichero.zip")
              
fichero<-"household_power_consumption.txt"
              
tabla<-read.table(fichero, sep=";",header=TRUE)
              
a<-tabla[as.Date(tabla$Date,format="%d/%m/%Y")==as.Date("01/02/2007",format="%d/%m/%Y") ,]
b<-tabla[as.Date(tabla$Date,format="%d/%m/%Y")==as.Date("02/02/2007",format="%d/%m/%Y") ,]
              
data<-rbind(a,b)
              
hist(as.numeric(as.character((data$Global_active_power))),main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png",  width=480,height=480, bg = "white")
dev.off()