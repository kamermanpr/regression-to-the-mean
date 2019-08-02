############################################################
#                                                          #
#                      Load packages                       #
#                                                          #
############################################################
library(tidyverse)
library(spatstat)

############################################################
#                                                          #
#                       Import data                        #
#                                                          #
############################################################
## Data source: Finnerup et al 2015, Appendix 4

data <- read_csv('data/baseline-data.csv')

############################################################
#                                                          #
#                      Cut-off values                      #
#                                                          #
############################################################
## Data source: Finnerup et al 2015, Appendix 4

## All numeric values used (after removing duplicates)
## All values converted to a values out of 10
cut_off <- c(5, 4, 4, 2, 4, 3, 4, 6, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
             4, 6, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
             4, 4, 4, 4, 4, 4, 4, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 3, 4, 
             4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 3, 5, 4, 4, 4, 5, 5,
             4, 4, 5, 3, 4, 4, 4, 5, 4, 3, 3, 3, 3, 3, 3, 3, 4, 7, 5, 4, 3, 2,
             3, 4, 4, 2.5, 2.5, 4, 4, 4, 4, 5, 4, 4, 8, 4, 4, 4, 5, 3, 4, 4, 4)
hist(cut_off, 
     breaks = c(0,1,2,3,4,5,6,7,8,9,10))
summary(cut_off)

############################################################
#                                                          #
#                    Weighted medians                      #
#                                                          #
############################################################

## Three studies, four median values
## Order: Hahn_2004(active), Hahn_2004(placebo), Yuen_2002, Low_1995

median <- data %>% 
    filter(included_in_analysis == 'yes') %>% 
    filter(mean_or_median == 'median') %>% 
    # Calculate total sample size
    mutate(total_sample = sum(sample_size)) %>% 
    # Calculate weights
    mutate(weights = sample_size / total_sample)
    
## Calculate weighted median
weighted.median(x = median$value, 
                w = median$weights)

############################################################
#                                                          #
#                       Pooled mean                        #
#                                                          #
############################################################
## Formula sourced from: https://www.ncbi.nlm.nih.gov/books/NBK56512/

## Clean data
mean <- data %>% 
    filter(included_in_analysis == 'yes') %>% 
    filter(mean_or_median == 'mean') %>% 
    # Multiply mean by the sample size
    mutate(mean_by_n = value * sample_size) 

## Calculate pooled mean
sum(mean$mean_by_n) / sum(mean$sample_size)

############################################################
#                                                          #
#                        Pooled SD                         #
#                                                          #
############################################################
## Formula sourced from: https://www.ncbi.nlm.nih.gov/books/NBK56512/

## Clean data
sd <- data %>% 
    filter(included_in_analysis == 'yes') %>% 
    filter(mean_or_median == 'mean') %>% 
    filter(!is.na(SD)) %>% 
    # Square the SD
    mutate(SD_squared = SD^2) %>% 
    # Calculate sample size -1
    mutate(n_minus_1 = sample_size - 1) %>% 
    # Get the number of groups
    mutate(k = length(unique(.$authors))) %>% 
    # Calculate (n-1)SD^2
    mutate(numerator = SD_squared * n_minus_1)

## Calculate pooled SD
x <- sqrt(sum(sd$numerator) / (sum(sd$sample_size) - sd$k[[1]]))
round(x, 2)
round(x - 0.5, 2)
round(x + 0.5, 2)
