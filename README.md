## Teaching medical students big data with augmented reality
by Raoul R. Wadhwa, Shreya Louis, Paola Raska

To replicate the results of this study, use one of the following methods.

### General instructions

Before reading these instructions, make sure you have R installed on your machine; if not, visit [this site](http://www.r-project.org/) to install it.

If you are reading these instructions on a local file, please go to https://github.com/rrrlw/hololens-pca using a web browser (most of you should already be at this link).
This README should also be present at the link (you might have to scroll down).
At the top of the webpage, you will find 4 files in the repository:

1. **.gitignore**: used by GitHub and can be safely ignored.
2. **DataDictionary.csv**: contains the names of each of the quantitative variables collected in column 1, followed by the questions, options, or meanings of the variable in column 2.
Note that column 1 of this file corresponds to row 1 of the PCA-Holo.csv file.
This file does not need to be downloaded to replicate the results of this study, but should be downloaded to understand how the R script works.
3. **PCA-Holo.csv**: contains actual data collected.
Use in conjunction with DataDictionary.csv to understand what each of the variables and values means in context of the study.
This file needs to be downloaded to replicate the results of this study.
4. **analysis.R**: R script that calculates all the reported values/statistical tests for the study.
This file needs to be downloaded to replicate the results of this study.

To successfully replicate the results of this study, download files 2-4 (DataDictionary.csv, PCA-Holo.csv, and analysis.R) and save them in the same folder.
Then, either open terminal and run `Rscript analysis.R` or open Rgui (or any IDE that can run R) and run the analysis.R script.

### Git/GitHub users

Running the following lines on terminal should give the desired output. N.B. R (>= 3.5) is required to run the script. 

```
git clone https://github.com/rrrlw/hololens-pca.git
cd hololens-pca
Rscript analysis.R
```
