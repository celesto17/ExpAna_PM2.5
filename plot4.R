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

# TASK 2: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? 
# TASK 2.1: Prepare data
emissions <- readRDS("./downloadedDataset/summarySCC_PM25.rds")
scc <- readRDS("./downloadedDataset/Source_Classification_Code.rds")
emissionsSCC <- merge (emissions, scc, by="SCC")


coalMatches  <- grepl ("coal", emissionsSCC$Short.Name, ignore.case = TRUE)
subsetNEISCC <- emissionsSCC [coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

# TASK 2.2: Draw plot
png('plot4.png')
library(ggplot2)
g <- ggplot (aggregatedTotalByYear, aes (factor (year), Emissions))
g <- g + geom_bar (stat="identity") + xlab ("Year") + ylab (expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()