###---------------- Cleaning data in R

###--------- Exploring the data

##------ Basic exploration - structure, col names, dimensions
# Check the class of bmi
class(bmi)

# Check the dimensions of bmi
dim(bmi)

# View the column names of bmi
names(bmi)

##------ dplyr - exploring structure using dplyr
library(dplyr)

# Check the structure of bmi
str(bmi)

# Load dplyr
library(dplyr)

# Check the structure of bmi, the dplyr way
glimpse(bmi)
# View a summary of bmi
summary(bmi)

##--------- Using head and tail to view the dataset
# Print bmi to the console
print(bmi)

# View the first 6 rows
head(bmi)

# View the first 15 rows
head(bmi, n=15)

# View the last 6 rows
tail(bmi)

# View the last 10 rows
tail(bmi, n=10)

##------- Using hist and plot to explore the data
# Histogram of BMIs from 2008
hist(bmi$Y2008)

# Scatter plot comparing BMIs from 1980 to those from 2008
plot(bmi$Y1980, bmi$Y2008)


###---------------------- Cleaning the data
##-- tidyr package

##------- Gather function - wide to long
# Apply gather() to bmi and save the result as bmi_long
bmi_long <- gather(bmi, year,bmi_val, -Country)

# View the first 20 rows of the result
head(bmi_long, n=20)

##----- Spread function - long to wide
# Apply spread() to bmi_long
bmi_wide <- spread(bmi_long, year, bmi_val)

# View the head of bmi_wide
head(bmi_wide)

##------- Separating column to two columns
# Apply separate() to bmi_cc
bmi_cc_clean <- separate(bmi_cc, col = Country_ISO, into = c("Country", "ISO"), sep = "/")

# Print the head of the result
head(bmi_cc_clean)

##---------- Uniting two columns to one 
# Apply unite() to bmi_cc_clean
bmi_cc <- unite(bmi_cc_clean, "Country_ISO" ,Country, ISO, sep = "-")

# View the head of the result
head(bmi_cc)

###--- Quoted column in separate is the column to be formed

##--------- Data cleaning using spread and gather
## tidyr and dplyr are already loaded for you

# View the head of census
head(census)

# Gather the month columns
census2 <- gather(census, month, amount, -YEAR)

# Arrange rows by YEAR using dplyr's arrange
census2 <- arrange(census2, YEAR)

# View first 20 rows of census2
head(census2, n=50)

###----------- Spread function to suit use case
## tidyr is already loaded for you

# View first 50 rows of census_long
head(census_long, 50)

# Spread the type column
census_long2 <- spread(census_long, type, amount)

# View first 20 rows of census_long2
head(census_long2, 20)

###------------- Separating data column into two
## tidyr is already loaded for you

# View the head of census_long3
head(census_long3)

# Separate the yr_month column into two
census_long4 <- separate(census_long3, yr_month ,into=c("year","month"), sep="_")

# View the first 6 rows of the result
head(census_long4)

###------------- Type conversions
# Make this evaluate to character
class(as.character(TRUE))

# Make this evaluate to numeric
class(as.numeric("8484.00"))

# Make this evaluate to integer
class(as.integer(99))

# Make this evaluate to factor
class(as.factor("factor"))


# Make this evaluate to logical
class(as.logical("FALSE"))

###------------ Lubridate package - parse data and time with basic functions
# Preview students2 with str()
str(students2)

# Load the lubridate package
library(lubridate)

# Parse as date
dmy("17 Sep 2015")

# Parse as date and time (with no seconds!)
mdy_hm("July 15, 2012 12:56")

# Coerce dob to a date (with no time)
students2$dob <- ymd(students2$dob)

# Coerce nurse_visit to a date and time
students2$nurse_visit <- ymd_hms(students2$nurse_visit)

# Look at students2 once more with str()
str(students2)

###----------------- String conversions
##----- Trim and padding
# Load the stringr package
library(stringr)

# Trim all leading and trailing whitespace
str_trim(c("   Filip ", "Nick  ", " Jonathan"))

# Pad these strings with leading zeros
str_pad(c("23485W", "8823453Q", "994Z"), width=9, side="left", pad=0)

##------ String detect and replace
## stringr has been loaded for you

# Look at the head of students2
head(students2)

# Detect all dates of birth (dob) in 1997
str_detect(students2$dob, "1997")

# In the sex column, replace "F" with "Female"...
students2$sex <- str_replace(students2$sex, "F", "Female")

# ...And "M" with "Male"
students2$sex <- str_replace(students2$sex, "M", "Male") 

# View the head of students2
head(students2)

###----------------- Missing values
# Call is.na() on the full social_df to spot all NAs
is.na(social_df)

# Use the any() function to ask whether there are any NAs in the data
any(is.na(social_df))

# View a summary() of the dataset
summary(social_df)

# Call table() on the status column
table(social_df$status)

##----------------------- Replacing empty strigs with NA
## The stringr package is preloaded

# Replace all empty strings in status with NA
social_df$status[social_df$status == ""] <- NA

# Print social_df to the console
social_df

# Use complete.cases() to see which rows have no missing values
complete.cases(social_df)

# Use na.omit() to remove all rows with any missing values
na.omit(social_df)

###-------------- outliers and obvious errors
# Look at a summary() of students3
summary(students3)

# View a histogram of the age variable
hist(students3$age)

# View a histogram of the absences variable
hist(students3$absences)

# View a histogram of absences, but force zeros to be bucketed to the right of zero
hist(students3$absences, right=FALSE)

###---------------- outloers using boxplot
# View a boxplot of age
boxplot(students3$age)

# View a boxplot of absences
boxplot(students3$absences)

###----------------- Data cleaning - Putting it all together
##Understanding the data
# Verify that weather is a data.frame
class(weather)

# Check the dimensions
dim(weather)

# View the column names
names(weather)

##----------- Understanding the data part 2

# View the structure of the data
str(weather)

# Load dplyr package
library(dplyr)

# Look at the structure using dplyr's glimpse()
glimpse(weather)

# View a summary of the data
summary(weather)

###------------- Looking at the first and last few observations of the data
# View first 6 rows
head(weather)

# View first 15 rows
head(weather, n=15)

# View the last 6 rows
tail(weather)

# View the last 10 rows
tail(weather, n=10)

###------------- Tidy the data using tidyr
## Make values that should be cols exist as cols
# Load the tidyr package
library(tidyr)

# Gather the columns
weather2 <- gather(weather, day, value, X1:X31, na.rm = TRUE)

# View the head
head(weather2)

###------------ Spread certain columns to make data wider
## The tidyr package is already loaded

# First remove column of row names
weather2 <- weather2[, -1]

# Spread the data
weather3 <- spread(weather2, measure, value)

# View the head
head(weather3)

###---------------- cleanging data s per comments
## tidyr and dplyr are already loaded

# Load the stringr and lubridate packages
library(stringr)
library(lubridate)

str(weather3)
# Remove X's from day column
weather3$day <- str_replace(weather3$day, "X", "")

# Unite the year, month, and day columns
weather4 <- unite(weather3, date, year , month, day , sep = "-")

# Convert date column to proper date format using lubridates's ymd()
weather4$date <- ymd(weather4$date)

# Rearrange columns using dplyr's select()
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)

# View the head of weather5
head(weather5)

###-------------------- check out column types
# View the structure of weather5
str(weather5)

# Examine the first 20 rows of weather5. Are most of the characters numeric?
head(weather5, n=20)

# See what happens if we try to convert PrecipitationIn to numeric
as.numeric(weather5$PrecipitationIn)

###-------------- convert characters to numerics and remove trace values
## The dplyr and stringr packages are already loaded

# Replace T with 0 (T = trace)
weather5$PrecipitationIn <- str_replace(weather5$Precipitation, "T", 0)

# Convert characters to numerics
weather6 <- mutate_each(weather5, funs(as.numeric), CloudCover:WindDirDegrees)

# Look at result
str(weather6)

###-------------- Search for missing values
# Count missing values
sum(is.na(weather6))

# Find missing values
summary(weather6)

# Find indices of NAs in Max.Gust.SpeedMPH
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))

# Look at the full rows for records missing Max.Gust.SpeedMPH
weather6[ind, ]

###------------- Find and replace obvious error
# Review distributions for all variables
summary(weather6)

# Find row with Max.Humidity of 1000
ind <- which(weather6$Max.Humidity==1000)

# Look at the data for that day
weather6[ind, ]

# Change 1000 to 100
weather6$Max.Humidity[ind] <- 100

###----------- Removing another obvious error
# Look at summary of Mean.VisibilityMiles
summary(weather6$Mean.VisibilityMiles)

# Get index of row with -1 value
ind <- which(weather6$Mean.VisibilityMiles == -1)

# Look at full row
weather6[ind, ]

# Set Mean.VisibilityMiles to the appropriate value
weather6$Mean.VisibilityMiles[ind] <- 10

###_------------- Looking for other extreme values
# Review summary of full data once more
summary(weather6)

# Look at histogram for MeanDew.PointF
hist(weather6$MeanDew.PointF)

# Look at histogram for Min.TemperatureF
hist(weather6$Min.TemperatureF)

# Compare to histogram for Mean.TemperatureF
hist(weather6$Mean.TemperatureF)

##----- Final touches
# Clean up column names
new_colnames
names(weather6) <- new_colnames

# Replace empty cells in events column
weather6$events[weather6$events == ""] <- "None"

# Print the first 6 rows of weather6
head(weather6)


