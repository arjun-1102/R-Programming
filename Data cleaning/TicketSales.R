###---------------- Data understanding

# Import sales.csv: sales
sales<- read.csv("sales.csv", stringsAsFactors = FALSE)

# View dimensions of sales
dim(sales)

# Inspect first 6 rows of sales
head(sales)

# View column names of sales
names(sales)

# Look at structure of sales
str(sales)

# View a summary of sales
summary(sales)

# Load dplyr
library(dplyr)


# Get a glimpse of sales
glimpse(sales)

###---- First column contians row numbers, it can be removed

# Remove the first column of sales: sales2
sales2<- sales[,-1]

###------ First four columns contain internal codes, last 15 columns contain missing values - We will keep only cols 5-30

# Define a vector of column indices: keep
keep<- c(5:30)

# Subset sales2 using keep: sales3
sales3<-sales2[,keep]

###----- Spliting column datetime into data and time columns for events and orders
## sales3 is pre-loaded in your workspace
head(sales3$event_date_time)
# Load tidyr
library(tidyr)

# Split event_date_time: sales4
sales4 <- separate(sales3,event_date_time,c("event_dt","event_time"), sep = " ")

# Split sales_ord_create_dttm: sales5
sales5<- separate(sales4, sales_ord_create_dttm, c("ord_create_dt","ord_create_time"), sep=" ")

###------- Addressing warnings in previous output
###---- reason is null/missing values in those positions
# Define an issues vector
issues<-c(2516,3863,4082,4183)

# Print values of sales_ord_create_dttm at these indices
sales3[issues,16]

# Print a well-behaved value of sales_ord_create_dttm
sales3[2517,16]

###--------- Converting data character strings to data types
## sales5 is pre-loaded

# Load stringr
library(stringr)

# Find columns of sales5 containing "dt": date_cols
date_cols <- str_detect(names(sales5), "dt")

# Load lubridate
library(lubridate)

# Coerce date columns into Date objects
sales5[, date_cols] <- lapply(sales5[, date_cols], ymd)

###----------- Counting the missing date values in each date column
## stringr is loaded

# Find date columns (don't change)
date_cols <- str_detect(names(sales5), "dt")

# Create logical vectors indicating missing values (don't change)
missing <- lapply(sales5[, date_cols], is.na)

# Create a numerical vector that counts missing values: num_missing
num_missing<-sapply(missing,sum)

# Print num_missing
num_missing

###---------- Combining city and state into single column
## tidyr is loaded

# Combine the venue_city and venue_state columns
sales6<-unite(sales5, venue_city_state, c(venue_city,venue_state), sep=", ", remove=TRUE)


# View the head of sales6
head(sales6)



