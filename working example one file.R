# Take a kraken report from Galaxy in .tabular format and rearrange into a line list

# Use this file for tidying data and preparing it for further analysis
library(tidyverse)

data<- read.delim("./data/1800786.tabular", header=FALSE)

my_data <- as_tibble(data)

filename <- "./data/1800786.tabular"
data <- read.delim("./data/1800786.tabular", header=FALSE)
name <- basename(filename)
# remove .tabular from the file name
name <- gsub(".tabular", "", name)

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
kraken_linelist <- data.frame(name,unclassified,bacteria,mycobacterium,mtbc,mtb,human)
colnames(kraken_linelist) <- c("sample","Kracken_Unclassified","Kracken_Bacteria","Kracken_Mycobacterium","Kracken_MTBC","Kracken_M.tuberculosis","Kraken_human")


# divide bacteria by mycobacteria
kraken_linelist$Kracken_Bacteria_Myco <- (kraken_linelist$Kracken_Bacteria / kraken_linelist$Kracken_Mycobacterium)

# divide mycobacteria by mtbc
kraken_linelist$Kracken_Myco_MTBC <- (kraken_linelist$Kracken_Mycobacterium / kraken_linelist$Kracken_MTBC)

# add these columns
Bacterial_Contamination <- ""
Mycobacterial_Contamination <- ""

kraken_linelist$Bacterial_Contamination <- Bacterial_Contamination

#calculate contamination
kraken_linelist$Bacterial_Contamination<- ifelse(kraken_linelist$Kracken_Bacteria_Myco >=1.025, "Possible contamination", "no")


kraken_linelist$Mycobacterial_Contamination <- Mycobacterial_Contamination

#calculate contamination
kraken_linelist$Mycobacterial_Contamination <- ifelse(kraken_linelist$Kracken_Myco_MTBC >=15, "Possible contamination", "no")

# write file

write.csv(kraken_linelist, file=paste("./output/",name,".csv", sep=""), row.names=FALSE)

