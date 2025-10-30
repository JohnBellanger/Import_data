
install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)

# url <- https://fueleconomy.gov/ws/rest/fuelprices

# Step 1: Build URL
base_url <- "https://fueleconomy.gov/ws/rest/"
info_url <- "fuelprices"
full_url <- base::paste0(base_url, info_url)
full_url

# Step 2: Get API
api_call <- httr::GET(full_url)

# Step 3:api response (test)
api_call$status_code
api_call$content

# Step 4:Convert response into usable data
api_char <- base::rawToChar(api_call$content)
api_json <-  jsonlite::fromJSON(api_char, flatten = TRUE)
api_json

# Step 5:Create a data frame to work on it
df <- api_json












