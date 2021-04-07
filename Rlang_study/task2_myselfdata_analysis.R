library(hrbrthemes)
library(ggplot2)
exp = read.csv("./exp_data.csv",header = T)
exp_L = melt(exp)
rownames(exp)<-exp[,1]
exp=exp[,2:7]
colnames(exp_L)=c('symbol','sample','value')
group_list=c(rep("KO",times=3),rep("WT",times=3))
group_list
exp_L$group = rep(group_list,each=nrow(exp))
head(exp_L)
str(exp_L)
head(exp)
colnames(exp) = paste(group_list,1:6,sep='')
head(exp)
###boxplot
p=ggplot(exp_L,aes(x=sample,y=value,fill=group))+geom_boxplot()
p=p+stat_summary(fun.y="mean",geom="point",shape=23,size=3,fill="red")
p=p+theme_set(theme_set(theme_bw(base_size=20)))
p=p+theme(text=element_text(face='bold'),axis.text.x=element_text(angle=30,hjust=1),axis.title=element_blank())
print(p)
## hist plot
p <- ggplot(exp_L, aes(x=value,color=group)) + 
  geom_histogram()
p  
## density
p=ggplot(exp_L,aes(value,col=group))+geom_density() 
print(p)
## scatterplot
ggplot(exp,aes(GSM341241,GSM341244))+geom_point(alpha=0.2)+
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=F)

## heatmap plot
library(pheatmap)
pheatmap(exp[1:50,])
##corrgram
#install.packages("corrplot")
library(corrplot)
corrplot.mixed(cor(exp), upper = "ellipse")

