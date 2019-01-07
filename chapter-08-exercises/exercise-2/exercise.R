# Exercise 2: using `*apply()` functions

# Create a *list* of 10 random numbers. Use the `runif()` function to make a 
# vector of random numbers, then use `as.list()` to convert that to a list

?runif
?as.list
num_list<-as.list(runif(10,1,100))
num_list

# Use `lapply()` to apply the `round()` function to each number, rounding it to 
# the nearest 0.1 (one decimal place)

num_list_rounded<-lapply(num_list,round,1)
num_list_rounded

# Create a variable 'sentence' that contains a sentence of text (something 
# longish). Make the sentence lowercase; you can use a function to help.

sentence<-"It is a very cold day today, the coldest in a while."
sentence<-str_to_lower(sentence)
sentence

# Use the `strsplit()` function to split the sentence into a vector of letters.
# Hint: split on `""` to split every character
# Note: this will return a _list_ with 1 element (which is the vector of letters)

?strsplit
char_list<-strsplit(sentence,"")
char_list
# Extract the vector of letters from the resulting list
vec_letters<-char_list[[1]]
vec_letters

# Use the `unique()` function to get a vector of unique letters
?unique
vec_unique<-unique(vec_letters)
vec_unique

# Define a function `count_occurrences` that takes in two parameters: a letter 
# and a vector of letters. The function should return how many times that letter
# occurs in the provided vector.
# Hint: use a filter operation!

count_occurences<-function(letter,many){
  length(many[many==letter])
}

# Call your `count_occurrences()` function to see how many times the letter 'e'
# is in your sentence.

count_occurences("e",vec_letters)

# Use `sapply()` to apply your `count_occurrences()` function to each unique 
# letter in the vector to determine their frequencies.
# Convert the result into a list (using `as.list()`).

list_frequencies<-as.list(sapply(vec_letters,count_occurences,vec_letters))
?sapply

# Print the resulting list of frequencies
print(list_frequencies)
