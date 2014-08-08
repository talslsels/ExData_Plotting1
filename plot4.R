## calculate memory space 
## 2,075,259*9*8 bytes/numeric = 2,075,259*9*8/2^20 bytes/MB
Memory <- 2075259*9*8/2^20
print(Memory)

## read dataset, check variables names, classes, head and tail  

dataset <- read.table("C://Data Science/R Scripts/household_power_consumption.txt", header=TRUE, sep = ";")
names(dataset)
str(dataset)
head(dataset)
tail(dataset)


## subset data with dates only as 1/2/2007 and 2/2/2007
data <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"),]
dim(data)
levels(data$Global_active_power) ## found out there are values as "?"


x <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
par(mar=c(1,1,1,1))
## 1) top left plot
# convert factor class to numeric to make plot
y1 <- as.numeric(as.character(data$Global_active_power)) ## factor to numeric 
par(mar=c(4,4,3,2))
plot(x, y1, type = "l", ylab="Global Active Power")

## 2) top right plot
y2 <- as.numeric(as.character(data$Voltage))
plot(x, y2, type = "l", xlab= "datetime", ylab="Voltage")
par(mar=c(4,3,3,2))

## 3) down left plot
y3 <- as.numeric(as.character(data$Sub_metering_1)) ## factor to numeric 
y4 <- as.numeric(as.character(data$Sub_metering_2))
y5 <- as.numeric(as.character(data$Sub_metering_3))
par(mar=c(4,4,4,2))
plot(x, y3, type ="l", xlab = " ", ylab="Energy sub metering")
points(x,y4,col="red", type="l")
points(x,y5,col="blue", type ="l")

legend("topright", bty = "n", xjust= 1, legend=c("-- Sub_metering_1", "-- Sub_metering_2", "-- Sub_metering_3"), text.col=c("black", "red", "blue"))

## 4) down right plot 
y6 <- as.numeric(as.character(data$Global_reactive_power))
par(mar=c(4,4,4,2))
plot(x, y6, type = "l", xlab="datetime", ylab="Gloval_reactive_power")
dev.off()