#Millfield19
#06.05.2020
#creates the plot5.png
plot5 <- function () {
      png("plot5.png", height = 480, width = 480)
      
      NEI <- readRDS("data/summarySCC_PM25.rds")
      SCC <- readRDS("data/Source_Classification_Code.rds")
      
      
      vehicle <- grepl("Vehicles", SCC$SCC.Level.Two)
      subSCC <- SCC[vehicle,]
      subNEI <- NEI[NEI$SCC %in% subSCC$SCC, ]
      subNEI <- subset(subNEI, fips=="24510")
   
   
      sumNEI <- aggregate(Emissions ~ year, subNEI, sum)
      barplot(sumNEI$Emissions, main = "Emissions in Baltimore from cars per year", 
           xlab = "year", ylab = "Emission in tons", 
           names.arg = sumNEI$year)
      
      
      
      dev.off()
}

