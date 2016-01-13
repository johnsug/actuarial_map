
library(shiny)    ## app framework
library(sqldf)    ## data munging
library(leaflet)  ## map viz

## UI
ui <- bootstrapPage(
  leafletOutput("map")
)

## server
server <- function(input, output){
  
  ## get data
  d <- read.csv("C:/Users/JS033085/Desktop/EQ/MO.csv")
  
  ## shape
  names(d)[6] <- "State"
  d <- sqldf("select City, State, Latitude, Longitude, count(City) as Count from d group by 1, 2, 3, 4")
  
  output$map <- renderLeaflet({
    leaflet(d) %>% addTiles() %>% addCircles(~Longitude, ~Latitude, radius=~Count^2*10, fillOpacity=.3, weight=1) %>% 
      addProviderTiles("CartoDB.Positron") %>% addLayersControl(baseGroups=c("Health", "Life", "P&C", "Retirement"), 
                                                                options=layersControlOptions(collapsed=FALSE))
  })
}

## call app
shinyApp(ui, server)
