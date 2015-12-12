plot1 <- function() {
  
        library(data.table)
        library(dplyr)

        df <- fread("household_power_consumption.txt", header=TRUE, sep=";")
        df$Date <- as.Date(df$Date,format = "%d/%m/%Y")
        df <- filter(df, Date>= "2007-02-01" & Date<="2007-02-02")

        df$Global_active_power <- as.character(df$Global_active_power)
        df$Global_active_power <- as.numeric(df$Global_active_power)
    
        hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    
        dev.copy(png, file="plot1.png")
        dev.off()
}