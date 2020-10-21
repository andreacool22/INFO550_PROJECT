library(ggplot2)
library(dplyr)
library(tidyr)

sampleA<-read.csv("data/sampleA.csv")
sampleB<-read.csv("data/sampleB.csv")
sampleC<-read.csv("data/sampleC.csv")
sampleD<-read.csv("data/sampleD.csv")

png("figs/02_make_figure_sampleB.png")
gathercol<-names(sampleB)[-1]
b<-sampleB %>% gather(pb,measurment,gathercol)
b$measurment<-as.numeric(b$measurment)
pb<-ggplot(data = b,aes(pb,measurment,fill=method)) 
pbb<-pb+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.32,0.88,0.02))+labs(title = "sampleB")+coord_cartesian(ylim=c(0.34,0.88))
pbb
dev.off()