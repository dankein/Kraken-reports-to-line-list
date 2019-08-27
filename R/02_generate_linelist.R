
# from 01_read.R (files <- list.files(path="./data", pattern="*.tabular", full.names=TRUE, recursive=FALSE))

# Load library

library (tidyverse)

# Set the Ratios
bmyco_ratio<-1.025
myco_mtbc_ratio<-15

dir.create("./output/temp")

make_kraken <- function(files) {

  for(i in 1:length(files)){
    x<-read.delim(files[i], header=FALSE)
    filename <-files[i]
    name <- basename(filename)
    name <- gsub(".tabular", "", name)
  }
  
  my_data <- as_tibble(x)
  unclassified<- my_data %>% filter(V5 == 0)
  unclassified<- unclassified[,c("V1")]
  bacteria<- my_data %>% filter(V5 == 2)
  bacteria<- bacteria[,c("V1")]
  mycobacterium<- my_data %>% filter(V5 == 1763)
  mycobacterium<- mycobacterium[,c("V1")]
  mtbc<- my_data %>% filter(V5 == 77643)
  mtbc<- mtbc[,c("V1")]
  mtb<- my_data %>% filter(V5 == 1773)
  mtb<- mtb[,c("V1")]
  human<- my_data %>% filter(V5 == 9606)
  human<- human[,c("V1")]
  kraken_linelist <- data.frame(name,unclassified,bacteria,mycobacterium,mtbc,mtb,human)
  colnames(kraken_linelist) <- c("sample","Kracken_Unclassified","Kracken_Bacteria","Kracken_Mycobacterium","Kracken_MTBC","Kracken_M.tuberculosis","Kraken_human")
  kraken_linelist$Kracken_Bacteria_Myco_Ratio <- ((kraken_linelist$Kracken_Bacteria +0.000001) / (kraken_linelist$Kracken_Mycobacterium + 0.000001))
  kraken_linelist$Kracken_Myco_MTBC_Ratio <- ((kraken_linelist$Kracken_Mycobacterium +0.000001) / (kraken_linelist$Kracken_MTBC +0.000001))
  Bacterial_Contamination <- ""
  Mycobacterial_Contamination <- ""
  kraken_linelist$Bacterial_Contamination <- Bacterial_Contamination
  kraken_linelist$Bacterial_Contamination<- ifelse(kraken_linelist$Kracken_Bacteria_Myco >=bmyco_ratio, "Possible contamination", "no")
  kraken_linelist$Mycobacterial_Contamination <- Mycobacterial_Contamination
  kraken_linelist$Mycobacterial_Contamination <- ifelse(kraken_linelist$Kracken_Myco_MTBC >=myco_mtbc_ratio, "Possible contamination", "no")
  write.csv(kraken_linelist, file=paste("./output/temp/",name,".csv", sep=""), row.names=FALSE)
}

res <- sapply(files, make_kraken)


# Get a List of all`.csv` files in the temp directory
filenames <- list.files("./output/temp", pattern="*.csv", full.names=TRUE)

# read and row bind all data sets
data <- rbindlist(lapply(filenames,fread))
write.csv(data, file="./output/kraken_linelist.csv", row.names=FALSE)

unlink("./output/temp", recursive = TRUE)