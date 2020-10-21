For my project, I will analyze the RNA sequence data like always. The data were obtained from Gene Expression Omnibus database repository.
To analyze the data you will need to install some R packages. The required packages can be installed using R commands.
```
installed_pkgs <- row.names(installed.packages())
pkgs <- c("ggplot2", "dplyr", "tidyr", "Rmisc", "plyr", "lattice")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
		install.packages(p)
	}
}
```
To execute the analysis, from the project folder you can run
```
Rscript -e "rmarkdown::render('INFO 550 HW3.Rmd', output_file = 'report.html')"
```
This will create a file called Report.html output in your directory that contains the results.

