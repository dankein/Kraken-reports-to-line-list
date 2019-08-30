# Read data 
# from Matt Dray analysis-template/src/

# Use this R script for reading in the raw data - Kraken Reports from Galaxy saved in the /data folder (Galaxy outputs .tabular files)
# Daniel Kein
# August 2019

files <- list.files(path="./data", pattern="*.tabular", full.names=TRUE, recursive=FALSE)