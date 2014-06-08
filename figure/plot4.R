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

par(mfrow=c(2,2))
par(mar=C(0.5,0.5,0.5,0.5))
x<-strptime(paste(day, time),"%d/%m/%Y %H:%M:%S")

#Plot1
y<-as.numeric(as.character((data$Global_active_power)))

plot(x,y,pch="",ylab="Global Active Power",xlab="")
lines(x,y)

#Plot2
v<-as.numeric(as.character((data$Voltage)))

plot(x,v,pch="",ylab="Voltage",xlab="datatime")
lines(x,v)


#Plot3
y1<-as.numeric(as.character((data$Sub_metering_1)))
y2<-as.numeric(as.character((data$Sub_metering_2)))
y3<-as.numeric(as.character((data$Sub_metering_3)))

plot(x,y1,pch="",ylab="Energy sub metering",xlab="")
lines(x,y1)
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend(cex=0.34,text.font = 2,"topright", legend=(c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")),lty=c(1,1),lwd=c(1.5,1.5),col=c("black","blue","red"))

#Plot4
r<-as.numeric(as.character((data$Global_reactive_power)))

plot(x,r,pch="",ylab="Global_reactive_power",xlab="datatime")
lines(x,r)

dev.copy(png, file = "plot4.png",  width=480,height=480, bg = "white")
dev.off()

