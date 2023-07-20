library(stats)
library(cluster)
library(ggplot2)
library(factoextra)
library(dplyr)
library(ggrepel)

Mydata<-read.csv("F:/AIUB/SEMESTER 10/Data Science/Final project/archive/WineQT.csv",header = TRUE,sep = ",")
Mydata

str(Mydata)

sum(is.na(Mydata))


colSums(sapply(Mydata, function(x) Mydata %in% x))


wine_norm <- scale(Mydata[, c(1,2,3,4,5,6,7,8,9,10,11)])
summary(wine_norm)

fviz_nbclust(wine_norm ,kmeans, method = "wss")

kmeans(wine_norm ,centers = 4,iter.max = 100, nstart = 100)

fviz_cluster(kmeans(wine_norm ,centers = 4,iter.max = 100, nstart = 100),data=wine_norm)


km <- kmeans(wine_norm, centers = 4)




