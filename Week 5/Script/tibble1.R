# Make 1 tibble
# a tiblle is a data frame used in the tiddyverse
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1
# make another tibble
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2
left_join(T1, T2)
right_join(T1, T2)
# inner joins only common data
inner_join(T1, T2)
# full joins both datasets
full_join(T1, T2)
#semi joins keeps all rows from the first data set where there are matching values in the second data set, keeping just columns from the first data set
semi_join(T1, T2)
# anti joins all rows in the first data set that do not match anything in the second data set. This can help you find possible missing data across datasets.
anti_join(T1, T2)
