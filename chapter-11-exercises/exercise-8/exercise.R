# Exercise 8: exploring data sets

# Load the `dplyr` library
library("dplyr")

# Read in the data (from `data/pupulitzer-circulation-data.csv`). Remember to 
# not treat strings as factors!

df1<-read.csv("data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)
View(df1)

# View in the data set. Start to understand what the data set contains
# Print out the names of the columns for reference
colnames(df1)

# Use the 'str()' function to also see what types of values are contained in 
# each column (you're looking at the second column after the `:`)
# Did any value type surprise you? Why do you think they are that type?

str(df1)

# Add a column to the data frame called 'Pulitzer.Prize.Change` that contains 
# the difference in the number of times each paper was a winner or finalist 
# (hereafter "winner") during 2004-2014 and during 1990-2003

df1<-mutate(df1,Pulitzer.Prize.Change = Pulitzer.Prize.Winners.and.Finalists..2004.2014 - Pulitzer.Prize.Winners.and.Finalists..1990.2003)
View(df1)

# What was the name of the publication that has the most winners between 
# 2004-2014?

df2<-filter(df1,Pulitzer.Prize.Winners.and.Finalists..2004.2014==max(Pulitzer.Prize.Winners.and.Finalists..2004.2014,na.rm=TRUE))
View(df2)

# Which publication with at least 5 winners between 2004-2014 had the biggest
# decrease(negative) in daily circulation numbers?

remove_percent<-function(str_in){
  
  as.numeric(sub("%","",str_in))
  
}

#remove_percent("-31%")

df1 %>% 
  filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 >5)->df_main
  
v_main<-sapply(df_main$Change.in.Daily.Circulation..2004.2013,remove_percent)
v_main

df_main$Numeric_change<-v_main
View(df_main)

View(filter(df_main,Numeric_change==min(Numeric_change)))


# An important part about being a data scientist is asking questions. 
# Write a question you may be interested in about this data set, and then use  
# dplyr to figure out the answer!



#LOL
