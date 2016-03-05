
# This script sorts problems by their number of solution; in descending order.

library(XML)
library(RCurl)
library(data.table)
library(dplyr)

# Build urls to scrap
urls <- paste0(rep('https://projecteuler.net/archives;page=', 11), 1:11)

# Scrap urls, renames vars and orders by nr of solutions
problems <- rbindlist(
  sapply(urls, function(url) {
    readHTMLTable(getURL(url),
                  header = T,
                  colClasses = c('integer', 'character', 'integer'),
                  stringsAsFactors = F)
  })) %>%
  rename(id = ID, title = `Description / Title`, solved_by = `Solved By`) %>%
  arrange(desc(solved_by))

# Write into file
write.table(problems, 'sorted_problems.csv', row.names = T)
