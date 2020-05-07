#Millfield19
#06.05.2020
#creates the plot2.png
plot2 <- function () {
      png("plot2.png", height = 480, width = 480)
      
      NEI <- readRDS("data/summarySCC_PM25.rds")
      SCC <- readRDS("data/Source_Classification_Code.rds")
      
      subNEI <- subset(NEI, fips=="24510")
      
      
      sumNEI <- aggregate(Emissions ~ year, subNEI, sum)
      barplot(sumNEI$Emissions, main = "Emissions in Baltimore per year", 
              xlab = "year", ylab = "Emission in tons", 
              names.arg = sumNEI$year)
      
      dev.off()
}