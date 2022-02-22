#Week 5a
### How to use joins ####
### Created by: Dr.  Ray Hong #############
### Updated on: 2022-02-22 ####################
#### Load Libraries ######
library(tidyverse)
library(here)
##Becker and Silbiger (2020) Journal of Experimental Biology##
### Load data ######
# Environmental data from each site
EnviroData<-read_csv(here("Week 5","data", "site.characteristics.data.csv"))
#Thermal performance data
TPCData<-read_csv(here("Week 5","data","Topt_data.csv"))
glimpse(EnviroData)
glimpse(TPCData)
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site
view(EnviroData_wide)
FullData_left<- left_join(TPCData, EnviroData_wide)%>%
relocate(where(is.numeric), .after = where(is.character)) 
# relocate all the numeric data after the character data
## Joining, by = "site.letter"
head(FullData_left)
##summarize_if function##
summary<-FullData_left %>%
  group_by(site.letter) %>% # group by Site
  summarise_if(is.numeric, list(mean=mean, variance=var), na.rm=TRUE)
View(summary)

#another way to summarize is by pivot. Script below is NOT correct#
FullData_leftnew <-FullData_left %>%
  pivot_longer(cols = E:substrate.cover, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") %>% # names of the new column with all the val
  group_by(site.letter, Variables) %>%
  summarise(VariableMean = mean(Values, na.rm = TRUE),
            VariableVar = var(Values, na.rm = TRUE))
View(ChemData_long)            