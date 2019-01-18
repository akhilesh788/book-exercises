# Exercise 7: using dplyr on external data

# Load the `dplyr` library
library("dplyr")

# Use the `read.csv()` function to read in the included data set. Remember to
# save it as a variable.
getwd()
df1<-read.csv("data/nba_teams_2016.csv",stringsAsFactors = FALSE)
View(df1)

# View the data frame you loaded, and get some basic information about the 
# number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" following
# the names of teams that made it to the playoffs that year.
ncol(df1)
nrow(df1)
dim(df1)
head(df1)

# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team

df1<-mutate(df1,TOV_to_STL = TOV/STL)
View(df1)


# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest turnover/steal ratio?

df1<-arrange(df1,TOV_to_STL)
View(df1)
df1[df1$TOV_to_STL==min(df1$TOV_to_STL,na.rm=TRUE),"Team"]

# Using the pipe operator, create a new column of assists per game (AST / G) 
# AND sort the data.frame by this new column in descending order.

df1 %>% 
  mutate(AST_per_G = AST/G) %>% 
  arrange(-AST_per_G)->df1

View(df1)

# Create a data frame called `good_offense` of teams that scored more than 
# 8700 points (PTS) in the season

good_offense<-filter(df1,PTS>8700)
View(good_offense)

# Create a data frame called `good_defense` of teams that had more than 
# 470 blocks (BLK)

good_defense<-filter(df1,BLK>470)
View(good_defense)


# Create a data frame called `offense_stats` that only shows offensive 
# rebounds (ORB), field-goal % (FG.), and assists (AST) along with the team name.

offense_stats<-select(df1,Team,ORB,FG,AST)
View(offense_stats)

# Create a data frame called `defense_stats` that only shows defensive 
# rebounds (DRB), steals (STL), and blocks (BLK) along with the team name.

defense_stats<-select(df1,Team,DRB,STL,BLK)
View(defense_stats)

# Create a function called `better_shooters` that takes in two teams and returns
# a data frame of the team with the better field-goal percentage. Include the 
# team name, field-goal percentage, and total points in your resulting data frame

better_shooters<-function(team1,team2){
  print(team1)
  print(team2)
  
  fg1<-df1[df1$Team==team1, "FG."]
  fg2<-df1[df1$Team==team2, "FG."]
#  max(fg1,fg2)
  df2<-df1[df1$Team==team1 | df1$Team==team2,]
  filter(df2,FG.==max(fg1,fg2)) %>% 
    select(Team,FG.,PTS)
  
}



# Call the function on two teams to compare them (remember the `*` if needed)

View(better_shooters("Phoenix Suns","Chicago Bulls"))

