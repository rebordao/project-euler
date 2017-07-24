
# This script writes the header of a typical R solution.

library(XML)
library(RCurl)
library(data.table)
library(dplyr)

#### User-defined problems ####
problems <- 85:85
language <- 'r' # needs to be either r, python, julia or scala

#### Aux functions ####

# Fetches an url as parses its text/tree to extract the relevant info
get_info <- function (url) {
  
  # Fetches text/tree
  tree <- htmlTreeParse(readLines(url, warn = F), useInternalNodes = T)
  
  # Parses text/tree
  problem <- xpathSApply(tree, "//div[@id='problem_info']/h3", xmlValue)
  title <- xpathSApply(tree, "//div[@id='content']/h2", xmlValue)
  body <- xpathSApply(tree, "//div[@class='problem_content']", xmlValue)
  
  list(problem = problem, title = title, body = gsub('\n', '', body))
}

# Creates the header based on the output of get_info()
create_header <- function(hd) {
  
  # Defines comment symbol for the intended language
  csym <- '#'
  if (language == 'scala') {
    csym <- '//'
  }

  # Builds body
  url <- sprintf(
    'https://projecteuler.net/problem=%s', strsplit(hd$problem, ' ')[[1]][2])
  
  # Enforces body to be less than 80 chars and adds heading #s (comment setup)
  body <- paste0(csym, ' ', strwrap(hd$body, width = 75), '\n', collapse = '')
    
  sprintf("%s %s | %s\n%s\n%s %s\n%s\n%s%s",
    csym, hd$problem, hd$title, csym, csym, hd$title, csym, body, csym, csym)
}

# Creates files with headers for the intended language (R, python, julia, scala)
create_file <- function(header = header, language = language) {
  
  # Language needs to be supported
  stopifnot(language %in% c('r', 'python', 'julia', 'scala'))
  
  # Creates dir if it doesn't exist
  if (!dir.exists(language)) {
    dir.create(language)
  }
  
  file_extension <- switch(
    language, 
    'r'      = '.R',
    'python' = '.py',
    'julia'  = '.jl',
    'scala'  = '.sc')
  
  # Parses the problem number
  str_splited <- unlist(strsplit(header, ' '))
  problem_nr <- str_splited[which(str_splited == 'Problem') + 1]
  
  # Creates file with header (if file doesn't exist)
  probl_nr_prefix <- switch(
    language,
    'r'      = 'p',
    'python' = '',
    'scala'  = 'Problem')
  
  file_name <- paste0(language, '/', probl_nr_prefix, problem_nr, file_extension)
  if (!file.exists(file_name)) {
    conn <- file(file_name)
    writeLines(text = header, con = conn)
    close(conn)    
  }
}

#### Algorithm ####

# Builds urls to scrap
urls <- paste0(
  rep('https://projecteuler.net/problem=', length(problems)), problems)

# Scraps urls and gets their info
info <- lapply(urls, get_info)

# Builds headers
headers <- sapply(info, create_header)

# Creates files
sapply(headers, create_file, language = language)
