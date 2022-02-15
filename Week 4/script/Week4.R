#learn how to use ggplot

#Created by Ray on 20220208
#### Week 3 BIOL551 lab
library(tidyverse)
library(palmerpenguins)
library(here)

glimpse(penguins)

head(penguins)

filter(.data=penguins, 
       sex=="female") #use quotes for characters

filter(.data=penguins, 
       year==2008|year == 2009) #no quotes for values and or "|" function

filter(.data=penguins, body_mass_g >5000)

filter(.data=penguins, island!="Dream") #"!" is a NOT function

filter(.data=penguins, species=="Adelie" | species=="Gentoo") #"|" function rather than and since no column has both

filter(.data=penguins, species %in% c("Adelie", "Gentoo")) #same AND function as above

filter(.data = penguins, 
       body_mass_g <5000,
       body_mass_g >3000) #penguins between 3000 and 5000 g

data2<-mutate(.data=penguins, 
              body_mass_kg = body_mass_g/1000) #creates a new column with a Kg to g conversion

View(data2) #view data

data2<- mutate(.data = penguins,
               after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
View(data2)

data3<-mutate(.data=penguins, 
              body_mass_flipper = body_mass_g + flipper_length_mm) #creates a new column body mass and flipper sum

View(data3) #view data       

data4<- mutate(.data = penguins,
               after_2008 = ifelse(body_mass_g>4000, "big", "small")) #If body mass > 4000 g then call it "big" in the new column, or else 
View(data4)

penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass) #renames "species" to "Species"

penguins %>% 
  group_by(island) %>% #group min and max from each island
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = min(flipper_length_mm, na.rm=TRUE))#na.rm skips over NA values

penguins %>%
  drop_na(sex) %>% #drops "na" in the sex column
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()
  
