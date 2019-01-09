# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)

scores<-c(40,50,60,70)

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season

allowed<-c(10,20,30,40)

# Combine your two vectors into a dataframe called `games`

games<-data.frame(scores,allowed,stringsAsFactors = FALSE)
games
# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!

games$diff<-games$scores-games$allowed
games

# Create a new column "won" which is TRUE if the Seahawks won the game

games[["Won"]]<-scores>allowed
games

# Create a vector of the opponent names corresponding to the games played

games$Oppenents<-c("aa","bb","cc","dd")
games

# Assign your dataframe rownames of their opponents

rownames(games)<-games$Oppenents
games

# View your data frame to see how it has changed!
View(games)
