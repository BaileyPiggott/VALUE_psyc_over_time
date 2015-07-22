
# set up dataframes of scores

#libraries:
library(ggplot2)
library(tidyr)
library(dplyr)
library(magrittr)
library(RColorBrewer)

# load data
df = read.csv("PSYC 203 Value Rubric Data (Yr 2).csv")
df <- df[ , -grep("Change", colnames(df))] #remove change columns

# average the 2 markers' scores for second year
score_1 <- df %>% select(PS1.1:WC5.1)
score_2 <- df %>% select(PS1.2:WC5.2)
colnames(score_2) <- colnames(score_1) # change column names for row bind

n_2 <- nrow(score_1) #sample size for second year

psyc_2 <- bind_rows(score_1, score_2) %>% 
  summarise_each(funs(mean(., na.rm = TRUE))) # take average of each column
