library(ggplot2)
library(dplyr)
library(tidyr)

sampleA<-read.csv("data/sampleA.csv")
sampleB<-read.csv("data/sampleB.csv")
sampleC<-read.csv("data/sampleC.csv")
sampleD<-read.csv("data/sampleD.csv")

png("figs/03_make_figure_sampleC.png")
gathercol<-names(sampleC)[-1]
c<-sampleC %>% gather(pc,measurment,gathercol)
c$measurment<-as.numeric(c$measurment)
pc<-ggplot(data = c,aes(pc,measurment,fill=method)) 
pcc<-pc+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.32,0.88,0.01))+labs(title = "sampleC")+coord_cartesian(ylim=c(0.71,0.85))
pcc
dev.off