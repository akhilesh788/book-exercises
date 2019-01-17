# Exercise 2: working with `dplyr`
# Note that this exercise repeats the analysis from Exercise 1, but should be 
# performed using `dplyr` (do not directly access or manipulate the data frames)

# Install and load the "fueleconomy" package
#install.packages("devtools")
install.packages("devtools")
#devtools::install_github("hadley/fueleconomy")
devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Install and load the "dplyr" library

install.packages("dplyr")
library("dplyr")

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable

vehicles_make<-select(vehicles,make)
vec1<-vehicles_make$make
vec1
# Use the `distinct()` function to determine how many different car manufacturers
# are represented by the data set

?distinct
distinct_makes<-distinct(vehicles_make)
View(distinct_makes)
nrow(distinct_makes)
# Filter the data set for vehicles manufactured in 1997

View(vehicles)
vehicles_1997<-filter(vehicles,year==1997)
View(vehicles_1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
arranged_hwy<-arrange(vehicles_1997,hwy)
View(arranged_hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car

average_vehicles_1997<-mutate(vehicles_1997,average=(hwy+cty)/2)
View(average_vehicles_1997)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.

filtered_vehicles<-filter(vehicles,drive=="2-Wheel Drive",cty>20)
View(filtered_vehicles)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.

filtered_vehicles_2<-filter(filtered_vehicles,hwy==min(hwy))
View(filtered_vehicles_2)

# Write a function that takes a `year_choice` and a `make_choice` as parameters,
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!

efficiency_by_year_make3<-function(year1,make1){
  
    vehicles %>% 
    filter(year==year1,make==make1) %>% 
    filter(hwy==max(hwy)) %>% 
    select(model) 
  
}

efficient_model<-efficiency_by_year_make3(1984,"AM General")
efficient_model


# What was the most efficient Honda model of 1995?


print(efficiency_by_year_make2(1995,"Honda"))
