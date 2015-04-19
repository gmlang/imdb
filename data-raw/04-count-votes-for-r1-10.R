
# r1-10 contains distribution of votes for each rating, 
# where 0 = no votes, 4.5 = 1-9 votes, 14.5 = 11-19 votes, and etc.
# collect all unique values in r1-10 and create a look up dictionary.
lookup = c("no votes", "1-9 votes", "10-19 votes", "20-29 votes", "30-39 votes", 
           "40-49 votes", "50-59 votes", "60-69 votes", "70-79 votes", 
           "80-89 votes")
vars = paste0("r", 1:10)
head = c()
for (var in vars) head = c(head, unique(dat[[var]]))
head = unique(head)
head = head[order(head)]
names(lookup) = head

# use the lookup dictionary to replace the values in r1-10 with the names
# and compute their frequency tables
votes_per_rating = data.frame()
for (var in vars) {
        dat[[var]] = lookup[as.character(dat[[var]])]
        dat[[var]] = factor(dat[[var]], levels=lookup)
        row = c(table(dat[[var]]))
        votes_per_rating = rbind(votes_per_rating, row)
}
names(votes_per_rating) = lookup

# turn frequency into percent
tot = apply(votes_per_rating, 1, sum)
for (i in 1:nrow(votes_per_rating))
        votes_per_rating[i, ] = votes_per_rating[i, ] / tot[i]

# change to long format
votes_per_rating$rating = factor(vars, levels=vars)
votes_per_rating = votes_per_rating %>% gather(votes, val, -rating)


