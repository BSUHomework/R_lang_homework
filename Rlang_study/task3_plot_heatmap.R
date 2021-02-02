library(ggplot2)
library(RColorBrewer)
library(grid)
#install.packages("cowplot")
download.file("https://github.com/BSUHomework/R_lang_homework/blob/main/Rlang_study/task3_heatmap_data_1.csv",destfile = "./task3_heatmap_data_1.csv")
download.file("https://github.com/BSUHomework/R_lang_homework/blob/main/Rlang_study/task3_heatmap_data2.csv",destfile = "./task3_heatmap_data2.csv")
data1 = read.csv("https://raw.githubusercontent.com/BSUHomework/R_lang_homework/main/Rlang_study/task3_heatmap_data_1.csv")

library(pheatmap)
heat1 = pheatmap(data1,scale="none",
                 cluster_rows=F,
                 cluster_cols=F,
                 show_rownames=F,
                 show_colnames=F,
                 legend = FALSE,
                 border_color = "white",
                 color=colorRampPalette(c("#EEEDED", "#C4A28E", "#FFCDB0"))(3),
                 main="\n\n\n",
                 labels_row="data")

data2 = read.csv("https://raw.githubusercontent.com/BSUHomework/R_lang_homework/main/Rlang_study/task3_heatmap_data2.csv")

heat2 = pheatmap(data2,scale="none",
                 cluster_rows=F,
                 cluster_cols=F,
                 show_rownames=F,
                 show_colnames=F,
                 legend = FALSE,
                 border_color = "white",
                 color=colorRampPalette(c("#EEEDED", "#8B0909"))(2),
                 main = "\n\n\n")

require(ggplotify)
g1 = as.ggplot(heat1)
g1=g1+ labs(caption = "\n")
g2 = as.ggplot(heat2)
g2=g2+ labs(caption = "\n")
cowplot::plot_grid(g1, g2, ncol=2)
grid.text("Swiss minors \n\nIn all,they represent 14% of the\npopulation\n16-17 year-olds represent 2%",x=0.01,y=0.9,just="left")
grid.text("Foreign residents\n\n25% of the population",x=0.51,y=0.93,just="left")
grid.text("Approximately 2,148,000 peopie",x=0.51,y=0.05,just="left")
grid.text("Approximately 1,261,000 people",x=0.01,y=0.05,just="left")

