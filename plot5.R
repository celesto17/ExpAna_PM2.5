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

# TASK 2: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
# TASK 2.1: Prepare data
emissions <- readRDS("./downloadedDataset/summarySCC_PM25.rds")
scc <- readRDS("./downloadedDataset/Source_Classification_Code.rds")

subsetEmissions <- emissions [emissions$fips == "24510" & emissions$type == "ON-ROAD",  ]
aggregatedTotalByYear <- aggregate (Emissions ~ year, subsetEmissions, sum)

# TASK 2.2: Draw plot
png('plot5.png')
library(ggplot2)
g <- ggplot (aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar (stat="identity") + xlab ("Year") + ylab (expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from Motor Vehicle in Baltimore from 1999 to 2008')
print(g)
dev.off()