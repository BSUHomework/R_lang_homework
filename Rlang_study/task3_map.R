download.file("https://tapiquen-sig.jimdofree.com/app/download/5502525659/Europe.rar?t=1455822996" )

library(rgdal)
library(dplyr)
library(RColorBrewer)
library(rworldmap)
library(leaflet)
library(RCurl)
#import data form Europe shap data
Europe <- readOGR( dsn= paste0(getwd(),"/Europe/") , layer="Europe",verbose=FALSE)
Europe@data$index = row.names(Europe@data)
Europe@data$index = as.integer(Europe@data$index)
data_jrstu= read.csv('data-jrStu.csv',sep = ",",header = T)
#merge web message wiht Europe database
delindex = merge(Europe@data,data_jrstu,by.x="NAME",by.y="country.EN")$index
Europe@data = merge(Europe@data,data_jrstu,by.x="NAME",by.y="country.EN",all.x=T)
Europe@data = Europe@data[order(sort(Europe@data$index)),]
Europe@data = Europe@data[order(Europe@data$index),]

Europe@polygons= Europe@polygons[1:50]
#used bins to plot Europe data

mybins <- c(-Inf,-50,-25,0,25,50,Inf)
pal = colorBin( palette = c("#C10703","#ED5E31","#CA7E18","#BDFF8A","#6ED672","#11BB09"),na.color = "#DDDDDD",domain =  Europe$difference,bins=mybins)
mytext <- paste(Europe$NAME,"<br/><br/>",
  "Number of asylum seekers taken in 2019: ", Europe@data$applicants,"<br/>", 
  "Fair number based on population:: ", Europe@data$population, "<br/>", 
  "Difference: ", Europe@data$difference,"%" ,
  sep="") %>%
  lapply(htmltools::HTML)

leaflet(Europe)%>%
  setView(10, 51, zoom = 3) %>%
  addPolygons( fillColor = ~pal(difference),stroke=TRUE, fillOpacity = 0.9, color="#DDDDDD", weight=0.3,label = mytext,
   labelOptions = labelOptions( 
     style = list("font-weight" = "normal", padding = "3px 8px"), 
     textsize = "13px", 
     direction = "auto"
   ))



