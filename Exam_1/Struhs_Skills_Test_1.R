PCRdat <- read.csv("../DNA_Conc_by_Extraction_Date.csv", header = TRUE)

#I
plot (PCRdat$Year_Collected, PCRdat$DNA_Concentration_Katy, main = "Katy's Data Cocentration", xlab = "Year Collected", ylab = "DNA Concentration")

plot (PCRdat$Year_Collected, PCRdat$DNA_Concentration_Ben, main = "Ben's Data Cocentration", xlab = "Year Collected", ylab = "DNA Concentration")

#II

boxplot (PCRdat$DNA_Concentration_Katy ~ PCRdat$Year_Collected, main = "Katy's Extractions", xlab = "Year", ylab = "DNA Concentration")

boxplot (PCRdat$DNA_Concentration_Ben ~ PCRdat$Year_Collected, main = "Ben's Extractions", xlab = "Year", ylab = "DNA Concentration",col= blue)

#III

jpeg("./Struhs_Plot1.jpg")
boxplot (PCRdat$DNA_Concentration_Katy ~ PCRdat$Year_Collected, main = "Katy's Extractions", xlab = "Year", ylab = "DNA Concentration")
dev.off()

jpeg("./Struhs_Plot2.jpg")
boxplot (PCRdat$DNA_Concentration_Ben ~ PCRdat$Year_Collected, main = "Ben's Extractions", xlab = "Year", ylab = "DNA Concentration")
dev.off()

#IV

boxplot (PCRdat$DNA_Concentration_Katy ~ PCRdat$Year_Collected, main = NULL, xlab = NULL, ylab = NULL, ylim= c(0,3),col=26)
par(new=T)
boxplot (PCRdat$DNA_Concentration_Ben ~ PCRdat$Year_Collected, main = "Extraction Comparison", xlab = "Year", ylab = "DNA Concentration", ylim= c(0,3),col="#ffffff00")
#Based on this plot we can see that in 2011  is relatively Ben's worst year

#V

library(tidyverse)

Downstairs.dat <- filter(PCRdat, Lab %in% c("Downstairs"))
Labdat <- Downstairs.dat
Datedat <- factor(Labdat$Date_Collected)

jpeg("./Ben_DNA_over_time.jpg")
plot(Datedat, Labdat$DNA_Concentration_Ben)
dev.off()

#VI 

#Did not attempt
