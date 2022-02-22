# Skam and its Effects on Naming of Children in Denmark
## By Matilde Boysen Lauritzen and Sarah Leegaard Poulsen

### Running libraries
library(tidyverse)
library(ggplot2)
library(readr)

### Importing data
library(readr)
Data_Skam <- read_csv("Data_Skam.csv")
View(Data_Skam)

### Creating a graph
skam.long <- Data_Skam %>% 
  select("Freq_2013_Procent","Freq_2014_Procent","Freq_2015_Procent","Freq_2016_Procent","Freq_2017_Procent","Freq_2018_Procent","Freq_2019_Procent","Name") %>% 
  pivot_longer(-Name,names_to = "Years", values_to = "Percentage")

ggplot(skam.long,aes(Name,Percentage,color=Years))+geom_line()+geom_point(stat='identity')

### Changing the values
#### First atempt
skam.long <- Data_Skam %>% 
  select("Freq_2013_Procent","Freq_2014_Procent","Freq_2015_Procent","Freq_2016_Procent","Freq_2017_Procent","Freq_2018_Procent","Freq_2019_Procent","Name") %>% 
  pivot_longer(-Name,names_to = "Years", values_to = "Percentage")

ggplot(skam.long,aes(x=Years,y=Percentage,color=Name))+
  geom_line(stat='identity')+
  geom_point(stat='identity')

#### Second atempt
##### We were not happy with the names on the x-axis, so changed them to just being the year
skam.test<- DM_Skam_Dataset_Ark1 %>% 
  select("2013","2014","2015","2016","2017","2018","2019","Name") %>% 
  pivot_longer(-Name,names_to = "Years", values_to = "Percentage")

ggplot(skam.test,aes(x=Years,y=Percentage,color=Name))+
  geom_line(stat='identity')+
  geom_point(stat='identity')


