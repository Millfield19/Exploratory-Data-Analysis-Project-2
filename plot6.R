#Millfield19
#06.05.2020
#creates the plot6.png
plot6 <- function () {
      png("plot6.png", height = 480, width = 480)
      
   NEI <- readRDS("data/summarySCC_PM25.rds")
   SCC <- readRDS("data/Source_Classification_Code.rds")
   
   
   vehicle <- grepl("Vehicles", SCC$SCC.Level.Two)
   subSCC <- SCC[vehicle,]
   subNEI <- NEI[NEI$SCC %in% subSCC$SCC, ]
   subNEI <- subset(subNEI, fips=="24510" | fips=="06037")
   
   citynames <- c("06037" = "LA", "24510" = "BAL")
   
   g <- ggplot(subNEI, aes(factor(year), Emissions)) +
      geom_bar(stat="identity") +
      facet_grid(. ~ fips, labeller = as_labeller(citynames)) + 
      labs(x="year" , y="Total Emissions in tons",
           title="Motor vehicles emissions in Los Angeles and Balitmore over the years")
   
   print(g)
      
      dev.off()
}