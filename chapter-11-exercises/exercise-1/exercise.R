# Exercise 1: working with data frames (review)



# Install devtools package: allows installations from GitHub
install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
is.data.frame(vehicles)
makes_vector<-vehicles$make
makes

install.packages("dplyr")
library("dplyr")
?select
colnames(vehicles)
makes2<-select(vehicles,make)
View(makes2)
is.data.frame(makes2)
str(makes2)
makes2_vector<-makes2$make
makes2_vector[1:5]
# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
?unique
length(unique(makes))

# Filter the data set for vehicles manufactured in 1997
vehicles_1997<-vehicles[vehicles$year==1997,]
head(vehicles_1997)
View(vehicles_1997)

vehicles_1997_2<-filter(vehicles,year==1997)
View(vehicles_1997_2)

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/

?order

hwy_arranged_1997_vehicles<-vehicles_1997[order(vehicles_1997$hwy),]
View(hwy_arranged_1997_vehicles)

hwy_arranged_1997_vehicles_2<-arrange(vehicles_1997,hwy)
View(hwy_arranged_1997_vehicles_2)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car

vehicles_average<-mutate(vehicles_1997, average=((hwy+cty)/2))
View(vehicles_average)

vehicles_average_2<-vehicles_1997[]
vehicles_average_2$Average<-(vehicles_1997$hwy + vehicles_1997$cty)/2
View(vehicles_average_2)


# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.

vehicles_filtered_2<-filter(vehicles,drive=="2-Wheel Drive",cty>20)
View(vehicles_filtered_2)

vehicles_filtered_3<-vehicles[vehicles$drive=="2-Wheel Drive" & vehicles$cty>20,]
View(vehicles_filtered_3)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.

min_hwy<-filter(vehicles_filtered_2,hwy==min(hwy))
id_min_hwy<-select(min_hwy,id)
View(id_min_hwy)

min_hwy_2<-vehicles_filtered_2[vehicles_filtered_2$hwy==min(vehicles_filtered_2$hwy),"id"]
View(min_hwy_2)


# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!

efficiency_by_year_make<-function(year1,make1){
  
  vehicles %>% 
  filter(year==year1,make==make1) %>% 
  filter(hwy==max(hwy)) %>% 
  select(model) 
  
}

efficient_model<-efficiency_by_year_make(1984,"AM General")
efficient_model



# What was the most efficient Honda model of 1995?

print(efficiency_by_year_make(1995,"Honda"))
