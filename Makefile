# rule for making report  
Report.html: figs/01_make_figure_sampleA.png figs/02_make_figure_sampleB.png figs/03_make_figure_sampleC.png figs/04_make_figure_sampleD.png figs/05_make_figure_summary.png R/06_report.Rmd
	Rscript -e "rmarkdown::render('R/06_report.Rmd', output_file='../report.html',quiet = TRUE)"

# make help
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<

# rule for making figures

figs/01_make_figure_sampleA.png: R/01_make_figure_sampleA.R data/sampleA.csv data/sampleB.csv data/sampleC.csv data/sampleD.csv
	chmod +x R/01_make_figure_sampleA.R && Rscript R//01_make_figure_sampleA.R
# rule for figure 2

figs/02_make_figure_sampleB.png: R/02_make_figure_sampleB.R data/sampleA.csv data/sampleB.csv data/sampleC.csv data/sampleD.csv
	chmod +x R/02_make_figure_sampleB.R && Rscript R//02_make_figure_sampleB.R

figs/03_make_figure_sampleC.png: R/03_make_figure_sampleC.R data/sampleA.csv data/sampleB.csv data/sampleC.csv data/sampleD.csv
	chmod +x R/03_make_figure_sampleC.R && Rscript R//03_make_figure_sampleC.R

figs/04_make_figure_sampleD.png: R/04_make_figure_sampleD.R data/sampleA.csv data/sampleB.csv data/sampleC.csv data/sampleD.csv
	chmod +x R/04_make_figure_sampleD.R && Rscript R//04_make_figure_sampleD.R

figs/05_make_figure_summary.png: R/05_make_figure_summary.R data/sampleA.csv data/sampleB.csv data/sampleC.csv data/sampleD.csv
	chmod +x R/05_make_figure_summary.R && Rscript R/05_make_figure_summary.R


# rule for installing packages
.PHONY: install
install: 
	chmod +x R/00_install_packages.R && Rscript R/00_install_packages.R
