# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)

vehicles_2015<-filter(vehicles, year==2015,make=="Acura")
View(vehicles_2015)
best<-filter(vehicles_2015,hwy==max(hwy))
View(best)
best_model<-select(best,model)
View(best_model)
print(best_model$model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)

vehicles %>% 
filter(year==2015,make=="Acura") %>% 
filter(hwy==max(hwy)) %>% 
select(model)->model_2
View(model_2)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)

select(filter((filter(vehicles,year==2015,make=="Acura")),hwy==max(hwy)),model)


### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times

func1<-function(){
  
  vehicles_2015<-filter(vehicles, year==2015,make=="Acura")
# View(vehicles_2015)
  best<-filter(vehicles_2015,hwy==max(hwy))
# View(best)
  best_model<-select(best,model)
  best_model$model[1]
  
}
func1()

func2<-function(){

  vehicles %>% 
    filter(year==2015,make=="Acura") %>% 
    filter(hwy==max(hwy)) %>% 
    select(model)->model_2
  model_2$model[1]
}

func2()

func3<-function(){
  
  select(filter((filter(vehicles,year==2015,make=="Acura")),hwy==max(hwy)),model)$model[1]
  
}
func3()

??fill
v1<-rep(func1(),1000)
v2<-rep(func2(),1000)
v3<-rep(func3(),1000)

