# Read data
# analysis-template/src/
# Matt Dray

# Use this file for reading in the raw data

# Read Kraken Reports From R Individually
data<- read.delim("./data/1800786.tabular", header=FALSE)

files <- list.files(path = /data/ 
                    pattern = "*.json",
                    full.names = T)