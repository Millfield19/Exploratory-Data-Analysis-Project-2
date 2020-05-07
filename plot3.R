#Millfield19
#06.05.2020
#creates the plot3.png
plot3 <- function () {
      png("plot3.png", height = 480, width = 480)
      
      NEI <- readRDS("data/summarySCC_PM25.rds")
      SCC <- readRDS("data/Source_Classification_Code.rds")
   
      subNEI <- subset(NEI, fips=="24510")
      
      subNEI$Pollutant
      
      g <- ggplot(subNEI, aes(factor(year), Emissions)) +
            geom_bar(stat="identity") +
            facet_grid(. ~ type) +
            labs(x="year" , y="Total Emissions of PM2.5 in tons",
                 title="Emissions in Balitmore over the years seperated in types")
      
      print(g)
      
      dev.off()
}