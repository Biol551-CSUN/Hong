#learn how to use ggplot

#Created by Ray on 20220208
#### Week 3 BIOL551 lab
library(tidyverse)
library(palmerpenguins)
library(here)
glimpse(penguins)
ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm, #aesthetics is NOT the actual legend
                     y=bill_length_mm, 
                     color=species,
                     shape = species, #adds shape of data points
                     size = body_mass_g,
                     alpha=flipper_length_mm #transparency level based on flipper length
                     )) +
  #below visualizes the points so names different from data frame
  geom_point(size=3, alpha=0.5)+ #enter setting inside brackets 
  labs(title = "Bill Depth and Length",
       subtitle = "Dimensions for Body Metric",
       x = "Bill Depth (mm)", y = "Bill Length (mm)",
       color = "species",
       caption = "Source: Palmer Station Penguins")+
  scale_color_viridis_d()+ #changes for color blindness
  facet_wrap(~species, ncol = 2) #only want the first 2 columns
#facet_grid(species~sex) #faceting bisects species vs sex
#new line from desktop
