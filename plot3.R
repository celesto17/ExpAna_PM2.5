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

# TASK 2: Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999???2008 for Baltimore City? 
# Which have seen increases in emissions from 1999???2008? Use the ggplot2 plotting system to make a plot answer this question.
# TASK 2.1: Prepare data
emissions <- readRDS("./downloadedDataset/summarySCC_PM25.rds")
scc <- readRDS("./downloadedDataset/Source_Classification_Code.rds")

emissionsBaltimore <- emissions[emissions$fips == "24510", ]
aggregatedTotalByYearAndType <- aggregate (Emissions ~ year + type, emissionsBaltimore, sum)

# TASK 2.2: Draw plot
png('plot3.png')
library(ggplot2)
g <- ggplot (aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line(size = 1) + xlab ("Year") + ylab (expression('Total PM'[2.5]*" Emissions")) + ggtitle('Emissions Trend in Baltimore City (1999 - 2008)')
print(g)
dev.off()