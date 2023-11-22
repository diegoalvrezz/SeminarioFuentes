install.packages("dplyr")
install.packages("stringr")
library(dplyr)

filter_and_following_rows <- function(data, column_name, search_string) {
  data %>%
    filter(str_detect({{ column_name }}, search_string)) %>%
    slice(seq_along({{ column_name }}) %in% (which(str_detect({{ column_name }}, search_string)):(which(str_detect({{ column_name }}, search_string)) + 6)))
}

# Example usage:
# Assuming your data frame is called df and the column you want to search is named 'text_column'
# You can use the function like this:
result <- filter_and_following_rows(df, text_column, "your_search_string")
