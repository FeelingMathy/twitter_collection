#install.packages("rtweet")
library("rtweet")
token <- rtweet::create_token(
  app = "Presention-1",
  consumer_key = "XXXXXXXXXXXXX",
  consumer_secret = "XXXXXXXXXXXXX",
  access_token =  "XXXXXXXXXXXXX",
  access_secret = "XXXXXXXXXXXXX",
  set_renv = TRUE
)

tweets <- rtweet::search_tweets(q = "GME", # query for tweets
                                n = 18000, # number of tweets
                                token = token # authorize
                                )


View(tweets)
# Setting Parameters -----------------

# Query terms
query <- "GameStop"
# File location/name
json_file <- "GameStopStream.json"

# Collection ---------------------------

# STREAM API: Continuously stream tweets to a JSON file.
stream_tweets(q = query,
timeout = 60,
file_name = json_file,
parse = FALSE)

# Analysis -----------------------------

# Read & Parse the JSON file
parsed_json <- parse_stream(json_file)
