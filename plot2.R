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

###########################################plot 2############################################

#combine Date & Time cols to one col that is in POSIX format
data2$Days <- strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

#make plot (type l for lines)
png("plot2.png", width=480, height=480)
plot(data2$Days, data2$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowats)")
dev.off()
dev.copy(png, file = "plot2.png")