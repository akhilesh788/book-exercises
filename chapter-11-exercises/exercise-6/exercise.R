# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already

library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
View(flights)
group_by(flights,dest) %>% 
  summarise(avg_arrival_delay = mean(arr_delay, na.rm = TRUE))->df1

View(df1)
df_all<-left_join(df1,airports,by=c("dest"="faa"))
View(df_all)
df_all<-arrange(df_all,-avg_arrival_delay)
View(df_all)
View(select(df_all,avg_arrival_delay,name))
View(filter(df_all,avg_arrival_delay==max(avg_arrival_delay, na.rm=TRUE)))

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

View(airlines)

flights %>% 
  group_by(carrier) %>% 
  summarise(avg_arr_delay = mean(arr_delay,na.rm=TRUE)) ->by_carrier
df_3<-left_join(by_carrier,airlines,by="carrier")
View(df_3)
df_3<-arrange(df_3,-avg_arr_delay)
View(df_3)