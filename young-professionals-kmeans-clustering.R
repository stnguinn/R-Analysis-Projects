#install packages
install.packages("tidyverse")
install.packages("cluster")
install.packages("fpc")

#load libraries
library(tidyverse)
library(cluster)
library(fpc)

#set working directory
setwd("cloud/project")

#read in datafile
magdf <-read.csv("young_professional_magazine.csv")
View(magdf)

#Create a data frame with only continuous variables - Age, 
#Value.of.Investments,Number.of.Transactions, Household.Income - 
#by removing columns 2, 3, 6, and 8
quantdf<-magdf[c(-2,-3,-6,-8)]
View(quantdf)

#normalize each variable
quantdfn<-scale(quantdf)
View(quantdfn)

#set random number seed in order to replicate the analysis
set.seed(42)

#create a function to calculate total within-cluster sum of squared deviations 
#to use in elbow plot
wss<-function(k){kmeans(quantdfn, k, nstart=10)} $tot.withinss

#range of k values for elbow plot
k_values<- 1:10

# run the function to create the range of values for the elbow plot
wss_values<-map_dbl(k_values, wss)

#create a new data frame containing both k_values and wss_values
elbowdf<- data.frame(k_values, wss_values)

#graph the elbow plot
ggplot(elbowdf, mapping = aes(x = k_values, y = wss_values)) +
  geom_line() + geom_point()

#run k-means clustering with 4 clusters (k=4) and 1000 random restarts
k4<-kmeans(quantdfn, 4, nstart=1000)

#display the structure of the 4-means clustering object
str(k4)

#display information on 4-means clustering
k4

#display cluster statistics
cluster.stats(dist(quantdfn, method="euclidean"), k4$cluster)

#combining each observation's cluster assignment with unscaled data frame
quantdfk4<-cbind(quantdf, clusterID=k4$cluster)
View(quantdfk4)

#write data frame to CSV file to analyze in Excel
write.csv(quantdfk4, "magazine_kmeans_4clusters.csv")

#calculate variable averages for all non-normalized observations
summarize_all(quantdf, mean)

#Calculate variable averages for each cluster
quantdfk4 %>%
  group_by(clusterID) %>%
  summarize_all(mean)
