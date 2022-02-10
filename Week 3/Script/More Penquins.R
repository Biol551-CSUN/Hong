#learn how to use ggplot 

#Created by Ray Hong on 20220210
#### Week 3b BIOL551 
library(tidyverse)
library(palmerpenguins)
library(here)
library(beyonce)
library(ggthemes)
glimpse(penguins)
ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm, 
                     y=bill_length_mm, 
                     group=species,
                     color=species))+
                     geom_point()+
                     geom_smooth(method = 'lm')+
                       labs(x="Bill depth (mm)",
                            y= "Bill length (mm)"
                            )+
#scale_color_viridis_d()+ ###change color for color blind
#scale_color_manual(values = c("orange", "purple", green")+ ###only one scale at a time
#scale_color_manual(values=beyonce_palette(27))+ #up to 130 palettes
theme_economist()+
  scale_colour_economist()
  #theme_bw()
#theme_classic()
#theme(axis.title=element_text(size=25, 
 #                             color="red"),
  #    panel.background=element_rect(fill='linen'))+
  coord_fixed()
ggsave(here("Week 3", "output", "penguins_economist.png"))
#theme_bw() #gray background
#coord_flip() #flip x and y axes
#coord_polar("x") # make polar                   
