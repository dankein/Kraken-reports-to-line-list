# Clean and prepare data
# analysis-template/clean/
# Matt Dray


# Use this file for tidying data and preparing it for further analysis
library(tidyverse)
#library(dplyr)


my_data <- as_tibble(data)

# Galaxy workflow filters c5==0 or c5==2 or c5==1763 or c5==77643 or c5==1773 or c5==9606

# Filter the kraken report by species, using the taxonmic number that is in column 5

#filter Mycobacterium
unclassified<- my_data %>% filter(V5 == 0)
unclassified<- unclassified[,c("V1")]

#filter Bacteria
bacteria<- my_data %>% filter(V5 == 2)
bacteria<- bacteria[,c("V1")]

#filter Mycobacterium
mycobacterium<- my_data %>% filter(V5 == 1763)
mycobacterium<- mycobacterium[,c("V1")]

#filter Mycobacterium tuberculosis complex
mtbc<- my_data %>% filter(V5 == 77643)
mtbc<- mtbc[,c("V1")]

#filter Mycobacterium tuberculosis 
mtb<- my_data %>% filter(V5 == 1773)
mtb<- mtb[,c("V1")]

#filter human 
human<- my_data %>% filter(V5 == 9606)
human<- human[,c("V1")]


# join the dataframes together
df <- data.frame(unclassified,bacteria,mycobacterium,mtbc,mtb,human)
colnames(df) <- c("unclassified","bacteria","mycobacterium","mtbc","mtb","human")

