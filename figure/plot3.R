#plot3.R


#Lets read csv file from the text file first 
#First lets specify column classes
#you can also do whole import and then delete row by df = df[-1,] and upon deleting
#specify the headers by col.names= c("a",....)

d = read.table("household.txt", 
               sep=";", 
               #colClasses=c("Date","character",rep("double",7)),
               fill=FALSE, 
               strip.white=TRUE,
               na.strings="?",
               header=T)
d$Date<-as.Date(d$Date, format = "%d/%m/%Y") #will convert the date in date class
two.days<-subset(d,d$Date == "2007-02-02" | d$Date == "2007-02-01") #subsetting dates
weekDays <- strptime(paste(two.days$Date, two.days$Time), format='%Y-%m-%d %H:%M:%S')



with(two.days, {
  plot(weekDays, two.days$Sub_metering_1, type="l", xlab="", ylab="")
  lines(weekDays, two.days$Sub_metering_2, type="l", xlab="", ylab="", col="red")
  lines(weekDays, two.days$Sub_metering_3, type="l", xlab="", ylab="Energy Sub Metering", col="blue") 
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1),
         col=c("black", "red", "blue"))
})
dev.copy(png,file="plot3.png")
dev.off()
