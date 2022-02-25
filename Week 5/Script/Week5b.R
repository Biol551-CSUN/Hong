#Week 5b#
#lubridate#
install.packages("lubridate") # package to deal with dates and times
library(tidyverse)
library(here)
library(lubridate)
now() #what time is it now?
now(tzone = "EST") # what time is it on the east coast
now(tzone = "GMT") # what time in GMT
today()
today(tzone = "GMT")
am(now()) # is it morning?
leap_year(now()) # is it a leap year?
ymd("2021-02-24")
# make a character string
datetimes<-c("02/24/2021 22:22:20", 
             "02/25/2021 11:21:10", 
             "02/26/2021 8:01:52") 
# convert to datetimes
datetimes <- mdy_hms(datetimes)
month(datetimes) # extract month as vector
month(datetimes, label = TRUE)
month(datetimes, label = TRUE, abbr = FALSE) #Spell it out
day(datetimes) # extract day as vector
wday(datetimes, label = TRUE) # extract day of week
hour(datetimes) # extract hoor
minute(datetimes) # extract minute
second(datetimes) # extract second
datetimes + hours(4) # this adds 4 hours to convert timezone manually
#adding "s" to "hours" adds while "hour" extracts
datetimes + days(2) # this adds 2 days
round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minute
###This is temperature and salinity data taken at a site with groundwater###
CondData<-read_csv(here("Week_5","data", "CondData.csv"))%>%
  mutate(datetime = mdy_hms(depth)) %>% #changes column
drop_na()#removes NA field but not sure if this was necessary
view(CondData)
