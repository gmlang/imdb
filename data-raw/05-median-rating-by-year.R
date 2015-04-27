# calculate average, median, min, max rating and sd per year
rating_stats_by_year = dat[, c("year", "rating")] %>% group_by(year) %>% 
        summarise(avg_rating = mean(rating), med_rating = median(rating),
                  min_rating = min(rating), max_rating = max(rating),
                  sd_rating = sd(rating)) %>% arrange(year)


