#Install Packages/Load libraries
install.packages("ggplot2")
install.packages("dplyr")
install.packages("forcats")
install.packages("lubridate")
install.packages("purrr")
install.packages("readr")
install.packages("stringr")
install.packages("tibble")
install.packages("tidyr")
library(ggplot2)
library(dplyr)
library(forcats)
library(lubridate)
library(purrr)
library(readr)
library(stringr)
library(tibble)
library(tidydr)

# Load data set/Look at head of data
weather_df = read.csv('Austin 2019-01-01 to 2023-07-22.csv')
head(weather_df)

#Summary of Dataset
summary(Austin_2019_01_01_to_2023_07_22)

# Sort the data frame in descending order based on tempmax
sorted_df <- weather_df[order(-weather_df$tempmax),]
sorted_df

#Select the top 10 rows (10 hottest days)
top_10_hottest_days <- head(sorted_df, 10)

# Create a new color gradient based on the temperature values
color_gradient <- colorRampPalette(c("orange", "red"))(n = length(top_10_hottest_days$tempmax))

# Reorder the levels of the datetime variable in descending order
top_10_hottest_days$datetime <- factor(top_10_hottest_days$datetime, levels = rev(top_10_hottest_days$datetime))

# Create the horizontal bar chart for the top 10 hottest days
ggplot(top_10_hottest_days, aes(y = datetime, x = tempmax, fill = tempmax)) +
  geom_bar(stat = "identity", color = "black", width = 0.8) +
  scale_fill_gradientn(colours = color_gradient, limits = range(top_10_hottest_days$tempmax)) +
  geom_text(aes(label = tempmax), position = position_nudge(x = 6), color = "black", size = 4) +
  labs(title = "Top 10 Hottest Days",
       y = "Date",
       x = "Temperature (°F)") +
  theme_minimal() +
  theme(axis.text.y = element_text(hjust = 1),
        plot.title = element_text(face = "bold", size = 16),
        axis.title = element_text(face = "bold", size = 14))

# Top 10 coldest days in Austin
#Reload Austin CSV
weather_df = read.csv('Austin 2019-01-01 to 2023-07-22.csv')

# Sort the data frame in ascending order based on tempmin
sorted_df_cold <- weather_df[order(weather_df$tempmin),]

#Select the top 10 rows (10 coldest days)
top_10_coldest_days <- head(sorted_df_cold, 10)

#View 10 coldest days
View(top_10_coldest_days)

# Load the library
library(ggplot2)

# Select the top 10 rows (10 coldest days)
top_10_coldest_days <- head(sorted_df_cold, 10)


# Ensure datetime is in the correct format
top_10_coldest_days$datetime <- as.Date(top_10_coldest_days$datetime, format = "%m/%d/%y")

# Create the plot
ggplot(top_10_coldest_days, aes(x = reorder(datetime, tempmin), y = tempmin, fill = tempmin)) +
  geom_col() +
  geom_text(aes(label = round(tempmin, 1)), hjust = -0.2, fontface = "bold") +
  coord_flip() +
  scale_fill_gradient(low = "lightblue", high = "blue") +
  labs(x = "Dates", y = "Temperature (F)", title = "Top 10 Coldest Days", fill = "Temperature") +
  theme_minimal() +
  theme(text = element_text(face = "bold"))

# How many days in Austin were equal too or greater than 45 degrees in a single year?

# install.packages("dplyr")   
library(dplyr)

# Step 2: Read the data from the CSV file into a data frame

weather_df <- read.csv('Austin 2019-01-01 to 2023-07-22.csv')

# Step 3: Convert the "datetime" column to a proper date format
weather_df$datetime <- as.Date(weather_df$datetime, format = "%m/%d/%y")

# Step 4: Extract the year from the datetime column
weather_df$year <- format(weather_df$datetime, "%Y")

# Step 5: Filter the data to include only days where tempmin is 45°F (7.2°C) or lower
cold_days <- weather_df %>%
  filter(tempmin <= 45)

# Step 6: Count the number of cold days for each year
yearly_cold_days <- cold_days %>%
  group_by(year) %>%
  summarize(num_days = n())

# Step 7: Display the number of cold days for each year
if (nrow(yearly_cold_days) > 0) {
  cat("Number of days with temp <= 45°F for each year in Austin:\n")
  print(yearly_cold_days)
} else {
  cat("There are no days with a temperature of 45°F or lower in the dataset.")
}

# Step 8: Create a horizontal bar chart using ggplot2
ggplot(yearly_cold_days, aes(x = num_days, y = year)) +
  geom_bar(stat = "identity", fill = "blue") +
  geom_text(aes(label = num_days), hjust = -0.2, color = "black", size = 4) +
  labs(title = "Number of Days in a Year with Temp <= 45°F in Austin",
       x = "Number of Days",
       y = "Year") +
  theme_minimal() +
  theme(text = element_text(family = "sans", face = "bold"))
