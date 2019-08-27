# Clean and prepare data
# analysis-template/clean/
# Matt Dray


# Use this file for tidying data and preparing it for further analysis
library(tidyverse)


my_data <- as_tibble(data)

# Galaxy workflow filters c5==0 or c5==2 or c5==1763 or c5==77643 or c5==1773 or c5==9606



#filter Mycobacterium
unclassified<- my_data %>% filter(V5 == 0)

#filter Bacteria
bacteria<- my_data %>% filter(V5 == 2)

#filter Mycobacterium
mycobacterium<- my_data %>% filter(V5 == 1763)

#filter Mycobacterium tuberculosis complex
mtbc<- my_data %>% filter(V5 == 77643)

#filter Mycobacterium tuberculosis 
mtbc<- my_data %>% filter(V5 == 1773)

#filter human 
human<- my_data %>% filter(V5 == 9606)

