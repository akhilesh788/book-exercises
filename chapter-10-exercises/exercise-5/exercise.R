# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a 
# variable called `names`. Remember to NOT treat the strings as factors!

names<-read.csv("data/female_names.csv", stringsAsFactors = FALSE)

# Create a data frame `names_2013` that contains only the rows for the year 2013
View(names)
names_2013<-names[names$year==2013,]
View(names_2013)
is.data.frame(names_2013)
# What was the most popular female name in 2013?
names_2013[max(names_2013$prop)==names_2013$prop,"name"]

# Write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year

most_popular_in_year<-function(year){
  
  df_for_year<-names[names$year==year,]
  df_for_year[max(df_for_year$prop)==df_for_year$prop,"name"]
}
# What was the most popular female name in 1994?
most_popular_in_year(1994)

?n


# Write a function `number_in_million` that takes in a name and a year, and 
# returns statistically how many babies out of 1 million born that year have 
# that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.

number_in_million<-function(baby_name,year){
  
  df_year<-names[names$year==year,]
  View(df_year)
  proportion<-df_year[df_year$name==baby_name,"prop"]
  print(df_year[df_year$name==baby_name,"X"])
  proportion*1000000
}

# How many babies out of 1 million had the name 'Laura' in 1995?

number_in_million("Laura",1995)

# How many babies out of 1 million had your name in the year you were born?

number_in_million("Varun",1993)

library(dplyr)
?n

## Consider: what does this tell you about how easy it is to identify you with 
## just your name and birth year?
