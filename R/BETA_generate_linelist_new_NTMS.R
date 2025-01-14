# Load data using 01_read.R or add this line (files <- list.files(path="./data", pattern="*.tabular", full.names=TRUE, recursive=FALSE))

# Daniel Kein
# August 2019

library (tidyverse)
library (data.table)

# Set the Contamination Ratios

#Set the Bacteria to Mycobacteria Ratio (1.025 suggested)
bmyco_ratio<-1.025
#Set the Mycobacteria to MTBC Ratio (15 suggested)
myco_mtbc_ratio<-15

# Create a temp directory
dir.create("./output/temp")

# Definte the make kraken line list function
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
  # This slows things down, but not all samples have unclassified in them and the script breaks, this sets a default value for unclassified if not present
  if(nrow(unclassified) == 0){
    V1<-c("not detected")
    unclassified<-data.frame(V1)
  }else{
    unclassified<- my_data %>% filter(V5 == 0)
    unclassified<- unclassified[,c("V1")]}
  
  
  bacteria<- my_data %>% filter(V5 == 2)
  bacteria<- bacteria[,c("V1")]
  mycobacterium<- my_data %>% filter(V5 == 1763)
  mycobacterium<- mycobacterium[,c("V1")]
  # This slows things down, but not all samples have unclassified in them and the script breaks, this sets a default value for unclassified if not present
  if(nrow(mycobacterium) == 0){
    V1<-c("not detected")
    mycobacterium<-data.frame(V1)
  }else{
    mycobacterium<- my_data %>% filter(V5 == 1763)
    mycobacterium<- mycobacterium[,c("V1")]}
  
  mtbc<- my_data %>% filter(V5 == 77643)
  mtbc<- mtbc[,c("V1")]
  # This slows things down, but not all samples have Mtbc in them and the script breaks, this sets a default value for mtbc if not present
  if(nrow(mtbc) == 0){
    V1<-c("not detected")
    mtbc<-data.frame(V1)
  }else{
    mtbc<- my_data %>% filter(V5 == 77643)
    mtbc<- mtbc[,c("V1")]}
  
  mtb<- my_data %>% filter(V5 == 1773)
  mtb<- mtb[,c("V1")]
  # This slows things down, but not all samples have Mtb in them and the script breaks, this sets a default value for mtb if not present
  if(nrow(mtb) == 0){
    V1<-c("not detected")
    mtb<-data.frame(V1)
  }else{
    mtb<- my_data %>% filter(V5 == 1773)
    mtb<- mtb[,c("V1")]}
    
  human<- my_data %>% filter(V5 == 9606) 
  human<- human[,c("V1")]
  # This slows things down, but not all samples have human DNA in them and the script breaks, this sets a default value for human if not present
  if(nrow(human) == 0){
    V1<-c("not detected")
    human<-data.frame(V1)
  }else{
    human<- my_data %>% filter(V5 == 9606) 
    human<- human[,c("V1")]}
 
   #NEW NTM GENERA
  #c5==1866885   
  
  mycolicibacillus<- my_data %>% filter(V5 == 2126281) 
  mycolicibacillus<- mycolicibacillus[,c("V1")]
  if(nrow(mycolicibacillus) == 0){
    V1<-c("not detected")
    mycolicibacillus<-data.frame(V1)
  }else{
    mycolicibacillus<- my_data %>% filter(V5 == 2126281) 
    mycolicibacillus<- mycolicibacillus[,c("V1")]}
  
  mycolicibacter<- my_data %>% filter(V5 == 1073531) 
  mycolicibacter<- mycolicibacter[,c("V1")]
  if(nrow(mycolicibacter) == 0){
    V1<-c("not detected")
    mycolicibacter<-data.frame(V1)
  }else{
    mycolicibacter<- my_data %>% filter(V5 == 1073531) 
    mycolicibacter<- mycolicibacter[,c("V1")]}
  
  mycobacteroides<- my_data %>% filter(V5 == 670516) 
  mycobacteroides<- mycobacteroides[,c("V1")]
  if(nrow(mycobacteroides) == 0){
    V1<-c("not detected")
    mycobacteroides<-data.frame(V1)
  }else{
    mycobacteroides<- my_data %>% filter(V5 == 670516) 
    mycobacteroides<- mycobacteroides[,c("V1")]} 
  
  mycolicibacterium<- my_data %>% filter(V5 == 1866885) 
  mycolicibacterium<- mycolicibacterium[,c("V1")]
  if(nrow(mycolicibacterium) == 0){
    V1<-c("not detected")
    mycolicibacterium<-data.frame(V1)
  }else{
    mycolicibacterium<- my_data %>% filter(V5 == 1866885) 
    mycolicibacterium<- mycolicibacterium[,c("V1")]} 
  
  kraken_linelist <- data.frame(name,unclassified,bacteria,mycobacterium,mtbc,mtb,human,mycolicibacillus,mycolicibacter,mycobacteroides,mycolicibacterium)
  colnames(kraken_linelist) <- c("sample","Kracken_Unclassified","Kracken_Bacteria","Kracken_Mycobacterium","Kracken_MTBC","Kracken_M.tuberculosis","human","Kraken_Mycolicibacillus","Kraken_Mycolicibacter","Kraken_Mycobacteroides","Kraken_Mycolicibacterium")
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

# Apply the make_kraken function to all the files in the data directory
res <- sapply(files, make_kraken)


# Get a List of all`.csv` files in the temp directory
filenames <- list.files("./output/temp", pattern="*.csv", full.names=TRUE)

# read and row bind all the .csv files together
csv_data <- rbindlist(lapply(filenames,fread))

# write the final output to .csv
write.csv(csv_data, file="./output/kraken_linelist.csv", row.names=FALSE)

