rm(list=ls())
library(dplyr)
library(tidyr)

# set paths
setwd('~/openCPU/apps/imdb')
data_path = file.path("data-raw", "movies.tab")
        
# read in data
dat = read.delim2(data_path, header=TRUE, na.strings="", stringsAsFactors=FALSE)

# clean header
header = names(dat)
names(dat) = gsub("\\.", "_", tolower(header))

# clean year
range(dat$year)
sum(is.na(dat$year))
summary(dat$year)
dat = subset(dat, year < 2015) # ignore year 2015 data since not a full year yet

# clean length
str(dat$length)
sum(is.na(dat$length))
summary(dat$length)

# clean budget
str(dat$budget)
dat$budget = as.numeric(dat$budget)
sum(is.na(dat$budget))
summary(dat$budget)

# clean box office
str(dat$boxoffice)
sum(is.na(dat$boxoffice))
summary(dat$boxoffice)

# clean votes
str(dat$votes)
dat$votes = as.numeric(dat$votes)
summary(dat$votes)

# clean rating and r1-r10
rvars = paste0("r", 1:10)
str(dat[c("rating", rvars)])
# change all rating vars from character to numeric
dat[c("rating", rvars)] = sapply(dat[c("rating", rvars)], as.numeric)
summary(dat[c("rating", rvars)])

# clean mpaa
str(dat$mpaa)
table(dat$mpaa)
dat$mpaa[dat$mpaa == "PG-"] = "PG"
table(dat$mpaa)

# clean genres
(genres = names(dat)[23:ncol(dat)])
sapply(dat[genres], class)
apply(dat[genres], 2, sum)

# drop genres that don't contain any films
empty_genres = genres[apply(dat[genres], 2, sum) == 0]
for (genre in empty_genres)
        dat[[genre]] = NULL

# convert genres to factors
(genres = setdiff(genres, empty_genres))
for (genre in genres)
        dat[[genre]] = as.factor(dat[[genre]])

# calculate years since earliest year, which is 1913 in our dataset
summary(dat$year)
dat = transform(dat, yrs_since_1913 = year-min(year))
summary(dat$yrs_since_1913)

# create year_cat by binning year into 1913-1950, 1950-1970, 1970-1990, 1990-2014
dat$year_cat = rep(NA, nrow(dat))
dat$year_cat[dat$year >= 1913 & dat$year < 1950] = "1913-1950"
dat$year_cat[dat$year >= 1950 & dat$year < 1970] = "1950-1970"
dat$year_cat[dat$year >= 1970 & dat$year < 1990] = "1970-1990"
dat$year_cat[dat$year >= 1990 & dat$year <= 2014] = "1990-2014"
table(dat$year_cat)
sum(is.na(dat$year_cat))

# create boxoffice/budget ratio
dat$bo_bt_ratio = dat$boxoffice / dat$budget

# create binary var indicating if the film made money
dat = dat %>% mutate(made_money = factor(ifelse(boxoffice > budget, "yes", "no")))
table(dat$made_money)

# save dat
devtools::use_data(dat, overwrite=TRUE)
