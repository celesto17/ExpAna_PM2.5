# Course 5 - Exploratory Data Analysis: Week 4 Course Project
# Author: Sanjay Lonkar
# Date: 20-May-2018

# TASK 1: Download dataset
if (!file.exists("./downloadedDataset"))
{
  dir.create("./downloadedDataset")
}
if (!file.exists ("./downloadedDataset/exdata%2Fdata%2FNEI_data.zip")) # This step is to avoid downloading data every time one runs this script
{
  datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file (datasetURL, destfile="./downloadedDataset/downloadedDataset.zip")
  unzip (zipfile = "./downloadedDataset/downloadedDataset.zip", exdir="./downloadedDataset")
}

# TASK 2: Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
# TASK 2.1: Prepare data
emissions <- readRDS("./downloadedDataset/summarySCC_PM25.rds")
scc <- readRDS("./downloadedDataset/Source_Classification_Code.rds")
totalByYear <- aggregate(Emissions ~ year, emissions, sum)

# TASK 2.2: Draw plot
png('plot1.png')
barplot (height = totalByYear$Emissions, names.arg = totalByYear$year, col = "red", xlab = "Year", ylab = expression ('Total PM'[2.5]*' Emissions [Tons]'), main = expression ('Total PM'[2.5]*' Emissions in US by Years'))
dev.off()