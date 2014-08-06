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

############################################plot 1###########################################
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowats)", 
     main = "Global Active Power")
dev.off()