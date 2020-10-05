library(tidyverse)
data(iris)
#I
png(file="iris_fig1.png")
ggplot(iris, aes(x=Sepal.Length , y= Petal.Length, color= Species ))
+ geom_point() + geom_smooth(method = lm) + theme_classic() 
+ scale_color_brewer(palette="Dark2")
+ labs(title = "Sepal length vs petal length", subtitle = "for three iris species") 
dev.off()

#II
png(file="iris_fig2.png")
ggplot(iris, aes(x=Petal.Width, fill= Species)) + geom_density(alpha=(0.4)) + theme_classic() +
  labs(title = "Distribution of Petal Width", subtitle = "for three iris species")
dev.off()
#II
png(file="iris_fig3.png")
ggplot(iris, aes(x=Species , y= c(Petal.Width/Sepal.Width) , fill= Species)) + geom_boxplot() + theme_classic() +
  labs(title= "Sepal- to Petal-Width Ratio", subtitle = "for three iris species", y = "Ratio of Sepal Width to Petal Width")
dev.off()
#IV

#I had no idea how to even approach 4
