# Kraken Reports on *Mycobacterium tuberculosis* samples to a Line List

Convert Kraken2 reports on *Mycobacterium tuberculosis* sequences generated in Galaxy to a database friendly .csv line list containing one sample per line. 

This line list detects Bacterial, Mycobacterial and human contamination.

## Installation

1. Download a zip file of the R project by clicking ![](https://raw.githubusercontent.com/TheZetner/picturehosting/master/clone-or-download.png)  
2. Unzip where you want the project to live on your computer (eg. Documents/R_projects/) and rename the folder  
3. Load [RStudio](https://www.rstudio.com/)   
4. From the File menu select 'open project' and open 'Kraken-reports-to-line-list.Rproj'

## Generate Data

Generate Kraken2 Reports in Galaxy using the following settings:  

*Print scientific names instead of just taxids*  No  
*Confidence* 0  
*Minimum Base Quality* 0  
*Enable quick operation* No  
*Split classified and unclassified outputs?* No  
**Create Report**  
*Print a report with aggregrate counts/clade to file* Yes  
*Format report output like Kraken 1's kraken-mpa-report* No  
*Report counts for ALL taxa, even if counts are zero* No  
*Select a Kraken2 database* [Use a comprehensive database]

## Run the Scripts located in the R Folder
1. Run 01_read_data.R  
2. Run 02_generate_linelist.R

## Open the Data

Data is in the /Output folder under kraken_linelist.csv

## Interpret the data

Each column contains the percentage of reads covered by the clade rooted at that taxon. For example the "unclassified" column contains the percentage of reads that Kraken couldn't classify, and the "bacteria" column contains the percentage of reads classified as bacteria. 

 