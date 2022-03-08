install.packages(c("maps", "mapproj"))
# Load libraries
library(tidyverse)
library(here)
library(maps)
library(mapdata)
library(mapproj)
install.packages("mapdata")
# Read in data on population in California by county
popdata<-read_csv(here("Week 7","data","CApopdata.csv"))
#read in data on number of seastars at different field sites
stars<-read_csv(here("Week 7","data","stars.csv"))
# get data for the entire world
world<-map_data("world")
head(world)
tail(world)
# get data for the USA
usa<-map_data("usa")
head(usa)
# get data for italy
italy<-map_data("italy")
head(italy)
# get data for states
states<-map_data("state")
head(states)
# get data for counties
counties<-map_data("county")
head(counties)
# draws world map
ggplot()+
  geom_polygon(data = world, aes(x = long, y = lat, group = group))
# group = group is an important line
# Add color to the lines and fill.
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, y = lat, group = group,
               fill = region),
               color = "black")+
  guides(fill = FALSE)+
  theme_minimal()+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "mercator",
            xlim = c(-180,180))
#sinusoidal instead of "mercator"
# Use the states dataset
head(states)
# Use the states dataset to make a map of just CA
CA_data<-states %>%
  filter(region == "california")
ggplot()+
  geom_polygon(data = CA_data, 
               aes(x = long, 
                   y = lat, 
                   group = group), 
               color = "black")+
  coord_map()+
  theme_void() #removes the lat and long lines
# Look at the county data
head(counties)
# Look at the county data
head(popdata)
tail(popdata)
# Wrangle the data. Make the column names the same to join the two datasets. 
# rename "subregion" to "county"
CApop_county<-popdata %>%
  select("subregion" = County, Population)  %>% # rename the county col
  inner_join(counties) %>%
  filter(region == "california") # some counties have same names in other states
## Joining, by = "subregion"
head(CApop_county)
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),
               color = "pink")+
  coord_map()+
  theme_void()
#
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),
               color = "white")+
  coord_map()+
  theme_void()+
  scale_fill_gradient(trans = "log10")
head(stars)
# add a geom_point layer
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  geom_point(data = stars, # add a point at all my sites
             aes(x = long,
                 y = lat,
                 size = star_no))+ # Make size of points proportional to number of stars.
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")
