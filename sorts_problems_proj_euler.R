
# Reads file that I got from import.io
raw_data <- read.csv("problems_proj_euler.csv", stringsAsFactors = F)

problems <- data.frame()
for (row in 1:nrow(raw_data)) {

  # Munges ids, titles, nr_solutions and urls
  ids <- as.numeric(strsplit(raw_data[row, ]$id, split = ";")[[1]])
  titles <- as.character(strsplit(raw_data[row, ]$title, split = ";")[[1]])
  nr_solutions <- as.numeric(
    strsplit(raw_data[row, ]$nr_solutions, split = ";")[[1]])
  urls <- as.character(strsplit(raw_data[row, ]$url, split = ";")[[1]])

  # Writes all as rows in problems
  problems <- rbind(problems, data.frame(
    id = ids, title = titles, nr_solutions = nr_solutions, url = urls, 
    stringsAsFactors = F))
}

# Sorts rows by nr of solutions
problems <- problems[order(problems$nr_solutions, decreasing = F), ]

# Write into file
write.table(problems, 'sorted_problems_proj_euler.csv', row.names = F)
