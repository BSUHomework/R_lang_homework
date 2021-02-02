rm(list = ls()) 
#this is my paper data
options(stringsAsFactors = F)
load(file = "DEGoutput.Rdata")
load(file = "DEGinput.Rdata")

library(pheatmap)
choose_gene = head(rownames(nrDEG),25)
choose_matrix = exp[choose_gene,]
choose_matrix = t(scale(t(choose_matrix)))
# bulid annotation
annotation_col = data.frame(
  type = c("KO","KO","KO","WT","WT","WT")
)
annotation_col
rownames(annotation_row) = paste("Gene", 1:20, sep = "")
rownames(annotation_col)=c("GSM341241","GSM341242","GSM341243","GSM341244","GSM341245","GSM341246")
head(annotation_col)
pheatmap(choose_matrix,border=FALSE,annotation_col = annotation_col)
pheatmap(log2(exp[choose_gene,]))