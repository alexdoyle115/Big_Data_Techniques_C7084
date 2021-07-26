## Code Chunk for reordering submission .csv

setwd("/Users/alexd/Desktop/C7084-Assignment/")

test_data <- read.csv("test_values.csv") # loading in the file from the directory
submission <- read.csv("results/submission.csv") # loading the file of the predicted statu_group

id <- test_data %>%
  select(id) %>%
  left_join(submission, by = "id") %>%
  replace_na(list(predicted_label = "functional")) %>%
  rename(status_group = predicted_label) # for some reason there are a number of NA's

id[is.na(id)] # double checking there are no 'NA's
  



write.csv(id, "submission.csv") # rewrite the .csv for submission 
