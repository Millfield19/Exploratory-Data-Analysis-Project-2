#Millfield19
#06.05.2020
#creates the plot4.png
plot4 <- function () {
      png("plot4.png", height = 480, width = 480)
      
      NEI <- readRDS("data/summarySCC_PM25.rds")
      SCC <- readRDS("data/Source_Classification_Code.rds")
   
      combcoal <- grepl("Comb", SCC$EI.Sector) & grepl("Coal", SCC$EI.Sector)
      subSCC <- SCC[combcoal,]
      subNEI <- NEI[NEI$SCC %in% subSCC$SCC, ]

      
      sumNEI <- aggregate(Emissions ~ year, subNEI, sum)
      barplot(sumNEI$Emissions, main = "Emissions in the USA from coal combustion", 
           xlab = "year", ylab = "Emission in tons", 
           names.arg = sumNEI$year)
      
      dev.off()
}

