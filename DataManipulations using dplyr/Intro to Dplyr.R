# Load the dplyr package
library(dplyr)

# Load the hflights package
library(hflights)

# Call both head() and summary() on hflights
head(hflights)
summary(hflights)

hflights<-tbl_df(hflights)
hflights

#---- converting dataset to data frame
# Both the dplyr and hflights packages are loaded

# Convert the hflights data.frame into a hflights tbl
hflights<-tbl_df(hflights)

# Display the hflights tbl
hflights


###------- Replacing character strings with different values
# Create the object carriers
carriers<-hflights$UniqueCarrier

# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights
glimpse(hflights)

##----- Few more string manipulations
# The hflights tbl you built in the previous exercise is available in the workspace.

# The lookup table
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

# Add the Code column
hflights$Code <- lut[hflights$CancellationCode]

# Glimpse at hflights
glimpse(hflights)

###------- Select verb of dplyr
# hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl with the four columns of hflights related to delay
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)

# Answer to last question: be concise!
select(hflights, Year:DayOfWeek, ArrDelay:Diverted)

###----- Select verb using helper functions
# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, ends_with("Delay"))

# Print out a tbl as described in the second instruction, using both helper functions and variable names
select(hflights, ends_with("Num"),starts_with("Cancell"), UniqueCarrier)

# Print out a tbl as described in the third instruction, using only helper functions.
select(hflights, contains("Tim"),contains("Del"))

###--------- Advanced select functions
# both hflights and dplyr are available

# Finish select call so that ex1d matches ex1r
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, contains("Taxi"), Distance)

# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, 1:6, -3)
names(hflights)

# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, contains("Taxi"), TailNum)

#####_--------------------- Mutate verb
# hflights and dplyr are loaded and ready to serve you.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1<-mutate(hflights, ActualGroundTime=ActualElapsedTime-AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2<-mutate(g1,GroundTime=TaxiIn+TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3<-mutate(g2, AverageSpeed=Distance/AirTime*60)

# Print out g3
g3

###---------- Mutate - Adding multiple cols to tbl, Using cols created in mutate 
# hflights and dplyr are ready, are you?

# Add a second variable loss_ratio to the dataset: m1
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_ratio=loss/DepDelay)

# Add the three variables as described in the third instruction: m2
m2<-mutate(hflights, TotalTaxi=TaxiIn+TaxiOut, ActualGroundTime=ActualElapsedTime-AirTime, Diff=TotalTaxi-ActualGroundTime)

#######_---------------- FILTER Verb
###--- Filter Basics
# hflights is at your disposal as a tbl, with clean carrier names

# All flights that traveled 3000 miles or more
filter(hflights, Distance>3000)

# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier %in% c("JetBlue","Southwest","Delta"))

# All flights where taxiing took longer than flying
filter(hflights, (TaxiIn+TaxiOut)>AirTime)

###---- Filter intermediate
# hflights is at your service as a tbl!
# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime<500 | ArrTime>2200)

# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay>0 & ArrDelay<0)

# All flights that were cancelled after being delayed
filter(hflights, DepDelay>0 & Cancelled==1)

###------- Select, filter mutate advanced
# hflights is already available in the workspace
names(hflights)
# Select the flights that had JFK as their destination: c1
c1<-filter(hflights, Dest=="JFK")

# Combine the Year, Month and DayofMonth variables to create a Date column: c2
c2<-mutate(c1, Date=paste(c1$Year, c1$Month, c1$DayofMonth, sep="-")) 


# Print out a selection of columns of c2
select(c2, Date, DepTime, ArrTime, TailNum)

#######-------------- ARRANGE verb
# dplyr and the hflights tbl are available

# Definition of dtc
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
arrange(dtc, DepDelay)

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode)

# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier, DepDelay)


###----- Arrange advanced
# dplyr and the hflights tbl are available

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, DepDelay+ArrDelay)

####-------------- Summarise keyword
# hflights and dplyr are loaded in the workspace
hflights$Diverted
# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist=min(Distance), max_dist=max(Distance))

# Print out a summary with variable max_div
summarise(filter(hflights, Diverted==1), max_div=max(Distance))

###---------- Summarize advanced
# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1<- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest=min(ArrDelay), average=mean(ArrDelay), latest=max(ArrDelay), sd=sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2<-filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff=max(abs(TaxiIn-TaxiOut)))

###_----- Summarise advanced
# hflights is available with full names for the carriers

# Generate summarizing statistics for hflights
summarise(hflights, 
          n_obs = n(), 
          n_carrier = n_distinct(UniqueCarrier), 
          n_dest = n_distinct(Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarise(aa, 
          n_flights = n(), 
          n_canc = sum(Cancelled == 1),
          avg_delay = mean(ArrDelay, na.rm = TRUE))
###---------- Chaining funcitons using pipe operation
# hflights and dplyr are both loaded and ready to serve you

# Write the 'piped' version of the English sentences.
hflights %>%
  mutate(diff=TaxiOut-TaxiIn) %>%
  filter(!is.na(diff)) %>%
  summarise(avg=mean(diff))

###-------- Advanced piping
# Chain together mutate(), filter() and summarise()
hflights %>%
  mutate(RealTime = ActualElapsedTime + 100, mph=Distance / RealTime*60) %>%
  filter(!is.na(mph), mph<70)  %>%
  summarise(n_less=n(), n_dest=n_distinct(Dest),
            min_dist=min(Distance),
            max_dist=max(Distance))

###----- Advanced piping 2
# Finish the command with a filter() and summarise() call
hflights %>%
  mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
  filter(mph<105 | Cancelled==1 | Diverted==1)%>%
  summarise(n_non=n(), n_dest=n_distinct(Dest),
            min_dist=min(Distance),
            max_dist=max(Distance)
  )

###------ Advanced piping
# hflights and dplyr are loaded

# Count the number of overnight flights
hflights %>%
  filter(!is.na(DepTime) , !is.na(ArrTime), DepTime>ArrTime) %>%
  summarise(num=n())
###----- Group_by dplyr
# hflights is in the workspace as a tbl, with translated carrier names

# Make an ordered per-carrier summary of hflights
hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(p_canc = mean(Cancelled==1)*100,avg_delay = mean(ArrDelay, na.rm=TRUE)) %>%
  arrange(avg_delay, p_canc)


# Ordered overview of average arrival delays per carrier
hflights %>%
  filter(!is.na(ArrDelay) , ArrDelay>0)%>%
  group_by(UniqueCarrier) %>%
  summarise(avg=mean(ArrDelay)) %>%
  mutate(rank=rank(avg)) %>%
  arrange(rank)

###---- Advanced group by
# dplyr and hflights (with translated carrier names) are pre-loaded

# How many airplanes only flew to one destination?
hflights %>%
  group_by(TailNum) %>%
  summarise(ndest = n_distinct(Dest)) %>%
  filter(ndest == 1) %>%
  summarise(nplanes = n())

# Find the most visited destination for each carrier
hflights %>% 
  group_by(UniqueCarrier, Dest) %>%
  summarise(n = n()) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1)

####_-------------- Using dplyr on databases
# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>%
  group_by(carrier) %>%
  summarise(n_flights=n(), avg_delay=mean(arr_delay)) %>%
  arrange(avg_delay)


