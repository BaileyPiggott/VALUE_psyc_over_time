
# set up dataframes of scores

#libraries:
library(ggplot2)
library(tidyr)
library(dplyr)
library(magrittr)
library(RColorBrewer)

# load data
df = read.csv("VALUE 1-4.csv")
year2 = read.csv("PSYC 203 Value Rubric Data (Yr 2).csv")

# 1st year
psyc_1 <- df %>% 
  filter(Program == 2 & Course_sample == 101) %>% # first year psyc
  select(-c(Student_ID, Program, Course_sample))  #take out unnecessary columns

n_1 <- nrow(psyc_1)
psyc_1 <- psyc_1 %>%  summarise_each(funs(mean(., na.rm = TRUE))) # take average of each column
  
psyc_4 <- df %>% 
  filter(Program == 2 & Course_sample == 501) %>% # first year psyc
  select(-c(Student_ID, Program, Course_sample)) %>% #take out unnecessary columns
  summarise_each(funs(mean(., na.rm = TRUE))) # take average of each column

## second year
year2 <- year2[ , -grep("Change", colnames(year2))] #remove change columns

# average the 2 markers' scores for second year
score_1 <- year2 %>% select(PS1.1:WC5.1)
score_2 <- year2 %>% select(PS1.2:WC5.2)
colnames(score_2) <- colnames(score_1) # change column names for row bind

n_2 <- nrow(score_1) #sample size for second year

psyc_2 <- bind_rows(score_1, score_2) %>% #second year data
  summarise_each(funs(mean(., na.rm = TRUE))) %>% # take average of each column
  cbind(Year = 2, .) # add year column at start
