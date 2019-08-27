# *Mycobacterium tuberculosis* Kraken Reports to Line List

Convert

## Project Setup with this Template and RStudio

1. Download a zip file of the template by clicking ![](https://raw.githubusercontent.com/TheZetner/picturehosting/master/clone-or-download.png)  
2. Unzip where you want the project to live on your computer (eg. Documents/R_projects/) and rename the folder  
3. Load [RStudio](https://www.rstudio.com/) (are you not using RStudio? You really should be)  
4. Click _File>New Project...>Existing Directory_  
5. Select the unzipped template folder then _Create Project_  

Start working!

## Explanations

Questions? [adrian.zetner@canada.ca](mailto:adrian.zetner@canada.ca)

### Files in the Main Folder

* **.gitignore**: Only matters for version control. Tells Git which files it shouldn't monitor (eg. pictures, data)  
* **01_read.R**: Set up script to read in raw data and do basic cleaning  
* **02_tidy.R**: Advanced cleaning and modification of data  
* **03_model.R**: Statistical modelling from cleaned data
* **LICENSE**: MIT open source license, default for all software projects undertaken by Bioinformatics Core  
* **README**: This file. Replace it with an explanation of your project  

### Subfolders  

* **R**: Optionally store support functions in individual R files here  
* **data**: Raw data goes here. Do not modify raw data in place. This isn't Excel.  
* **output**: Script outputs (eg. cleaned data and figures)  
* **ext**: External sources like statistical models  
* **doc**: R markdown documents explaining the analysis

## Based originally on the below links
An opinionated [repository template](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates/)
to begin a simple analytical project with R.  
Read this blog post for more information: https://www.rostrum.blog/2019/06/11/r-repo-template/
