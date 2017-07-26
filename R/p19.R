# 19 | Counting Sundays
# https://projecteuler.net/problem=19
# 
# You are given the following information, but you may prefer to do some 
# research for yourself.
# 
# 1 Jan 1900 was a Monday.
# Thirty days has September, April, June and November.
# All the rest have thirty-one,
# Saving February alone, Which has 28, but 29 on leap years.
# A leap year occurs on any year evenly divisible by 4, 
# but not on a century unless it is divisible by 400.
# 
# How many Sundays fell on the first of the month during 
# the twentieth century (1 Jan 1901 to 31 Dec 2000)?

years <- 1901:2000

dat <- data.frame()

for (year in years) {
  
  # Sets up the nr of days according to leap and non leap years
  month_days <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  if (year %% 4 == 0 & !(2000 %% 400 == 0)) {
    month_days <- c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  }
  
  # Builds data structure
  for (month in 1:12) {
    dat <- rbind(dat, data.frame(
      year = year, month = month, day = 1:month_days[month]))
  }
}

# Made some research and found that the 1st of January of 1901 was a Tuesday
# Builds week_day for dat, starts on Tuesday (= 2)
dat$week_day <- c(rep(c(2:7, 1), floor(nrow(dat) / 7)), 1:(nrow(dat) %% 7))

print(sum(dat$day == 1 & dat$week_day == 7))
