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

# TASK 2: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California 
# Which city has seen greater changes over time in motor vehicle emissions?
# TASK 2.1: Prepare data
emissions <- readRDS("./downloadedDataset/summarySCC_PM25.rds")
scc <- readRDS("./downloadedDataset/Source_Classification_Code.rds")

# fips = "24510" - Baltimore City, MD. fips = "06037"- Los Angeles, CA
subsetNEI <- emissions[(emissions$fips == "24510" | emissions$fips=="06037") & emissions$type == "ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate (Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips [aggregatedTotalByYearAndFips$fips == "24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips [aggregatedTotalByYearAndFips$fips == "06037"] <- "Los Angeles, CA"

# TASK 2.2: Draw plot
png('plot6.png', width=1040, height=480)
library(ggplot2)
g <- ggplot (aggregatedTotalByYearAndFips, aes (factor (year), Emissions))
g <- g + facet_grid (. ~ fips)
g <- g + geom_bar (stat="identity") + xlab ("Year") + ylab (expression('Total PM'[2.5]*" Emissions")) +  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037") from 1999 to 2008')
print(g)
dev.off()