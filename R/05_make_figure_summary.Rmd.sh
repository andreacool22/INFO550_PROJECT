```{r setup, include=TRUE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r, load-package}
library(ggplot2)
library(dplyr)
library(tidyr)
```

```{r}
sampleA<-read.csv("../data/sampleA.csv")
sampleB<-read.csv("../data/sampleB.csv")
sampleC<-read.csv("../data/sampleC.csv")
sampleD<-read.csv("../data/sampleD.csv")
```


```{r 05_make_figure_summary}
knitr::opts_chunk$set(echo = TRUE)
png("../figs/05_make_figure_summary.png")
gathercol<-names(sampleA)[-1]
a<-sampleA %>% gather(pa,measurment,gathercol)
a$measurment<-as.numeric(a$measurment)
pa<-ggplot(data = a,aes(pa,measurment,fill=method)) 
paa<-pa+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.80,0.88,0.02))+labs(title = "sampleA")+coord_cartesian(ylim=c(0.7369766,0.88))

gathercol<-names(sampleB)[-1]
b<-sampleB %>% gather(pb,measurment,gathercol)
b$measurment<-as.numeric(b$measurment)
pb<-ggplot(data = b,aes(pb,measurment,fill=method)) 
pbb<-pb+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.32,0.88,0.02))+labs(title = "sampleB")+coord_cartesian(ylim=c(0.34,0.88))

gathercol<-names(sampleC)[-1]
c<-sampleC %>% gather(pc,measurment,gathercol)
c$measurment<-as.numeric(c$measurment)
pc<-ggplot(data = c,aes(pc,measurment,fill=method)) 
pcc<-pc+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.32,0.88,0.01))+labs(title = "sampleC")+coord_cartesian(ylim=c(0.71,0.85))

gathercol<-names(sampleD)[-1]
d<-sampleD %>% gather(pd,measurment,gathercol)
d$measurment<-as.numeric(d$measurment)
pd<-ggplot(data = d,aes(pd,measurment,fill=method)) 
pdd<-pd+geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits=c(0,0.88),breaks=seq(0.32,0.88,0.01))+labs(title = "sampleD")+coord_cartesian(ylim=c(0.55,0.85))

library("Rmisc")
library("plyr")
library("lattice")
final<-multiplot(paa, pbb, pcc, pdd, cols=1)
final
dev.off()
```