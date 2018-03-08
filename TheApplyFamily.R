###-------------- Using lapply basic

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")
split_math
# Convert to lowercase strings: split_low
split_low <- lapply(split_math,tolower)

# Take a look at the structure of split_low
str(split_low)

###-------------- Using lapply to user created functions

# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names<- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x){
  x[2]
}

# Apply select_second() over split_low: years
years<- lapply(split_low,select_second)

###-------------- Using lapply on anonymous functions

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) { x[1] })
# Transform: use anonymous function inside lapply

years <- lapply(split_low, function(x) { x[2] })

###-------------- Using lapply with additional arguments
# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names<-lapply(split_low, select_el, index=1)
years<-lapply(split_low, select_el, index=2)

###-------------- Using sapply
one<-c(3,7,9,6,-1)
two <- c(6,9,12,13,5)
three<-c(4,8,3,-1,-3)
four<-c(1,4,7,2,-2)
five<-c(5,7,9,4,2)
six<-c(-3,5,8,9,4)
seven<-c(3,6,9,4,1)
temp<-list(one,two,three,four,five,six,seven)
temp
# temp is a list containing the following data
# List of 7
#$ : num [1:5] 3 7 9 6 -1
#$ : num [1:5] 6 9 12 13 5
#$ : num [1:5] 4 8 3 -1 -3
#$ : num [1:5] 1 4 7 2 -2
#$ : num [1:5] 5 7 9 4 2
#$ : num [1:5] -3 5 8 9 4
#$ : num [1:5] 3 6 9 4 1
# temp has already been defined in the workspace
str(temp)
# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)


###-------------- Using sapply on user defined functions

# temp is already defined in the workspace

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp,extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp,extremes_avg)

###-------------- Using sapply for function returning a vector
# temp is already available in the workspace

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp,extremes)

# Apply extremes() over temp with lapply()
lapply(temp,extremes)

###-------------- Case where lapply and sapply are same

# temp is already prepared for you in the workspace

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s<-sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l<-lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_l,freezing_s)


###-------------- When functions return null value
# temp is already available in the workspace

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp,print_info)

# Apply print_info() over temp using lapply()
lapply(temp,print_info)


###-------------- Vapply basic
# temp is already available in the workspace

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp,basics,numeric(3))


###---- Vapply basic - returned values of functions must correspond with values defined in vapply
# temp is already available in the workspace

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))


###-------------- Converting sapply to vapply

# temp is already defined in the workspace

# Convert to vapply() expression
#sapply(temp, max)
vapply(temp,max,numeric(1))
# Convert to vapply() expression
#sapply(temp, function(x, y) { mean(x) > y }, y = 5)
vapply(temp, function(x,y){mean(x)>y}, y=5, logical(1))



