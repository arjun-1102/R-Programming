###--------------------- Basics revisit
###------------------------ Grade analysis in R
## me, other_199, and previous_4 are available in your workspace
## me- contains grade
## other_199 contains grade of other students for this year
## previous_4 is a matrix which contains the grades for the last 4 years
me<-89
other_199 <-c(66,81,77,90,95,54,78,90,80,71,96,70,81,71,60,91,62
               ,54,70,96,90,82,78,100,79,84,79,73,66,63,97,91,82,81,52
               ,73,89,70,69,60,63,78,77,73,64,62,61,72,64,87,54,80,82
               ,61,70,69,61,88,90,74,80,59,75,65,83,70,83,83,81,80,88
               ,77,84,50,73,70,74,75,71,60,62,80,78,81,60,80,99,90,90
               ,66,61,79,71,80,69,67,80,59,72,76,74,70,74,96,73,90,92
               ,75,77,63,94,67,56,95,85,63,80,96,72,77,79,69,68,70,73
               ,99,64,59,63,82,76,90,80,86,77,80,84,80,99,80,68,77,51
               ,67,86,60,61,57,62,86,86,75,75,62,60,75,71,70,70,70,75
               ,72,79,74,72,78,87,70,77,64,77,67,88,87,80,76,73,78,89
               ,72,86,68,84,64,73,73,64,70,92,91,65,69,99,76,94,72,77
               ,80,64)

## temp<-c(82, 89, 53, 70, 66, 89, 66, 76, 66, 65, 85, 73, 86, 79, 65, 64, 76, 83, 75, 56, 74, 73, 69, 71, 56, 79, 98, 96, 80, 87, 66, 78, 71, 59, 100, 77, 69, 77, 76, 99, 69, 84, 70, 89, 72, 75, 89, 56, 68, 70, 60, 92, 63, 63, 52, 73, 83, 74, 80, 85, 55, 70, 84, 71, 87, 61, 95, 67, 79, 85, 68, 75, 75, 75, 92, 65 100, 72, 78, 90, 61, 53, 55, 87, 70, 80, 69, 91, 66, 80, 64, 77, 90, 85, 95, 81, 85, 75, 71, 99, 56, 77, 55, 98, 73, 89, 80, 59, 72, 73, 70, 73, 81, 72, 63, 56, 86, 68, 80, 70, 60, 74, 73, 97, 88, 85, 93, 50, 77, 81, 62, 71, 80, 76, 80, 75, 57, 90, 90, 95, 69, 66, 61, 89, 73, 87, 64, 88, 61, 61, 75, 93, 50, 73, 92, 88, 67, 60, 100, 74, 98, 68, 76, 61, 80, 70, 85, 96, 82, 84, 97, 97, 69, 90, 67, 82, 89, 68, 72, 64, 74, 74, 60, 85, 89, 88, 89, 71, 73, 93, 91, 87, 67, 66, 60, 51, 67, 79, 73, 68, 90, 83, 87, 65, 68, 77, 92, 79, 64, 78, 71, 96, 85, 66, 72, 99, 70, 56, 82, 94, 78, 66, 90, 80, 96, 77, 63, 71, 69, 99, 70, 94, 74, 91, 56, 64, 71, 67, 75, 59, 55, 63, 79, 86, 62, 87, 62, 70, 56, 78, 98, 55, 83, 70, 63, 87, 65, 68, 88, 75, 76, 84, 66, 83, 83, 70, 58, 72, 77, 65, 73, 69, 78, 85, 67, 63, 52, 70, 80, 80, 75, 99, 69, 85, 55, 60, 52, 67, 50, 100, 77, 60, 58, 77, 60, 70, 68, 92, 70, 82, 94, 82, 76, 82, 90, 79, 84, 90, 67, 89, 98, 51, 70, 50, 62, 92, 58, 64, 70, 86, 80, 87, 79, 85, 93, 63, 90, 62, 65, 99, 88, 90, 73, 73, 60, 90, 64, 85, 67, 68, 56, 82, 75, 98, 73, 62, 80, 93, 57, 64, 77, 80, 65, 84, 69, 75, 56, 77, 72, 70, 83, 71, 68, 66, 72, 87, 54, 87, 61, 58, 90, 100, 58, 70, 79, 90, 56, 87, 65, 85, 92, 60, 71, 76, 99, 90, 83, 100, 68, 68, 68, 52, 61, 55, 60, 75, 60, 85, 77, 56, 97, 96, 79, 74, 96, 79, 62, 91, 51, 80, 69, 84, 95, 71, 52, 81, 90, 59, 64, 89, 89, 80, 77, 89, 72, 70, 89, 80, 67, 79, 80, 70, 50, 75, 71, 88, 80, 84, 60, 77, 74, 77, 77, 59, 72, 70, 89, 50, 70, 59, 77, 56, 88, 74, 82, 83, 56, 73, 90, 88, 79, 90, 73, 77, 98, 69, 72, 95, 51, 80, 50, 90, 66, 94, 50, 83, 79, 57, 80, 75, 53, 99, 61, 78, 53, 73, 76, 76, 72, 80, 89, 55, 66, 74, 91, 73, 87, 54, 65, 82, 61, 77, 86, 92, 54, 84, 92, 90, 70, 79, 62, 71, 54, 53, 87, 86, 77, 89, 97, 66, 60, 73, 52, 73, 88, 83, 76, 86, 71, 85, 65, 64, 90, 79, 80, 71, 51, 99, 71, 80, 74, 54, 69, 95, 74, 90, 74, 69, 86, 78, 98, 82, 90, 70, 79, 84, 80, 79, 75, 84, 68, 70, 50, 53, 75, 98, 80, 97, 63, 60, 66, 78, 78, 70, 55, 76, 65, 70, 85, 80, 73, 92, 75, 61, 70, 86, 78, 70, 69, 59, 97, 78, 72, 73, 58, 70, 65, 98, 86, 79, 88, 72, 74, 76, 65, 76, 70, 86, 67, 62, 67, 69, 76, 82, 68, 95, 68, 77, 58, 55, 88, 78, 80, 74, 69, 84, 73, 96, 83, 82, 74, 86, 76, 78, 67, 57, 75, 76, 54, 79, 51, 51, 62, 70, 66, 55, 76, 80, 61, 82, 66, 73, 58, 94, 83, 84, 73, 62, 72, 67, 80, 81, 82, 89, 96, 81, 66), 88, 61, 73, 66, 85, 52, 99, 75, 64, 74, 80, 84, 70, 72, 77, 81, 77, 76, 80, 70, 72, 78, 79, 99, 55, 54, 84, 84, 77, 80, 76, 98, 72, 79, 84, 64, 73, 66, 88, 68, 86, 94, 75, 76, 94, 63, 52, 74, 50, 74, 82, 90, 71, 67, 73, 99, 80, 84, 76, 69, 74, 93, 99, 100, 94, 70, 73, 51, 90, 94, 70, 81, 84, 79, 75, 99, 88, 60, 67, 70, 100, 60, 70, 62, 66, 70, 83, 52, 68, 60, 88, 70, 62, 63, 83, 70, 71, 68, 78, 73, 60, 72, 57, 80, 67, 90, 87, 64, 88, 96, 63, 73, 78, 61, 60, 98, 87, 66, 76, 74, 78, 70, 76, 61, 86, 61, 77, 70, 76, 63, 78, 80, 94)
previous_4<-matrix( , byrow=TRUE, nrow=200)
# Merge me and other_199: my_class
my_class<-c(me,other_199)
my_class
# cbind() my_class and previous_4: last_5
last_5<-cbind(my_class,previous_4)

# Name last_5 appropriately
nms <- paste0("year_", 1:5)
colnames(last_5)<-nms
last_5

###------------------------ Exploring the data
# me, my_class and last_5 are available in your workspace

# Build histogram of my_class
hist(my_class)

# Generate summary of last_5
summary(last_5)

# Build boxplot of last_5
boxplot(last_5)

###------------------------ Basic queries
# me, my_class and last_5 are preloaded
# Is your grade equal to 72?
me==72


# Which grades in your class are higher than 75?
my_class>75

# Which grades in the last 5 years are below or equal to 64?
last_5<=64

###------------------------ Building aggregates
# me, my_class and last_5 are preloaded

# How many grades in your class are higher than 75?
sum(my_class>75)

# How many students in your class scored strictly higher than you?
sum(my_class>me)

# What's the proportion of grades below or equal to 64 in the last 5 years?
mean(last_5<=64)
###------------------------ Logical operators
#and& or| not !

# me, my_class and last_5 are preloaded

# Is your grade greater than 87 and smaller than or equal to 89?
me>87 & me<=89

# Which grades in your class are below 60 or above 90?
my_class<60 | my_class>90

###------------------------ Building aggregates 2
# me, my_class and last_5 are preloaded

# What's the proportion of grades in your class that is average?
mean(my_class>=70 &  my_class<=85)

# How many students in the last 5 years had a grade of 80 or 90?
sum(last_5==90 | last_5==80)
###------------------------If else practice
# me, my_class and last_5 are preloaded

# Define n_smart
n_smart<-sum(my_class>=80)

# Code the if-else construct
if (n_smart>50){
  print("smart class")
} else{
  print("rather average")
}
### Code it if-elseif-else construct
# me, my_class and last_5 are preloaded

# Define prop_less
prop_less<- mean(my_class<me)

# Code the control construct
if(prop_less>0.9){
  print("you're among the best 10 percent")
}else if(prop_less>0.8){
  print("you're among the best 20 percent")
}else{
  print("need more analysis")
}

###------------------------ embedded if else construct
# me, my_class and last_5 are preloaded

# Embedded control structure: fix the error
if (mean(my_class) < 75) {
  if (mean(my_class) > me) {
    print("average year, but still smarter than me")
  } else {
    print("average year, but I'm not that bad")
  }} else {
    if (mean(my_class) > me) {
      print("smart year, even smarter than me")
    } else {
      print("smart year, but I am smarter")
    }
  }

###------------------------ Controls and operators
# me, my_class and last_5 are preloaded

# Create top_grades
top_grades<-my_class[my_class>=85]

# Create worst_grades
worst_grades<-my_class[my_class<65]

# Write conditional statement
if(length(top_grades)>length(worst_grades)){
  print("top grades prevail")
}


###------------------------ Scanning logs in R

# logs is already available in your workspace
logs
# Print the structure of logs
str(logs)


# Use list subsetting to print the details part of 11th logs entry
logs[11]

# Print the class of the timestamp component of the first entry
class(logs[[1]]$timestamp)

###------------------------- Basic while loop
# logs is available in your workspace

# Initialize the iterator i to be 1
i<-1

# Code the while loop
while ( logs[[i]]$success==TRUE ) {
  print(i)
  i<-i+1
}

###------------------------ While loop advanced
# logs is available in your workspace

# Adapt the while loop
i <- 1
while (logs[[i]]$success==TRUE) {
  print(logs[[i]]$details$message)
  i <- i + 1
}

###------------------------ While loop advanced
# logs is available in your workspace

# Initialize i and found
i <- 1
found <- FALSE

# Code the while loop
while (found==FALSE) {
  if (logs[[i]]$details$location=="waste" && logs[[i]]$success==FALSE) {
    print("found")
    found<-TRUE
  } else {
    print("still looking")
    i<-i+1  
  }
  
}
###------------------------ For loop basic
# logs is available in your workspace

# Code a for loop that prints the timestamp of each log
for (log in logs) {
  print(log$timestamp)
}

#alt
for(i in 1:length(logs)){
  print(logs[[i]]$timestamp)
}

###------------------------ Advanced for loop 
# logs is available in your workspace

# Make the printout conditional: only if success
for (log in logs) {
  if(log$success==TRUE){
    print(log$timestamp)  
  }
  
}

###------------------------ Advacned for loop
## Conversion of timestamp to date object

# logs is available in your workspace
str(logs)
# Finish the for loop: add date element for each entry
for (i in 1:length(logs)) {
  logs[[i]]$date <- as.Date(logs[[i]]$timestamp)
}

# Print first 6 elements in logs
head(logs)

###------------------------ Advanced for loop - Collecting all failures
# logs is available in your workspace

# Intialize empty list: failures
failures <- list()

# Finish the for loop: add each failure to failures
for (log in logs) {
  if (log$success==FALSE) {
    failures <- c(failures, list(log))
  }
}

# Display the structure of failures
str(failures)

###------------------------ Using functions

# logs is available in your workspace

# Call max() on timestamps
max(timestamps)

# What is the date of the latest timestamp?
as.Date(max(timestamps))

###------------------------ Using functions with optional arguments
# A faulty version of timestamps is available in your workspace


# Print out timestamps
timestamps

# Call max() on timestamps, no additional arguments- Returns NA
max(timestamps)

# Call max() on timestamps, specify na.rm -> Returns Value and ignores NA
max(timestamps, na.rm=TRUE)

###------------------------ using loops inside functions
# logs is available in your workspace

# Build a function extract_info(): use for loop, add return statement
extract_info <- function(x) {
  info <- c()
  for (log in x) {
    info <- c(info, log$timestamp)
  }
  return(info)
}

# Call extract_info() on logs
extract_info(logs)

###------------------------ additional arguments in functions
# Adapt the extract_info() function.
extract_info <- function(x, property) {
  info <- c()
  for (log in x) {
    info <- c(info, log[[property]])
  }
  return(info)
}

# Call extract_info() on logs, set property to "timestamp"
extract_info(logs, property = "timestamp")

# Call extract_info() on logs, set property to "success"
extract_info(logs, property = "success")

###------------------------specifying agrument defaults in function definitio
# logs is available in your workspace

# Add default value for property argument
extract_info <- function(x, property="success") {
  info <- c()
  for (log in x) {
    info <- c(info, log[[property]])
  }
  return(info)
}

# Call extract_info() on logs, don't specify property
extract_info(logs)

# Call extract_info() on logs, set property to "timestamp"
extract_info(logs, property="timestamp")

##---- default property value of success will be overwritten

###------------------------ Fuctions with arguments advanced
# logs is available in your workspace

# Adapt extract_info():
# - add argument with default value
# - change function body
extract_info <- function(x, property = "success", include_all = TRUE) {
  info <- c()
  for (log in x) {
    
    # add if construct around the line below
    if(include_all || !log$success){
      info <- c(info, log[[property]])  
    }
  }
  return(info)
}

###------------------------ Extracting information very advanced
# logs is available in your workspace

# Defition of the extract_info() function
extract_info <- function(x, property = "success", include_all = TRUE) {
  info <- c()
  for (log in x) {
    if (include_all || !log$success) {
      info <- c(info, log[[property]])
    }
  }
  return(info)
}

# Generate vector of messages
extract_info(logs, property = c("details", "message"))

# Generate vector of locations for failed log entries
extract_info(logs, property = c("details", "location"), include_all = FALSE)

###------------------------ Extracting informaiton function loop advanced
# logs is available in your workspace

# Write the function compute_fail_pct
compute_fail_pct <- function(x) {
  fail_count <- 0
  for (log in x) {
    if (!log$success) {
      fail_count <- fail_count + 1
    }
  }
  pct <- fail_count / length(x) * 100
  return(pct)
}

# Call compute_fail_pct on logs
compute_fail_pct(logs)

####------------------------------ The apply family

###------------------------ lapply basic
# logs is available in your workspace
str(head(logs))
# Call length() on each element of logs
lapply(logs,length)

# Call class() on each element of logs
lapply(logs,class)

###------------------------lapply to get timestamp of logs
# logs is available in your workspace

# Define get_timestamp()
get_timestamp <- function(x) {
  return (x$timestamp)
}

# Apply get_timestamp() over all elements in logs
lapply(logs, get_timestamp)

###------------------------ using lapply as anonymous
# logs is available in your workspace

# Have lapply() use an anonymous function
lapply(logs, function(x){x$timestamp})

###------------------------using lapply with reference
###x <- list(a = 1, b = 2, c = 3)
###x[["a"]]
###`[[`(x, "a")

# logs is available in your workspace

# Replace the anonymous function with `[[` 
lapply(logs, '[[', "timestamp")

###------------------------ sapply basics
## sapply applies an lapply on the vector and then converts it into an array
# logs is available in your workspace

# Call length() on each element of logs using sapply()
sapply(logs,length)

# Definition of get_timestamp
get_timestamp <- function(x) {
  x$timestamp
}

# Get vector of log entries' timestamps
sapply(logs,get_timestamp)

###------------------------sapply on logs advanced
# logs is available in your workspace

# Use sapply() to select the success element from each log: results
results<- sapply(logs, '[[', "success")

# Call mean() on results
mean(results)

# Use sapply() to select the details element from each log
sapply(logs, '[[', "details")

###------------------------ sapply on logs
# logs is available in your workspace

# Implement function get_failure_loc
get_failure_loc <- function(x) {
  if (x$success) {
    return(NULL)
  } else {
    return(x$details$location)
  }
}

# Use sapply() to call get_failure_loc on logs
sapply(logs, get_failure_loc)

###------------------------vapply
## vapply is used when we explicitly define the return type of the apply function. 
## vapply = safer version of sapply

# logs is available in your workspace

# Convert the sapply call to vapply
vapply(logs, length, FUN.VALUE=integer(1))

# Convert the sapply call to vapply
vapply(logs, `[[`, "success", FUN.VALUE=logical(1))

###------------------------ vapply advanced
# logs is available in your workspace

# Convert the sapply() call to a vapply() or lapply() call
vapply(logs, `[[`, c("details", "message"), FUN.VALUE=character(1))

# Convert the sapply() call to a vapply() or lapply() call
lapply(logs, function(x) { x$details })

###------------------------ vapply final
# logs is available in your workspace

# Return vector with uppercase version of message elements in log entries
extractCaps<- function (x){
  return (toupper(x$details$message))
}
vapply(logs, extractCaps, character(1))

