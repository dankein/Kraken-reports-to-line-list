
#delete tabular files in the data directory
datadir <- "./data"
delfiles1 <- dir(path="./data",pattern="*.tabular")
file.remove(file.path(datadir, delfiles1))

#delete csv files in the output directory
mydir <- "./output"
delfiles2 <- dir(path=./output,pattern="*.csv"))
file.remove(file.path(mydir, delfiles2))

#Delete the output/temp directory to delete it completely
unlink("./output/temp", recursive = TRUE)
