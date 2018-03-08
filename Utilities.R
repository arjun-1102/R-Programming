###--------------------- Mathematical functions using R - Basics
# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))

###--------------------- Mean function
# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

# Fix the error
mean(c(abs(vec1), abs(vec2)))

### Mean only takes one vector as input. In case we have more than one vectors,
### we can create a new vector to calculate the mean

###---------------------  Functions with data structures

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec<- unlist(linkedin)
fb_vec<- unlist(facebook)


# Append fb_vec to li_vec: social_vec
social_vec<-append(li_vec,fb_vec)

# Sort social_vec
sort(social_vec, decreasing=TRUE)

###--------------------- Sequences in R
# Create first sequence: seq1
seq1<-seq(1,500, by=3)

# Create second sequence: seq2
seq2<-seq(1200,900, by=-7)
# Calculate total sum of the sequences
sum(seq1,seq2)

###--------------------- REGEX in R
###--------------------- Grep and grepl on emails
# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern="edu", x=emails)

# Use grep() to match for "edu", save result to hits
hits<-grep(pattern="edu", x=emails)

# Subset emails using hits
emails[hits]


###--------------------- Advanced grep and grepl on emails
# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl(pattern="@.*\\.edu$", emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits<-grep(pattern="@.*\\.edu$", emails)

# Subset emails using hits
emails[hits]

###--------------------- sub on emails
# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to datacamp.edu
sub(pattern="@.*\\.edu$", replacement="@datacamp.edu",emails)

###--------------------- gsub advanced
awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

awards<- sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)
## Will search for all numerics before nomination and replace with numeric

###--------------------- Date and time
# Get the current date: today
today<-Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now<-Sys.time()

# See what now looks like under the hood
unclass(now)

###--------------------- Advanced data formatting
# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2<- as.Date(str2)
date3<-as.Date(str3, format="%d/%B/%Y")


# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

###--------------------- Advanced time formatting
# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2<-as.POSIXct(str2)
# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

###--------------------- Calculations with dates
# day1, day2, day3, day4 and day5 are already available in the workspace
day1<-as.Date("2018-01-11")
day2<-as.Date("2018-01-13")
day3<-as.Date("2018-01-18")
day4<-as.Date("2018-01-24")
day5<-as.Date("2018-01-29")

# Difference between last and first pizza day
day5-day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff<-diff(pizza)


# Average period between two consecutive pizza days
mean(day_diff)

###--------------------- Calculations with time
login<-c("2018-01-15 10:18:04 UTC" ,"2018-01-20 09:14:18 UTC" ,
         "2018-01-20 12:21:51 UTC","2018-01-20 12:37:24 UTC" ,
         "2018-01-22 21:37:55 UTC")
logout<-c("2018-01-15 10:56:29 UTC","2018-01-20 09:14:52 UTC",
          "2018-01-20 12:35:48 UTC", "2018-01-20 13:17:22 UTC",
          "2018-01-22 22:08:47 UTC")
# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online
time_online<-logout-login

# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)

###--------------------- Advacned calcluations with time


# Convert astro to vector of Date objects: astro_dates
astro_dates<-as.Date(astro, format="%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo
meteo_dates<-as.Date(meteo, format="%B %d, %y")

# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(meteo_dates - astro_dates))


