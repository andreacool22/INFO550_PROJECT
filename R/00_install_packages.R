installed_pkgs <- row.names(installed.packages())
pkgs <- c("ggplot2", "dplyr", "tidyr", "Rmisc", "plyr", "lattice")
for(p in pkgs){
  if(!(p %in% installed_pkgs)){
    install.packages(p)
  }
}