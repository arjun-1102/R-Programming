library(Lahman)
library(purrr)
library(dplyr)

# Examine lahmanNames
LahmanData
reduce(LahmanData, intersect)
LahmanData %>%
  bind_rows(.id="dataframe") %>%
  group_by(var) %>%
  tally() %>%
  filter( n > 1) %>%
  arrange(desc(n))
  

###-----------------------------
lahmanNames

# Find variables in common
reduce(lahmanNames, intersect)

lahmanNames %>%  
  # Bind the data frames in lahmanNames
  bind_rows(.id = "dataframe") %>%
  # Group the result by var
  group_by(var) %>%
  # Tally the number of appearances
  tally() %>%
  # Filter the data
  filter(n > 1) %>% 
  # Arrange the results
  arrange(desc(n))

lahmanNames %>% 
  # Bind the data frames
  bind_rows(.id="dataframe") %>%
  # Filter the results
  filter(var=='playerID') %>% 
  # Extract the dataframe variable
  `$`(dataframe)

players <- Master %>% 
  # Return one row for each distinct player
  distinct()

players %>% 
  # Find all players who do not appear in Salaries
  anti_join(Salaries) %>%
  # Count them
  count()

players %>% 
  anti_join(Salaries, by = "playerID") %>% 
  # How many unsalaried players appear in Appearances?
  semi_join(Appearances) %>% 
  count()

players %>% 
  # Find all players who do not appear in Salaries
  anti_join(Salaries, by="playerID") %>% 
  # Join them to Appearances
  left_join(Appearances , by="playerID") %>% 
  # Calculate total_games for each player
  group_by(playerID) %>%
  summarise(total_games = sum(G_all, na.rm=T)) %>%
  # Arrange in descending order by total_games
  arrange(desc(total_games))

players %>%
  # Find unsalaried players
  anti_join(Salaries, by='playerID') %>% 
  # Join Batting to the unsalaried players
  left_join(Batting, by='playerID') %>% 
  # Group by player
  group_by(playerID) %>% 
  # Sum at-bats for each player
  summarise(total_at_bat=sum(AB, na.rm=T)) %>% 
  # Arrange in descending order
  arrange(desc(total_at_bat))

# Find the distinct players that appear in HallOfFame
nominated <- HallOfFame %>% 
  distinct(playerID)

nominated %>% 
  # Count the number of players in nominated
  count()

nominated_full <- nominated %>% 
  # Join to Master
  left_join(Master, by='playerID') %>% 
  # Return playerID, nameFirst, nameLast
  select(playerID, nameFirst, nameLast)

# Find distinct players in HallOfFame with inducted == "Y"
inducted <- HallOfFame %>% 
  filter(inducted =='Y') %>%
  distinct(playerID)  


inducted %>% 
  # Count the number of players in inducted
  count()

inducted_full <- inducted %>% 
  # Join to Master
  left_join(Master, by="playerID") %>% 
  # Return playerID, nameFirst, nameLast
  select(playerID, nameFirst, nameLast)

# Tally the number of awards in AwardsPlayers by playerID
nAwards <- AwardsPlayers %>% 
  group_by(playerID) %>% 
  tally()

nAwards %>% 
  # Filter to just the players in inducted 
  semi_join(inducted, by = "playerID") %>% 
  # Calculate the mean number of awards per player
  summarize(avg_n = mean(n, na.rm = TRUE))

nAwards %>% 
  # Filter to just the players in nominated 
  semi_join(nominated, by = "playerID") %>%
  # Filter to players NOT in inducted 
  anti_join(inducted, by = "playerID") %>%
  # Calculate the mean number of awards per player
  summarize(avg_n = mean(n, na.rm = TRUE))

# Find the players who are in nominated, but not inducted
notInducted <- nominated %>% 
  setdiff(inducted)

Salaries %>% 
  # Find the players who are in notInducted
  semi_join(notInducted, by='playerID')%>% 
  # Calculate the max salary by player
  group_by(playerID) %>% 
  summarize(max_salary=max(salary, na.rm=T)) %>% 
  # Calculate the average of the max salaries
  summarize(avg_salary=mean(max_salary, na.rm=T))

# Repeat for players who were inducted
Salaries %>% 
  # Find the players who are in notInducted
  semi_join(inducted, by='playerID')%>% 
  # Calculate the max salary by player
  group_by(playerID) %>% 
  summarize(max_salary=max(salary, na.rm=T)) %>% 
  # Calculate the average of the max salaries
  summarize(avg_salary=mean(max_salary, na.rm=T))

