#quick read to see what the file looks like
data <- read.table(file = "household_power_consumption.txt", nrow = 10, head=TRUE)

#load sql package
library("sqldf")
require("sqldf")

#sql statement to get desired rows
SQL <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file <- "household_power_consumption.txt"
data <- read.csv.sql(file, sql = SQL, sep=";")
data2 <- read.csv.sql(file, sql = SQL, sep=";")

#########################################plot 3#############################################
png("plot3.png", width=480, height=480)
plot(data2$Days, data2$Sub_metering_1, type="l", col="black", ylab="Energy sub mettering", xlab="")
lines(data2$Days, data2$Sub_metering_2, type="l", col="red")
lines(data2$Days, data2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()