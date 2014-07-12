## Introduction
# This file uses data from UC Irvine Machine Learning Repository in particular it uses
# "Individual household electric power consumption Data Set".
# Overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.

# First download the dataset from UC Irvine ML Repo url.
# The dataset is quite big, it may take some time to download the entire dataset.
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url, dst = "household_power_consumption.zip")
# uncompress the downloaded dataset 
unzip("household_power_consumption.zip")

# read few rows to get classes
fewrows <- read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 5)
classes <- sapply(fewrows, class)

# read entire data with know classes
# reading may few mins
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", colClasses = classes)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# obtain the subset of entire dataset for specific dates
fromdate <- as.Date("2007-02-01")
todate <- as.Date("2007-02-02")
subdata <- subset(data, Date >= fromdate & Date <= todate)
dateTime <- strptime(paste(subdata$Date, sabdata$Time), format = "%Y-%m-%d %H:%M:%S")

# plot histogram of Global Active Power
png(file = "plot1.png")
hist(subdata$Global_active_power, xlab = "Global Active Power(killowatts)", col = "red", main = "Global Active Power")
dev.off()

