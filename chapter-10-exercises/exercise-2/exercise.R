# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"

emp<-paste("Employee",1:100)
emp

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000

?runif
salaries_vector<-runif(100,40000,50000)
salaries_vector

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.

adjustments<-runif(100,-5000,10000)
adjustments

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!

salaries<-data.frame(emp,salaries_vector,adjustments,stringsAsFactors = FALSE)
salaries


# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).

salaries$adjusted_salaries<-salaries$salaries_vector+salaries$adjustments
salaries


# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)

salaries$raise_or_not<-salaries$adjustments>0
head(salaries)


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)


# What was the 2018 salary of Employee 57
rownames(salaries)<-salaries$emp
head(salaries)

print(salaries["Employee 57","adjusted_salaries"])

# How many employees got a raise?
length(salaries$adjustments[salaries$adjustments>0])

# What was the dollar value of the highest raise?
max(salaries$adjustments)
max_raise<-max(salaries$adjustments)

# What was the "name" of the employee who received the highest raise?
salaries$emp[salaries$adjustments==max_raise]

# What was the largest decrease in salaries between the two years?
min(salaries$adjustments)
max_decrease<-min(salaries$adjustments)

# What was the name of the employee who recieved largest decrease in salary?

salaries$emp[salaries$adjustments==max_decrease]

# What was the average salary change?
mean(salaries$adjustments)

# For people who did not get a raise, how much money did they lose on average?
v1<-salaries[salaries$adjustments<0 , "adjustments"]
print(mean(v1))
## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
?write.csv
write.csv(salaries,"Salary_data2.csv",row.names = FALSE)
