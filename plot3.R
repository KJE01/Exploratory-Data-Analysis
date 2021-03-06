plot3 <- function() {
        
        library(data.table)
        library(dplyr)
        Sys.setlocale("LC_TIME", "English")
        
        df <- fread("household_power_consumption.txt", header=TRUE, sep=";")
        df$Date <- as.character(df$Date)
        df$Time <- as.character(df$Time)
        df <- mutate(df, datetime=as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))
        df <- filter(df, datetime>= "2007-02-01" & datetime<"2007-02-03")
  
        df$Sub_metering_1 <- as.character(df$Sub_metering_1)
        df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
        df$Sub_metering_2 <- as.character(df$Sub_metering_2)
        df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
        df$Sub_metering_3 <- as.character(df$Sub_metering_3)
        df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
  
        plot(Sub_metering_1 ~ datetime, df, type="l", xlab="", ylab="Energy sub metering")
        lines(df$datetime, df$Sub_metering_2, col="red")
        lines(df$datetime, df$Sub_metering_3, col="blue")
        legend("topright", pch=NA, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, lty=1)
  
        dev.copy(png, file="plot3.png")
        dev.off()
}