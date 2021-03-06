---
Author: Sanjay Lonkar
Course 4 - Exploratory Data Analysis: Week 4 Course Project - README
Date: 20-May-2018
---

# Exploratory Data Analysis: Week 4 Course Project 

***
>https://github.com/celesto17/Getting-and-Cleaning-Data-Course-Project.git

***

### Project Files
As part of this project, following files are to be referred. These files  are available at above GITHUB URL:

1. README.MD - Overview of project and list of project files
2. plot1.R, plot2.R, ... plot6.R - R script files for answering six questions of the course project
3. plot1.png, plot2.png, ..., plot6.png - Plots generated by the above mentioned R scripts 

### Introduction:
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

### Data:
The data for this assignment are available from the course web site as a single zip file:

Data for Peer Assessment (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) [29Mb]
The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 

* fips: A five-digit number (represented as a string) indicating the U.S. county
* SCC: The name of the source as indicated by a digit string (see source code classification table)
* Pollutant: A string indicating the pollutant
* Emissions: Amount of PM2.5 emitted, in tons
* type: The type of source (point, non-point, on-road, or non-road)
* year: The year of emissions recorded

Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful.

### Assignment:
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#### Question 1: 
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#### Answer 1:
Total emissions from PM2.5 have decreased in the US from 1999 to 2008 by 3.868760910^{6} tons. Refer Plot1.png.

#### Question 2: 
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#### Answer 2: 
Total emissions from PM2.5 in Balitmore have decreased from 1999 to 2008 by 1411.8984892 tons. Refer Plot2.png.

#### Question 3: 
Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#### Answer 3: 
All source types appear to have decreased from 1999 to 2008 in Baltimore, with the exception of of the “point” type source. Refer Plot3.png.

#### Question 4: 
Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#### Answer 4: 
Total coal combustion emissions in the US have decreased by 2.286942810^{5} tons from 1999 to 2008. Refer Plot4.png.

#### Question 5: 
How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#### Answer 5: 
Emissions from motor vehicles in Baltimore have decreased by 258.5445426 tons from 1999 to 2008. Refer Plot5.png.

#### Question 6: 
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

#### Answer 6: 
The greatest magnitude of change in motor vehicle emissions occurred in Baltimore City which experienced a decrease of 258.5445426 tons, while Los Angeles experienced an increase of 163.43998 tons during the 1999-2008 period. Refer Plot6.png.
