###------------- Creating basic functions
# Create a function pow_two()
pow_two <- function(x){
  x^2
}


# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs<- function(x,y){
  abs(x+y)
}


# Use the function
sum_abs(-2,3)

# Creating a function with an optional argument
my_fxn<-function(x=1){
  x
}
my_fxn()


###------------- Creating functions with no agruments


# Define the function hello()
hello <- function(){
  print("Hi there!")
  TRUE
}


# Call the function hello()
hello()


###------------- Creating functions with default argument
# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if(print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  } 
  return(y)
}

pow_two(2, FALSE)
pow_two(2, TRUE)

###------------- Some more functions using vectors
linkedin<-c(16,9,13,5,2,17,14)
linkedin
facebook<-c(17,7,5,16,8,13,14)
facebook
# The linkedin and facebook vectors have already been created for you
linkedin
facebook

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    num_views
  } else {
    print("Try to be more visible!")
    0
  }
}
# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])

###------------- Complex function which uses fuction within a function
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum=TRUE) {
  count <- 0
  
  for (v in views) {
    count<- count+interpret(v)
  }
  
  if (return_sum) {
    return(count)
  } else {
    return(NULL)
  }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)

###------------- Loading packages and running package related functions

mtcars
# Load the ggplot2 package
library("ggplot2")

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()
