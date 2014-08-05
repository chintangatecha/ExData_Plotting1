#plot1.R 

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

#Making Histogram using base plotting system
hist(two.days$Global_active_power,xlab="Global Active Power (killowatts)", col="red", main = "Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
