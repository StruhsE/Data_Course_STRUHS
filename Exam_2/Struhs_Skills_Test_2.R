library(tidyverse)
library(ggplot2)
options(scipen = 999)
#I.      
#Data
read.csv("./landdata-states.csv")
landat <- read.csv("./landdata-states.csv")
Val <- landat$Land.Value
Reg <- landat$region
#Plot
jpeg(filename = "Struhs_Fig_1.jpg")
ggplot(landat, aes(x= Year, y= Val, color= Reg))+
  geom_smooth() +
  labs(y= "Land Value (USD)", x = "Year")+
  theme_minimal()
dev.off()
#II

nadat <- landat[is.na(landat$region),]
#NA seems to be data points from Washington D.C. this is probably because as the capital it is supposed to remain more neutral

#III

#Data
Unidat<-read.csv( "unicef-u5mr.csv")
#####Removing the prefix u5mr and removing all null values#####
Unidat_Tidy <-pivot_longer(data = Unidat, cols = starts_with("u")  , names_to = "Year",values_to = "Mortality_Rate", names_prefix = "U5MR.")
Unidat_Tidy = Unidat_Tidy %>%
  filter(`Mortality_Rate` !="NA")
#####Making sure all the data is stored properly#####
Unidat_Tidy$Year <- as.numeric(Unidat_Tidy$Year) 
str(Unidat_Tidy)
Unidat_Tidy$Mortality_Rate <- as.numeric(Unidat_Tidy$Mortality_Rate) 
str(Unidat_Tidy)
Unidat_Tidy$CountryName <- as.character(Unidat_Tidy$CountryName) 
str(Unidat_Tidy)
Unidat_Tidy$Region <- as.character(Unidat_Tidy$Region) 
str(Unidat_Tidy)
Unidat_Tidy$Continent <- as.character(Unidat_Tidy$Continent) 
str(Unidat_Tidy)

#####IV#####

#Figure 2
jpeg(filename = "Struhs_Fig_2.jpg")
ggplot(Unidat_Tidy, aes(x=Year, y= Mortality_Rate, color= Continent))+
  geom_point()+
  labs(y="MortalityRate", x= "Year") +
  theme_minimal()
dev.off()

#Figure 3

#Data
AvgDat <- 
 Unidat_Tidy %>%
  group_by(Continent, Year) %>%
  summarise(Mean_Mortality_Rate = mean(Mortality_Rate))
#Plot

jpeg(filename="Struhs_Fig_3.jpg") 
ggplot(AvgDat, aes(x=Year, y= Mean_Mortality_Rate, color=Continent))+
  geom_line(aes(group=Continent, color=Continent),size=3)+ 
  labs(y="Mean Mortality Rate (deaths per 1000 live births)", x= "Year") + 
  theme_minimal()
dev.off()

#V

jpeg(file="Struhs_Fig_4.jpg") 
ggplot(Unidat_Tidy, aes(x=Year, y=Mortality_Rate/1000)) + 
  geom_point(color="#0E1EE1", size=0.5) + 
  facet_wrap(~Region) + 
  labs(y="Mortality Rate", x= "Year")
dev.off()
# I have no idea how to do the little rectangles