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
      Mycobacterium_avium[, c("V1")]}
  
  
  
  #Mycobacterium_avium_subsp_avium 44454
  Mycobacterium_avium_subsp_avium <- my_data %>% filter(V5 == 44454)
  Mycobacterium_avium_subsp_avium <-
    Mycobacterium_avium_subsp_avium[, c("V1")]
  if (nrow(Mycobacterium_avium_subsp_avium) == 0) {
    V1 <- c("not detected")
    Mycobacterium_avium_subsp_avium <- data.frame(V1)
  } else{
    Mycobacterium_avium_subsp_avium <- my_data %>% filter(V5 == 44454)
    Mycobacterium_avium_subsp_avium <-
      Mycobacterium_avium_subsp_avium[, c("V1")]}
  
  #Mycobacterium_avium_subsp_hominissuis  439334
  Mycobacterium_avium_subsp_hominissuis <- my_data %>% filter(V5 == 439334)
  Mycobacterium_avium_subsp_hominissuis <-
    Mycobacterium_avium_subsp_hominissuis[, c("V1")]
  if (nrow(Mycobacterium_avium_subsp_hominissuis) == 0) {
    V1 <- c("not detected")
    Mycobacterium_avium_subsp_hominissuis <- data.frame(V1)
  } else{
    Mycobacterium_avium_subsp_hominissuis <- my_data %>% filter(V5 == 439334)
    Mycobacterium_avium_subsp_hominissuis <-
      Mycobacterium_avium_subsp_hominissuis[, c("V1")]}
  
  
  #Mycobacterium_avium_subsp_paratuberculosis  1770
  Mycobacterium_avium_subsp_paratuberculosis <- my_data %>% filter(V5 == 1770)
  Mycobacterium_avium_subsp_paratuberculosis <-
    Mycobacterium_avium_subsp_paratuberculosis[, c("V1")]
  if (nrow(Mycobacterium_avium_subsp_paratuberculosis) == 0) {
    V1 <- c("not detected")
    Mycobacterium_avium_subsp_paratuberculosis <- data.frame(V1)
  } else{
    Mycobacterium_avium_subsp_paratuberculosis <- my_data %>% filter(V5 == 1770)
    Mycobacterium_avium_subsp_paratuberculosis <-
      Mycobacterium_avium_subsp_paratuberculosis[, c("V1")]}
  
  #Mycobacterium_avium_subsp_silvaticum  44282
  Mycobacterium_avium_subsp_silvaticum <- my_data %>% filter(V5 == 44282)
  Mycobacterium_avium_subsp_silvaticum <-
    Mycobacterium_avium_subsp_silvaticum[, c("V1")]
  if (nrow(Mycobacterium_avium_subsp_silvaticum) == 0) {
    V1 <- c("not detected")
    Mycobacterium_avium_subsp_silvaticum <- data.frame(V1)
  } else{
    Mycobacterium_avium_subsp_silvaticum <- my_data %>% filter(V5 == 44282)
    Mycobacterium_avium_subsp_silvaticum <-
      Mycobacterium_avium_subsp_silvaticum[, c("V1")]}
  
  #Mycobacterium_bouchedurhonense 701041
  Mycobacterium_bouchedurhonense <- my_data %>% filter(V5 == 701041)
  Mycobacterium_bouchedurhonense <-
    Mycobacterium_bouchedurhonense[, c("V1")]
  if (nrow(Mycobacterium_bouchedurhonense) == 0) {
    V1 <- c("not detected")
    Mycobacterium_bouchedurhonense <- data.frame(V1)
  } else{
    Mycobacterium_bouchedurhonense <- my_data %>% filter(V5 == 701041)
    Mycobacterium_bouchedurhonense <-
      Mycobacterium_bouchedurhonense[, c("V1")]
  }
 
  #Mycobacterium_chimaera 701041
  Mycobacterium_chimaera <- my_data %>% filter(V5 == 701041)
  Mycobacterium_chimaera <-
    Mycobacterium_chimaera[, c("V1")]
  if (nrow(Mycobacterium_chimaera) == 0) {
    V1 <- c("not detected")
    Mycobacterium_chimaera <- data.frame(V1)
  } else{
    Mycobacterium_chimaera <- my_data %>% filter(V5 == 701041)
    Mycobacterium_chimaera <-
      Mycobacterium_chimaera[, c("V1")]
  } 
  
  #Mycobacterium_colombiense 1041522
  Mycobacterium_colombiense <- my_data %>% filter(V5 == 1041522)
  Mycobacterium_colombiense <-
    Mycobacterium_colombiense[, c("V1")]
  if (nrow(Mycobacterium_colombiense) == 0) {
    V1 <- c("not detected")
    Mycobacterium_colombiense <- data.frame(V1)
  } else{
    Mycobacterium_colombiense <- my_data %>% filter(V5 == 1041522)
    Mycobacterium_colombiense <-
      Mycobacterium_colombiense[, c("V1")]
  } 
  
  
  #Mycobacterium_intracellulare 487521
  Mycobacterium_intracellulare <- my_data %>% filter(V5 == 487521)
  Mycobacterium_intracellulare <-
    Mycobacterium_intracellulare[, c("V1")]
  if (nrow(Mycobacterium_intracellulare) == 0) {
    V1 <- c("not detected")
    Mycobacterium_intracellulare <- data.frame(V1)
  } else{
    Mycobacterium_intracellulare <- my_data %>% filter(V5 == 487521)
    Mycobacterium_intracellulare <-
      Mycobacterium_intracellulare[, c("V1")]
  } 
  
  #Mycobacterium_intracellulare_subsp_intracellulare 35617
  Mycobacterium_intracellulare_subsp_intracellulare <- my_data %>% filter(V5 == 35617)
  Mycobacterium_intracellulare_subsp_intracellulare <-
    Mycobacterium_intracellulare_subsp_intracellulare[, c("V1")]
  if (nrow(Mycobacterium_intracellulare_subsp_intracellulare) == 0) {
    V1 <- c("not detected")
    Mycobacterium_intracellulare_subsp_intracellulare <- data.frame(V1)
  } else{
    Mycobacterium_intracellulare_subsp_intracellulare <- my_data %>% filter(V5 == 35617)
    Mycobacterium_intracellulare_subsp_intracellulare <-
      Mycobacterium_intracellulare_subsp_intracellulare[, c("V1")]
  } 
  
  
  
  #Mycobacterium_lepraemurium 64667
  Mycobacterium_lepraemurium <- my_data %>% filter(V5 == 64667)
  Mycobacterium_lepraemurium <-
    Mycobacterium_lepraemurium[, c("V1")]
  if (nrow(Mycobacterium_lepraemurium) == 0) {
    V1 <- c("not detected")
    Mycobacterium_lepraemurium <- data.frame(V1)
  } else{
    Mycobacterium_lepraemurium <- my_data %>% filter(V5 == 64667)
    Mycobacterium_lepraemurium <-
      Mycobacterium_lepraemurium[, c("V1")]
  } 
  
  
  #Mycobacterium_mantenii 560555
  Mycobacterium_mantenii <- my_data %>% filter(V5 == 560555)
  Mycobacterium_mantenii <-
    Mycobacterium_mantenii[, c("V1")]
  if (nrow(Mycobacterium_mantenii) == 0) {
    V1 <- c("not detected")
    Mycobacterium_mantenii <- data.frame(V1)
  } else{
    Mycobacterium_mantenii <- my_data %>% filter(V5 == 560555)
    Mycobacterium_mantenii <-
      Mycobacterium_mantenii[, c("V1")]  }
  
    
  #Mycobacterium_marseillense 701042
  Mycobacterium_marseillense <- my_data %>% filter(V5 == 701042)
  Mycobacterium_marseillense <-
    Mycobacterium_marseillense[, c("V1")]
  if (nrow(Mycobacterium_marseillense) == 0) {
    V1 <- c("not detected")
    Mycobacterium_marseillense <- data.frame(V1)
  } else{
    Mycobacterium_marseillense <- my_data %>% filter(V5 == 701042)
    Mycobacterium_marseillense <-
      Mycobacterium_marseillense[, c("V1")]  }
  
  #Mycobacterium_paraintracellulare 1138383
  Mycobacterium_paraintracellulare <- my_data %>% filter(V5 == 1138383)
  Mycobacterium_paraintracellulare <-
    Mycobacterium_paraintracellulare[, c("V1")]
  if (nrow(Mycobacterium_paraintracellulare) == 0) {
    V1 <- c("not detected")
    Mycobacterium_paraintracellulare <- data.frame(V1)
  } else{
    Mycobacterium_paraintracellulare <- my_data %>% filter(V5 == 1138383)
    Mycobacterium_paraintracellulare <-
      Mycobacterium_paraintracellulare[, c("V1")]  }
  
  #Mycobacterium_paraintracellulare 1138383
  Mycobacterium_paraintracellulare <- my_data %>% filter(V5 == 1138383)
  Mycobacterium_paraintracellulare <-
    Mycobacterium_paraintracellulare[, c("V1")]
  if (nrow(Mycobacterium_paraintracellulare) == 0) {
    V1 <- c("not detected")
    Mycobacterium_paraintracellulare <- data.frame(V1)
  } else{
    Mycobacterium_paraintracellulare <- my_data %>% filter(V5 == 1138383)
    Mycobacterium_paraintracellulare <-
      Mycobacterium_paraintracellulare[, c("V1")]  }
  
  #Mycobacterium_timonense 701043
  Mycobacterium_timonense <- my_data %>% filter(V5 == 701043)
  Mycobacterium_timonense <-
    Mycobacterium_timonense[, c("V1")]
  if (nrow(Mycobacterium_timonense) == 0) {
    V1 <- c("not detected")
    Mycobacterium_timonense <- data.frame(V1)
  } else{
    Mycobacterium_timonense <- my_data %>% filter(V5 == 701043)
    Mycobacterium_timonense <-
      Mycobacterium_timonense[, c("V1")]  }
  
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
                                Mycobacterium_arosiense,Mycobacterium_avium,Mycobacterium_avium_subsp_avium,Mycobacterium_avium_subsp_hominissuis,Mycobacterium_avium_subsp_paratuberculosis,
                                Mycobacterium_avium_subsp_silvaticum,
                                Mycobacterium_bouchedurhonense,Mycobacterium_chimaera,Mycobacterium_colombiense,
                                Mycobacterium_intracellulare,Mycobacterium_intracellulare_subsp_intracellulare,Mycobacterium_lepraemurium,Mycobacterium_mantenii,
                                Mycobacterium_marseillense,Mycobacterium_paraintracellulare,Mycobacterium_timonense,
                                Mycobacterium_aemonae,Mycobacterium_anthracenicum)
  
  colnames(kraken_linelist) <- c("sample","Mycobacterium_album","Mycobacterium_alsense","Mycobacterium_angelicum",
                                 "Mycobacterium_aquaticum","Mycobacterium_aquiterrae","Mycobacterium_asiaticum","Mycobacterium_attenuatum","Mycobacterium_avium_complex",
                                 "Mycobacterium_arosiense","Mycobacterium_avium","Mycobacterium_avium_subsp_avium","Mycobacterium_avium_subsp_hominissuis","Mycobacterium_avium_subsp_paratuberculosis",
                                 "Mycobacterium_avium_subsp_silvaticum",
                                 "Mycobacterium_bouchedurhonense","Mycobacterium_chimaera","Mycobacterium_colombiense",
                                 "Mycobacterium_intracellulare","Mycobacterium_intracellulare_subsp_intracellulare","Mycobacterium_lepraemurium","Mycobacterium_mantenii",
                                 "Mycobacterium_marseillense","Mycobacterium_paraintracellulare","Mycobacterium_timonense",
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
