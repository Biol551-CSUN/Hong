#Week 4b
### Today we are going to practice tidy with biogeochemistry data from Hawaii ####
### Created by: Dr.  Ray Hong #############
### Updated on: 2022-02-17 ####################
#### Load Libraries ######
library(tidyverse)
library(here)
### Load data ######
ChemData<-read_csv(here("Week 4","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)
ChemData_clean<-ChemData %>%
  filter(complete.cases(.)) #filters out rows that are not complete
View(ChemData_clean)

ChemData_clean %>% 
separate(col = Tide_time, # choose the tide time col
         into = c("Tide","Time"), # separate it into two columns Tide and time
         sep = "_", # separate by _
         remove = FALSE) %>%  # keep the original tide_time column
unite(col = "Site_Zone", # the name of the NEW col
      c(Site,Zone), # the columns to unite
      sep = ".", # lets put a . in the middle
      remove = FALSE) # keep the original
head(ChemData_clean)

ChemData_long <-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") # names of the new column with all the val
View(ChemData_long)

ChemData_long %>%
  group_by(Variables, Site, Zone, Tide_time) %>% # group by everything we want- Site, Zone, Tide_time
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE), # get variance
            Param_sd = sd(Values, na.rm = TRUE)) # get standard deviation
View(ChemData_long)

ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") # frees up axes, e.g Y-axis scale

ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new columns
              values_from = Values) # column with the values

View(ChemData_wide)
