#install packages
install.packages("tidyverse")
install.packages("cluster")
install.packages("fpc")

#load libraries
library(tidyverse)
library(cluster)
library(fpc)

# Set Working Directory
setwd("/cloud/project/")

 
 #read in datafile
 data <- read.csv("WA_Fn_UseC_HR.Employee.Attrition")
 View(data)
 
 #1) Scale the data and set the random seed to 42
 set.seed(42)
 
 # Scale the data
 df_scaled <- df %>%

 #Create a data frame with only required variables - Age, MonthlyIncome, PercentSalaryHike, YearsAtCompany
 filtered_data <- data[ Age,MonthlyIncome, PercentSalaryHike, YearsAtCompany ]
 View(quantdf)
 
 # Function to calculate total within-cluster sum of square
 calculate_wss <- function(data, max_clusters = 15) {
   wss_values <- numeric(max_clusters)
   
   for (k in 2:max_clusters) {
     set.seed(42)
     k_means_model <- kmeans(data, centers = k, nstart = 10)
     wss_values[k] <- k_means_model$tot.withinss
   }
   
   return(wss_values)
 }
 
 # Calculate WSS for 2 to 15 clusters
 wss_values <- calculate_wss(df_scaled, max_clusters = 15)
 
 # Plot WSS against number of clusters
 plot(2:15, wss_values[-1], type = "b", xlab = "Number of clusters", ylab = "Within-cluster sum of squares",
      main = "Elbow method for determining optimal number of clusters")
 
