plot2 <- function() {

        library(data.table)
        library(dplyr)
        Sys.setlocale("LC_TIME", "English")
        
        df <- fread("household_power_consumption.txt", header=TRUE, sep=";")
        df$Date <- as.character(df$Date)
        df$Time <- as.character(df$Time)
        df <- mutate(df, datetime=as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))
        df <- filter(df, datetime>= "2007-02-01" & datetime<"2007-02-03")
  
        df$Global_active_power <- as.character(df$Global_active_power)
        df$Global_active_power <- as.numeric(df$Global_active_power)

        plot(Global_active_power ~ datetime, df, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
        dev.copy(png, file="plot2.png")
        dev.off()
}