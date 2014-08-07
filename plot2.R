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

# convert factor class to numeric to make plot
y <- as.numeric(as.character(data$Global_active_power)) ## factor to numeric 
par(mar=c(3,4,3,2))
plot(x, y, type = "l", xlab = NULL, ylab="Global Active Power (killowatts)")




