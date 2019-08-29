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
#Set the output name
outputname<-1

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
  

#Mycobacterium_album 230710
  Mycobacterium_album<- my_data %>% filter(V5 == 230710)
  Mycobacterium_album<- Mycobacterium_album[,c("V1")]
  if(nrow(Mycobacterium_album) == 0){
    V1<-c("not detected")
    Mycobacterium_album<-data.frame(V1)
  }else{
    Mycobacterium_album<- my_data %>% filter(V5 == 230710)
    Mycobacterium_album<- Mycobacterium_album[,c("V1")]}
  
  #Mycobacterium_alsense 324058
  Mycobacterium_alsense<- my_data %>% filter(V5 == 324058)
  Mycobacterium_alsense<- Mycobacterium_alsense[,c("V1")]
  if(nrow(Mycobacterium_alsense) == 0){
    V1<-c("not detected")
    Mycobacterium_alsense<-data.frame(V1)
  }else{
    Mycobacterium_alsense<- my_data %>% filter(V5 == 324058)
    Mycobacterium_alsense<- Mycobacterium_alsense[,c("V1")]}
  
  
  #Mycobacterium_angelicum 470074
  Mycobacterium_angelicum<- my_data %>% filter(V5 == 470074)
  Mycobacterium_angelicum<- Mycobacterium_angelicum[,c("V1")]
  if(nrow(Mycobacterium_angelicum) == 0){
    V1<-c("not detected")
    Mycobacterium_angelicum<-data.frame(V1)
  }else{
    Mycobacterium_angelicum<- my_data %>% filter(V5 == 470074)
    Mycobacterium_angelicum<- Mycobacterium_angelicum[,c("V1")]}

#Mycobacterium_aquaticum 1927124
  Mycobacterium_aquaticum<- my_data %>% filter(V5 == 1927124)
  Mycobacterium_aquaticum<- Mycobacterium_aquaticum[,c("V1")]
  if(nrow(Mycobacterium_aquaticum) == 0){
    V1<-c("not detected")
    Mycobacterium_aquaticum<-data.frame(V1)
  }else{
    Mycobacterium_aquaticum<- my_data %>% filter(V5 == 1927124)
    Mycobacterium_aquaticum<- Mycobacterium_aquaticum[,c("V1")]} 
  
  #Mycobacterium_aquiterrae  627680
  Mycobacterium_aquiterrae <- my_data %>% filter(V5 == 627680)
  Mycobacterium_aquiterrae <- Mycobacterium_aquiterrae[, c("V1")]
  if (nrow(Mycobacterium_aquiterrae) == 0) {
    V1 <- c("not detected")
    Mycobacterium_aquiterrae <- data.frame(V1)
  } else{
    Mycobacterium_aquiterrae <- my_data %>% filter(V5 == 627680)
    Mycobacterium_aquiterrae <-
      Mycobacterium_aquiterrae[, c("V1")]
  }
  
  #Mycobacterium_asiaticum 1790  
  Mycobacterium_asiaticum<- my_data %>% filter(V5 == 1790)
  Mycobacterium_asiaticum<- Mycobacterium_asiaticum[,c("V1")]
  if(nrow(Mycobacterium_asiaticum) == 0){
    V1<-c("not detected")
    Mycobacterium_asiaticum<-data.frame(V1)
  }else{
    Mycobacterium_asiaticum<- my_data %>% filter(V5 == 1790)
    Mycobacterium_asiaticum<- Mycobacterium_asiaticum[,c("V1")]}  
  
  #Mycobacterium_attenuatum 1790  
  Mycobacterium_attenuatum <- my_data %>% filter(V5 == 2341086)
  Mycobacterium_attenuatum <- Mycobacterium_attenuatum[, c("V1")]
  if (nrow(Mycobacterium_attenuatum) == 0) {
    V1 <- c("not detected")
    Mycobacterium_attenuatum <- data.frame(V1)
  } else{
    Mycobacterium_attenuatum <- my_data %>% filter(V5 == 2341086)
    Mycobacterium_attenuatum <- Mycobacterium_attenuatum[, c("V1")]
  }  
 
  #MAC 120793
  Mycobacterium_avium_complex <- my_data %>% filter(V5 == 120793)
  Mycobacterium_avium_complex <-
    Mycobacterium_avium_complex[, c("V1")]
  if (nrow(Mycobacterium_avium_complex) == 0) {
    V1 <- c("not detected")
    Mycobacterium_avium_complex <- data.frame(V1)
  } else{
    Mycobacterium_avium_complex <- my_data %>% filter(V5 == 120793)
    Mycobacterium_avium_complex <-
      Mycobacterium_avium_complex[, c("V1")]
  }

  #Mycobacterium_arosiense 1265311
  Mycobacterium_arosiense <- my_data %>% filter(V5 == 1265311)
  Mycobacterium_arosiense <-
    Mycobacterium_arosiense[, c("V1")]
  if (nrow(Mycobacterium_arosiense) == 0) {
    V1 <- c("not detected")
    Mycobacterium_arosiense <- data.frame(V1)
  } else{
    Mycobacterium_arosiense <- my_data %>% filter(V5 == 1265311)
    Mycobacterium_arosiense <-
      Mycobacterium_arosiense[, c("V1")]
  }
  
  #Mycobacterium_avium 1764
  Mycobacterium_avium <- my_data %>% filter(V5 == 1764)
  Mycobacterium_avium <-
    Mycobacterium_avium[, c("V1")]
  if (nrow(Mycobacterium_avium) == 0) {
    V1 <- c("not detected")
    Mycobacterium_avium <- data.frame(V1)
  } else{
    Mycobacterium_avium <- my_data %>% filter(V5 == 1764)
    Mycobacterium_avium <-
      Mycobacterium_avium[, c("V1")]
  }
  
  
# Unestablished species ------------------------------------------------------     
#  'Mycobacterium_aemonae' 470075
  Mycobacterium_aemonae<- my_data %>% filter(V5 == 470075)
  Mycobacterium_aemonae<- Mycobacterium_aemonae[,c("V1")]
  if(nrow(Mycobacterium_aemonae) == 0){
    V1<-c("not detected")
    Mycobacterium_aemonae<-data.frame(V1)
  }else{
    Mycobacterium_aemonae<- my_data %>% filter(V5 == 470075)
    Mycobacterium_aemonae<- Mycobacterium_aemonae[,c("V1")]}
 
  #Mycobacterium_anthracenicum 69970
  Mycobacterium_anthracenicum<- my_data %>% filter(V5 == 470074)
  Mycobacterium_anthracenicum<- Mycobacterium_anthracenicum[,c("V1")]
  if(nrow(Mycobacterium_anthracenicum) == 0){
    V1<-c("not detected")
    Mycobacterium_anthracenicum<-data.frame(V1)
  }else{
    Mycobacterium_anthracenicum<- my_data %>% filter(V5 == 470074)
    Mycobacterium_anthracenicum<- Mycobacterium_anthracenicum[,c("V1")]}  
  

  

# Make the Dataframe ------------------------------------------------------

  kraken_linelist <- data.frame(name,Mycobacterium_album,Mycobacterium_alsense,Mycobacterium_angelicum,
                                Mycobacterium_aquaticum,Mycobacterium_aquiterrae,Mycobacterium_asiaticum,Mycobacterium_attenuatum,Mycobacterium_avium_complex,
                                Mycobacterium_arosiense,Mycobacterium_avium,
                                Mycobacterium_aemonae,Mycobacterium_anthracenicum)
  
  colnames(kraken_linelist) <- c("sample","Mycobacterium_album","Mycobacterium_alsense","Mycobacterium_angelicum",
                                 "Mycobacterium_aquaticum","Mycobacterium_aquiterrae","Mycobacterium_asiaticum","Mycobacterium_attenuatum","Mycobacterium_avium_complex",
                                 "Mycobacterium_arosiense","Mycobacterium_avium",
                                 "'Mycobacterium_aemonae'","'Mycobacterium_anthracenicum'")
 
# save the files seperately
  write.csv(kraken_linelist, file=paste("./output/temp/",name,".csv", sep=""), row.names=FALSE)
}

# After the function

# Apply the make_kraken function to all the files in the data directory
res <- sapply(files, make_kraken)


# Get a List of all`.csv` files in the temp directory
filenames <- list.files("./output/temp", pattern="*.csv", full.names=TRUE)

# read and row bind all the .csv files together
csv_data <- rbindlist(lapply(filenames,fread))

# write the final output to .csv
write.csv(csv_data,file=paste("./output/kraken_linelist_",outputname,".csv", sep=""), row.names=FALSE)

