# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`

install.packages("nycflights13")
library("nycflights13")
library("dplyr")

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)

nrow(flights)
ncol(flights)
colnames(flights)
head(flights)
View(flights)
dim(flights)
??flights

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).

flights_2<-mutate(flights,time_lost_in_flight=arr_delay-dep_delay)
View(flights_2)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)

flights_2_sorted<-arrange(flights_2,-time_lost_in_flight)
View(flights_2_sorted)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame

flights %>% 
  mutate(time_lost_in_flight=arr_delay-dep_delay) %>% 
  arrange(-time_lost_in_flight)->flights_3_sorted
View(flights_3_sorted)

# Make a histogram of the amount of time gained using the `hist()` function

?hist
hist(flights_3_sorted$time_lost_in_flight)


# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation

summarised_1<-summarise(flights_3_sorted, average_time_lost = mean(time_lost_in_flight, na.rm = TRUE))
View(summarised_1)


# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created

select(flights_3_sorted,origin,dest,origin,time_lost_in_flight) %>% 
  filter(dest=="SEA")->flights_sea
View(flights_sea)
hist(flights_sea$time_lost_in_flight)
# On average, did flights to SeaTac gain or loose time?
average_sea<-summarise(flights_sea,average_time_lost = mean(time_lost_in_flight, na.rm = TRUE))
View(average_sea)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!

flights %>% 
  filter(origin=="JFK",dest=="SEA") %>% 
  summarise(average = mean(air_time, na.rm = TRUE), maximum = max(air_time, na.rm = TRUE),minimum = min(air_time,na.rm = TRUE)) %>% 
  View()

  
  
  
  
  
  
  
  
  
  


