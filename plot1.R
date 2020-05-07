#Millfield19
#06.05.2020
#creates the plot1.png
plot1 <- function () {
      png("plot1.png", height = 480, width = 480)
      
      NEI <- readRDS("data/summarySCC_PM25.rds")
      SCC <- readRDS("data/Source_Classification_Code.rds")
      
      sumNEI <- aggregate(Emissions ~ year, NEI, sum)
      barplot(sumNEI$Emissions, main = "Emissions per year", 
              xlab = "year", ylab = "Emission in tons", 
              names.arg = sumNEI$year)
      
      dev.off()
}