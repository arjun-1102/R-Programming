####_-------------- Joining data in r with dplyr
# Complete the code to join artists to bands
bands2 <- left_join(bands, artists, by = c("first","last"))

# Examine the results
bands2

# Fix the code to recreate bands2
left_join(bands, artists, by = c("first","last"))

# Finish the code below to recreate bands3 with a right join
bands2 <- left_join(bands, artists, by = c("first", "last"))
bands3 <- right_join(artists, bands, by=c("first", "last"))

# Check that bands3 is equal to bands2
setequal(bands2,bands3)

# Join albums to songs using inner_join()
inner_join(songs, albums, by= "album")

# Join bands to artists using full_join()
full_join(artists, bands, by=c("first",'last'))

# Find guitarists in bands dataset (don't change)
temp <- left_join(bands, artists, by = c("first", "last"))
temp <- filter(temp, instrument == "Guitar")
select(temp, first, last, band)

# Reproduce code above using pipes
bands %>%  
  left_join(artists, by=c('first','last')) %>%
  filter(instrument == 'Guitar') %>%
  select(first, last, band)

# Examine the contents of the goal dataset
goal
# Create goal2 using full_join() and inner_join() 
goal2 <- artists %>% 
  full_join(bands,by=c('first','last')) %>%
  inner_join(songs, by=c('first', 'last'))
# Check that goal and goal2 are the same
setequal(goal, goal2)

# Create one table that combines all information
artists %>%
  full_join(bands, by=c('first','last')) %>%
  full_join(songs, by=c('first','last')) %>%
  full_join(albums, by=c('album','band'))

# View the output of semi_join()
artists %>% 
  semi_join(songs, by = c("first", "last"))

# Create the same result
artists %>% 
  right_join(songs, by = c("first", "last")) %>% 
  filter(!is.na(instrument)) %>% 
  select(first, last, instrument)

albums %>% 
  # Collect the albums made by a band
  semi_join(bands, by='band') %>%
  # Count the albums made by a band
  nrow()

# Return rows of artists that don't have bands info
artists %>% 
  anti_join(bands, by=c('first','last'))

# Check whether album names in labels are mis-entered
labels %>% 
  anti_join(albums, by='album')

# Determine which key joins labels and songs
labels
songs

# Check your understanding
songs %>% 
  # Find the rows of songs that match a row in labels
  semi_join(labels, by='album') %>% 
  # Number of matches between labels and songs
  nrow()

###----------- Set operations in R
aerosmith %>% 
  # Create the new dataset using a set operation
  union(greatest_hits) %>% 
  # Count the total number of songs
  nrow()

# Create the new dataset using a set operation
aerosmith %>% 
  intersect(greatest_hits)

# Select the song names from live
live_songs <- live %>% select(song)
# Select the song names from greatest_hits
greatest_songs <- greatest_hits %>% select(song)

# Create the new dataset using a set operation
live_songs %>% 
  setdiff(greatest_songs)

# Select songs from live and greatest_hits
live_songs<- live %>% select(song)
greatest_songs<- greatest_hits %>% select(song)

# Return the songs that only exist in one dataset
songs_live_greatest <- live_songs %>% 
  setdiff(greatest_songs)
songs_greatest_live <- greatest_songs %>%
  setdiff(live_songs)
intersect(songs_greatest_live, songs_live_greatest)
union(songs_live_greatest, songs_greatest_live)


# Check if same order: definitive and complete
identical(definitive, complete)

# Check if any order: definitive and complete
setequal(definitive, complete)

# Songs in definitive but not complete
setdiff(definitive, complete)


# Songs in complete but not definitive
setdiff(complete, definitive)


# Return songs in definitive that are not in complete
definitive %>% 
  anti_join(complete, by=c('song', 'album'))

# Return songs in complete that are not in definitive
complete %>% 
  anti_join(definitive, by=c('song', 'album'))

# Check if same order: definitive and union of complete and soundtrack
complete %>% union(soundtrack)%>%
  identical(definitive)



# Check if any order: definitive and union of complete and soundtrack
complete %>% union(soundtrack) %>%
  setequal(definitive)

# Examine side_one and side_two
side_one
side_two

# Bind side_one and side_two into a single dataset
side_one %>% 
  bind_rows(side_two)

# Examine discography and jimi
discography
jimi

jimi %>% 
  # Bind jimi into a single data frame
  bind_rows(.id='album') %>% 
  # Make a complete data frame
  left_join(discography)

# Examine hank_years and hank_charts
hank_years
hank_charts

hank_years %>% 
  # Reorder hank_years alphabetically by song title
  arrange(song) %>% 
  # Select just the year column
  select(year) %>% 
  # Bind the year column
  bind_cols(hank_charts) %>% 
  # Arrange the finished dataset
  arrange(year)

# Make combined data frame using data_frame()
data_frame(year = hank_year, song = hank_song, peak = hank_peak) %>% 
  # Extract songs where peak equals 1
  filter(peak == 1)

# Examine the contents of hank
hank

# Convert the hank list into a data frame
as_data_frame(hank) %>% 
  # Extract songs where peak equals 1
  filter(peak==1)

seventies %>% 
  # Coerce seventies$year into a useful numeric
  mutate(year = as.numeric(as.character(year))) %>% 
  # Bind the updated version of seventies to sixties
  bind_rows(sixties) %>% 
  arrange(year)

###--------- Advanced joins
# Load the tibble package
library(tibble)
stage_songs
stage_songs %>% 
  # Add row names as a column named song
  rownames_to_column(var='song') %>% 
  # Left join stage_writers to stage_songs
  left_join(stage_writers, by='song')

# Examine the result of joining singers to two_songs
two_songs %>% inner_join(singers, by = "movie")

# Remove NA's from key before joining
two_songs %>% 
  filter(!is.na(movie)) %>% 
  inner_join(singers, by = "movie")

# Identify the key column
elvis_songs
elvis_movies

elvis_movies %>% 
  # Left join elvis_songs to elvis_movies by this column
  left_join(elvis_songs, by=c("name"="movie")) %>% 
  # Rename columns
  rename(song=name.y, movie=name)

# Identify the key columns
movie_directors
movie_years

movie_years %>% 
  # Left join movie_directors to movie_years
  left_join(movie_directors, by=c("movie"="name"))%>% 
  # Arrange the columns using select()
  select(year,movie, artist=name, director, studio)

# Load the purrr library
library(purrr)

# Place supergroups, more_bands, and more_artists into a list
list(supergroups, more_bands, more_artists) %>% 
  # Use reduce to join together the contents of the list
  reduce(left_join, by=c("first",'last'))

list(more_artists, more_bands, supergroups) %>% 
  # Return rows of more_artists in all three datasets
  reduce(semi_join, by=c("first",'last'))

# Alter the code to perform the join with a dplyr function
merge(bands, artists, by = c("first", "last"), all.x = TRUE) %>%
  arrange(band)

bands %>%
  left_join(artists, by=c('first','last')) %>%
  arrange(bands)