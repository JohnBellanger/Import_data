install.packages("rvest")
library(rvest)
library(tidyverse)

# Step 1: the source
url <- "https://www.imdb.com/search/title/?title_type=tv_series&genres=action&sort=num_votes,desc&start=1&explore=title_type,genres"

# Step 2: read the html content of the webpage
webpage <- read_html(url)

# step 3: extract information
  titles <- webpage %>%
    html_nodes(".with-margin") %>%
    html_text() #Extracting years and cleaning to remove brackets ([, ])
  
  years <- webpage %>%
    html_nodes(".dli-title-metadata-item:nth-child(1)") %>%
    html_text() %>%
    str_replace_all("[//(//)]", "") #Extracting genre (selector to confirm)
  
  genre <- webpage %>%
    html_nodes(".dli-title-type-data") %>%
    html_text() #Extracting rating (selector to confirm)
  
  rating <- webpage %>%
    html_nodes(".ratingGroup--imdb-rating") %>%
    html_text() #Extracting description (uses parent/child selector)
  
  description <- webpage %>%
    html_nodes(".ipc-html-content-inner-div") %>%
    html_text() #Extracting votes (selector to confirm)
  
  votes <- webpage %>%
    html_nodes(".ratingGroup--imdb-rating") %>%
    html_text() #CREATING THE TEMPORARY DATAFRAME (page_data)Combines the data from this page into a temporary dataframe
  
  
  # step 4: Checking the number of raw
  
  length(titles)
  length(years)
  length(genre)
  length(rating)
  length(description)
  length(votes)
  
  # step 5: Create a table with extracted data  
  data <- data.frame(Title = titles,
                          Year = years,
                          Genre = genre,
                          Rating = rating,
                          Description = description,
                          Votes = votes) 
  
  
# step 6: View the table
view(data) 











