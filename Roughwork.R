library(dplyr)
library(vegan)
library(ggplot2)
library(gridextra)

BCCoastalDATA <- read.csv("~/Desktop/GCSC_Data_10NOV2017.csv")

BCCoastalDATA <-BCCoastalDATA %>%
  filter(Province=="British Columbia",Year_ >=2013, Coastal == "Yes") %>%
  select( - (Year_:Items),- (Item_of_Co:Coastal), -Ecosections.Id) %>%
  filter(Ecosections.Region %in% c("(11) Mainland Fjords","(15) Johnstone Strait","(18) Northern Strait of Georgia","(19) Central Strait of Georgia","(21) Interior Gulf Islands","(22) Haro Strait and Rosario Passage","(23) Juan de Fuca Strait","(6) Low Flow Nearshore"))

BCCoastalDATA[is.na(BCCoastalDATA)]<-0

BCCoastalDATA <- BCCoastalDATA %>%
  mutate(rowsum= rowSums(.[1:45])) %>%
  filter(rowsum>0) %>%
  select(- rowsum)

Data <- BCCoastalDATA %>%
  select(-Ecosections.Region)

H <- diversity(Data)
S <- specnumber(Data) 
BCCoastalDATA["H"] <- H
BCCoastalDATA["S"] <- S
BCCoastalDATA["E"] <- (H/log(S))
BCCoastalDATA$E[is.na(BCCoastalDATA$E )]<-1

Summary_Indices<- BCCoastalDATA %>%
  group_by(Ecosections.Region) %>%
  summarize(mean(H),mean(S),mean(E),n())

BC$Ecosections.Region <- reorder(BCCoastalDATA$Ecosections.Region, BC$E)
p1 <- ggplot(BCCoastalDATA,aes(x=Ecosections.Region, y=E)) +
      stat_summary(fun.mean=mean, geom="point", size = 2.5) +
      stat_summary(fun.data = mean_se, geom = "errorbar",width=.2) +
      theme_classic() + 
      labs(x = "", y= "Evenness") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      theme(axis.text=element_text(size=12),
      axis.title=element_text(size=14,face="bold")) +
      scale_x_discrete(labels=c("MF","JS","NSG","CSG","IGI","HSRP","JFS","LFN"))
p1

p2 <- ggplot(BCCoastalDATA,aes(x=Ecosections.Region, y=H)) +
  stat_summary(fun.mean=mean, geom="point", size = 2.5) +
  stat_summary(fun.data = mean_se, geom = "errorbar",width=.2) +
  theme_classic() + 
  labs(x = "", y= "Diversity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))+
  scale_x_discrete(labels=c("MF","JS","NSG","CSG","IGI","HSRP","JFS","LFN"))
p2

p3 <- ggplot(BCCoastalDATA,aes(x=Ecosections.Region, y=S)) +
  stat_summary(fun.mean=mean, geom="point", size = 2.5) +
  stat_summary(fun.data = mean_se, geom = "errorbar",width=.2) +
  theme_classic() + 
  labs(x = "Ecosection", y= "Richness") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))+
  scale_x_discrete(labels=c("MF","JS","NSG","CSG","IGI","HSRP","JFS","LFN"))
p3

grid.arrange(p1,p2,p3,ncol=1)
