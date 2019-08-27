# Read data
# analysis-template/src/
# Matt Dray

# Use this file for reading in the raw data

# Read Kraken Reports from Galaxy saved in the /data folder (Galaxy outputs .tabular files)

files <- list.files(path="./data", pattern="*.tabular", full.names=TRUE, recursive=FALSE)