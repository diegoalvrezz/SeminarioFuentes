library(dplyr)
library(tidyverse)

filter_next_rows <- function(df, col_name, str) {
  df %>%
    mutate(match = ifelse(df[[col_name]] == str, row_number(), NA)) %>%
    fill(match, .direction = "down") %>%
    filter(!is.na(match) & row_number() - match < 7) %>%
    select(-match)
}


# Assuming 'df' is your data frame, 'column1' is the column to search in, and 'my_string' is the string to search for
result <- filter_next_rows(df, 'column1', 'my_string')
