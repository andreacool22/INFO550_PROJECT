library(ggplot2)
library(dplyr)
library(tidyr)

sampleA<-read.csv("data/sampleA.csv")
sampleB<-read.csv("data/sampleB.csv")
sampleC<-read.csv("data/sampleC.csv")
sampleD<-read.csv("data/sampleD.csv")

png("figs/01_make_figure_sampleA.png")
gathercol<-names(sampleA)[-1]
a<-sampleA %>% gather(pa,measurment,gathercol)
a$measurment<-as.numeric(a$measurment)
pa<-ggplot(data = a,aes(pa,measurment,fill=method)) 
paa<-pa+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.80,0.88,0.02))+labs(title = "sampleA")+coord_cartesian(ylim=c(0.7369766,0.88))
paa
dev.off()