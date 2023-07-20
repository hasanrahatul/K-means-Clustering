Mydata<-read.csv ("F:/AIUB/SEMESTER 10/Data Science/Project/Dataset_midterm.csv",header = TRUE,sep = "," )
Mydata

Mydata$Blood[Mydata$Blood==""] =NA
Mydata
colSums(is.na(Mydata))

plot(1:80,Mydata$Age)
plot(1:80,Mydata$weight)

Mydata$Age[Mydata$Age>=90]=NA
Mydata

Mydata$Blood=factor(Mydata$Blood,levels=c("high","normal","low"),
                    labels = c(1,2,3))
Mydata

Remove = Mydata[complete.cases(Mydata$Age,Mydata$weight,Mydata$Delivery_number,Mydata$Delivery_time,
                               Mydata$Blood,Mydata$Heart,Mydata$Caesarian),]
Remove

Men<-as.data.frame(Mydata)
Men$weight[is.na(Men$weight)]=mean(Men$weight,na.rm = TRUE)
Men$Age[is.na(Men$Age)]=mean(Men$Age,na.rm = TRUE)
Men
mean(Men$Age)
mean(Men$weight)

Med<-as.data.frame(Mydata)
Med$weight[is.na(Med$weight)]=median(Med$weight,na.rm = TRUE)
Med$Age[is.na(Med$Age)]=median(Med$Age,na.rm = TRUE)
Med


library("DescTools")
Mo<-as.data.frame(Mydata)
Mo$Age[is.na(Mo$Age)]=Mode(Mo$Age,na.rm = TRUE)
Mo$weight[is.na(Mo$weight)]=Mode(Mo$weight,na.rm = TRUE)
Mo


library(dplyr)
Remove %>% summarise_if(is.numeric, sd)
sd(Remove$Age)
sd(Remove$weight)

range(Remove$Age)
range(Remove$weight)

Mode(Remove$weight)
Mode(Remove$Age)


