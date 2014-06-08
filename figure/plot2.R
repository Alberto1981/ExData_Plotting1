URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(URL,"fichero.zip")
unzip("fichero.zip")

fichero<-"household_power_consumption.txt"

tabla<-read.table(fichero, sep=";",header=TRUE)

a<-tabla[as.Date(tabla$Date,format="%d/%m/%Y")==as.Date("01/02/2007",format="%d/%m/%Y") ,]
b<-tabla[as.Date(tabla$Date,format="%d/%m/%Y")==as.Date("02/02/2007",format="%d/%m/%Y") ,]

data<-rbind(a,b)

day<-data$Date
time<-data$Time
x<-strptime(paste(day, time),"%d/%m/%Y %H:%M:%S")

y<-as.numeric(as.character((data$Global_active_power)))

plot(x,y,pch="",ylab="Global Active Power (kilowatts)",xlab="")
lines(x,y)

dev.copy(png, file = "plot2.png",  width=480,height=480, bg = "white")
dev.off()
