# Exercise 1: creating and accessing lists

# Create a vector `my_breakfast` of everything you ate for breakfast

my_breakfast<-c("Pohe","Upma","Wada Pav","Misal","Tea")

# Create a vector `my_lunch` of everything you ate (or will eat) for lunch

my_lunch<-c("Tondli bhaaji","Amti","Rice","Koshimbir","Roti")


# Create a list `meals` that has contains your breakfast and lunch

meals<-list(my_breakfast=my_breakfast , my_lunch=my_lunch)
meals$my_breakfast

# Add a "dinner" element to your `meals` list that has what you plan to eat 
# for dinner

meals[["dinner"]]<-c("Bhel","Samosa","Anda Bhurji")
meals$dinner
meals
# Use dollar notation to extract your `dinner` element from your list
# and save it in a vector called 'dinner'

dinner<-meals$dinner
dinner

# Use double-bracket notation to extract your `lunch` element from your list
# and save it in your list as the element at index 5 (no reason beyond practice)

lunch<-meals[["my_lunch"]]
lunch
meals[[5]]<-lunch
meals

# Use single-bracket notation to extract your breakfast and lunch from your list
# and save them to a list called `early_meals`

early_meals<-meals[c(1,2)]
early_meals

### Challenge ###

# Create a list that has the number of items you ate for each meal
# Hint: use the `lappy()` function to apply the `length()` function to each item

items_number<-lapply(meals,length)
items_number

# Write a function `add_pizza` that adds pizza to a given meal vector, and
# returns the pizza-fied vector

add_pizza<-function(meal_vec){
  meal_vec[length(meal_vec)+1]<-"Pizza"
  meal_vec
}

v1<-c("a","b","c")
v2<-add_pizza(v1)
v2
v1

# Create a vector `better_meals` that is all your meals, but with pizza!

better_meals<-lapply(meals,add_pizza)
better_meals









