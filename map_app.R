
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
  d <- read.csv("MO.csv", stringsAsFactors=F)
  
  ## shape
  names(d)[1] <- "Practice"
  names(d)[6] <- "State"
  d$Practice[d$Practice %in% c("Accounting and Finance", "Investment / ALM", "Risk Management")] <- "Life"
  d$Practice <- droplevels(d$Practice)
  d <- sqldf("select Practice, Latitude, Longitude, count(Practice) as Count from d group by 1, 2, 3")
  
  output$map <- renderLeaflet({
    leaflet(d) %>% addTiles() %>% addCircles(~Longitude, ~Latitude, group=~Practice, radius=~Count*1000, 
    fillOpacity=.3, weight=1) %>% 
      addProviderTiles("CartoDB.Positron") %>% addLayersControl(baseGroups=c("Health", "Life", "P&C", "Retirement"), 
                                                                options=layersControlOptions(collapsed=FALSE))
  })
}

## call app
shinyApp(ui, server)
