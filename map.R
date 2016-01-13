
library(sqldf)
library(leaflet)
d <- read.csv("C:/Users/JS033085/Desktop/EQ/MO.csv")
names(d)[6] <- "State"

## shape
d <- sqldf("select City, State, Latitude, Longitude, count(City) as Count from d group by 1, 2, 3, 4")

## plot
leaflet() %>% addTiles() %>% addCircles(lng=d$Longitude, lat=d$Latitude, radius=10*d$Count^2, fillOpacity=.3, weight=1) %>% 
  addProviderTiles("CartoDB.Positron") %>% addLayersControl(baseGroups=c("Health", "Life", "P&C", "Retirement"), 
                                                            options=layersControlOptions(collapsed=FALSE))
