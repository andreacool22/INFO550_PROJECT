library(ggplot2)
library(dplyr)
library(tidyr)

sampleA<-read.csv("data/sampleA.csv")
sampleB<-read.csv("data/sampleB.csv")
sampleC<-read.csv("data/sampleC.csv")
sampleD<-read.csv("data/sampleD.csv")

png("figs/04_make_figure_sampleD.png")
gathercol<-names(sampleD)[-1]
d<-sampleD %>% gather(pd,measurment,gathercol)
d$measurment<-as.numeric(d$measurment)
pd<-ggplot(data = d,aes(pd,measurment,fill=method)) 
pdd<-pd+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.32,0.88,0.01))+labs(title = "sampleD")+coord_cartesian(ylim=c(0.55,0.85))
pdd
dev.off()