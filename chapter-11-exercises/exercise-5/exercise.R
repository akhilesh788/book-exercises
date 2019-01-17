# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(flights)

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data

flights %>% 
  group_by(month) %>% 
  summarize(average_dep_delay = mean(dep_delay,na.rm = TRUE))->dep_delay_by_month
View(dep_delay_by_month)

# Which month had the greatest average departure delay?

max_avg_delay<-filter(dep_delay_by_month,average_dep_delay==max(average_dep_delay))
print(max_avg_delay)


# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function

plot(dep_delay_by_month)


# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows

dest_flights<-group_by(flights,dest)
View(dest_flights)
sum_dest<-summarise(dest_flights,avg_arrival_delay = mean(arr_delay,na.rm=TRUE))
View(sum_dest)
sum_dest_arranged<-arrange(sum_dest,-avg_arrival_delay)
View(sum_dest_arranged)
head(sum_dest_arranged)
# You can look up these airports in the `airports` data frame!
head(airports)
View(airports)
joined_df<-left_join(sum_dest_arranged,airports,by=c("dest"="faa"))
View(joined_df)
# Which city was flown to with the highest average speed?

flights %>% 
  mutate(avg_speed = distance/air_time) %>% 
  filter(avg_speed==max(avg_speed,na.rm=TRUE)) %>% 
  select(dest,year,month,day,avg_speed) %>% 
  View()
  







