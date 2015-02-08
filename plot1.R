## This code is for the first plot of the first project in the Exploratory Data Analysis


## Load the data.table library
## download the file from the coursera website, unzip and save the text file in your working directory

# Read the data into the variable powerdata

powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";")

# The following steps should be done to clean the powerdata 
# Data and time variables are characters so they need to be changed.  
class(powerdata$Date)
class(powerdata$Time)


# Change the format of Date variable
powerdataDate <- as.Date(powerdata$Date, format="%d/%m/%Y")
class(powerdataDate)

# Subset the data for the two dates of interest on both areas.  
data_subset <- powerdata[powerdataDate=="2007-02-01" | powerdataDate=="2007-02-02",]

# Convert data subset to a data frame for ease of use.
class(data_subset)
data_subsets <- data.frame(data_subset)

# Columns need to be converted to a numeric
for(i in c(3:9)) {data_subsets[,i] <- as.numeric(as.character(data_subsets[,i]))}

# Create Date_Time variable for the graph called data subsets.  
data_subsets$Date_Time <- paste(data_subsets$Date, data_subsets$Time)

# Convert Date_Time variable to proper format of Y, M, D, H, M, S.
data_subsets$Date_Time <- strptime(data_subsets$Date_Time, format="%Y-%m-%d %H:%M:%S")
class(data_subsets$Date_Time)

# Create the first Plot for the assignment.  The plot should have columns that are red with at title of Global Active Power
# and kilowats along the X axis.  

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

hist(data_subsets$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
