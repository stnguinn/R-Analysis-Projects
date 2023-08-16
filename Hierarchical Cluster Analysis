#install packages
install.packages("tidyverse")
install.packages("cluster")
install.packages("fpc")
install.packages("factoextra")
install.packages("janitor")

#load libraries
library(tidyverse)
library(cluster)
library(fpc)
library(factoextra)
library(janitor)

#read in datafile
datadf <- read.csv("WA_Fn-UseC_-HR-Employee-Attrition.csv")
View(datadf)

#Create a data frame with only required variables - Age, MonthlyIncome, PercentSalaryHike, YearsAtCompany
required_data <- datadf[c("Age", "MonthlyIncome", "PercentSalaryHike", "YearsAtCompany")]
View(required_data
    
#normalize each variable
required_data<-scale(required_data)
View(required_data)

# Scale the data and set the random seed to 42
set.seed(42)

#calculate distance between each pair of observations using the dist function 
#and manhattan distance
match_dist<-dist(required_data, method="manhattan")

#run hierarchical clustering with the hclust function and group average linkage
cl_match_avg<-hclust(match_dist, method="average")

#plot the dendrogram
plot(cl_match_avg)

#Create 4 clusters using the cutree function
cl_match_avg_4<-cutree(cl_match_avg, k=4)

#display vector of cluster assignments for each observation
cl_match_avg_4

#visualize clusters on the dendrogram
rect.hclust(cl_match_avg, k=4, border=2:4)

#link cluster assignments to original categorical data frame
hcl4df<-cbind(required_data, clusterID=cl_match_avg_4)

#write data frame to CSV file to analyze in Excel
write.csv(hcl4df, "required_data")

# Install and load the dplyr package
install.packages("dplyr")  # Only needed if you haven't installed it yet
library(dplyr)

# Convert your data into a data frame or tibble
df <- as.data.frame(required_data)  

# Apply the group_by function to the appropriate column(s)
library(dplyr)  # Load the dplyr package for the group_by function
df <- df %>% group_by(Age, MonthlyIncome, PercentSalaryHike, YearsAtCompany)

summary(required_data)

# Perform hierarchical clustering
result <- hclust(dist(required_data))  # Replace 'data' with your actual dataset

# Cut the dendrogram to form clusters
clusters <- cutree(result, k = 4)  # Replace 'k' with the desired number of clusters

# Display the number of observations in each cluster
table(clusters)

# Calculate the average monthly income
average_income <- mean(required_data)

# Print the result
print(average_income)


