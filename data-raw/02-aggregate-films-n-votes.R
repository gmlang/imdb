rm(list=ls())

# set paths and source setup script
help_path = "data-raw/helper"
source(file.path(help_path, "descriptive-analysis-setup.R"))

# count films by year
film_cnt = as.data.frame(table(dat$year))
names(film_cnt) = c("year", "films")
film_cnt$year = as.integer(as.character(film_cnt$year))

# count votes by year
vote_cnt = dat[, c("year", "votes")] %>% group_by(year) %>% 
        summarise(votes = sum(votes) / 10^6) # unit = million

# merge film_cnt and vote_cnt
temp = merge(film_cnt, vote_cnt)

# calculate average votes (per film) per year
films_n_votes_by_year = temp %>% mutate(avg_votes = votes * 10^3 / films) # unit = thousand

# count films by year_cat
film_cnt = as.data.frame(table(dat$year_cat))
names(film_cnt) = c("year", "films")
film_cnt$year = as.character(film_cnt$year)

# count votes by year_cat
vote_cnt = dat[, c("year_cat", "votes")] %>% group_by(year_cat) %>% 
        summarise(votes = sum(votes) / 10^6) # unit = million
names(vote_cnt)[1] = "year"

# merge film_cnt and vote_cnt
temp = merge(film_cnt, vote_cnt)

# calculate average votes (per film) per year_cat
films_n_votes_by_yearcat = temp %>% mutate(avg_votes = votes * 10^3 / films) # unit = thousand


