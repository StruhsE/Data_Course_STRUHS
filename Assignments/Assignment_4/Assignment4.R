#II
read.csv("../../Data/ITS_mapping.csv", sep = "\t")
ITS<- read.csv("../../Data/ITS_mapping.csv", sep = "\t")
ECO <- as.factor(ITS$Ecosystem)


png(filename = "./silly_boxplot.png")
boxplot(ECO, ITS$Lat)
dev.off()