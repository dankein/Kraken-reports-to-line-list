#Delete the temp directory
unlink("./output", recursive = TRUE)
unlink("./data", recursive = TRUE)
Sys.sleep(5)
dir.create("./data")
dir.create("./output")