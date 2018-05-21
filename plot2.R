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

# TASK 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# TASK 2.1: Prepare data
emissions <- readRDS("./downloadedDataset/summarySCC_PM25.rds")
scc <- readRDS("./downloadedDataset/Source_Classification_Code.rds")

emissionsBaltimore <- emissions[emissions$fips == "24510", ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, emissionsBaltimore, sum)

# TASK 2.2: Draw plot
png('plot2.png')
barplot (height = aggregatedTotalByYear$Emissions, names.arg = aggregatedTotalByYear$year, col = "red", xlab="Year", ylab = expression('Total PM'[2.5]*' Emissions [Tons]'), main=expression('Total PM'[2.5]*' in the Baltimore City, MD Emissions by Years'))
dev.off()