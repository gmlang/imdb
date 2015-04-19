
# calculate budget sum and boxoffice sum by year
btbo_tot = dat[, c("year", "budget", "boxoffice")] %>% group_by(year) %>% 
        summarise(budget = sum(budget) / 10^9, 
                  boxoffice = sum(boxoffice) / 10^9) # unit = billion 

# change btbo to long format
btbo_tot = btbo_tot %>% gather(type, tot, -year)


# calculate avg budget and boxoffice per film by year
btbo_avg = dat[, c("year", "budget", "boxoffice")] %>% group_by(year) %>%
        summarise(budget = mean(budget) / 10^6,
                  boxoffice = mean(boxoffice) / 10^6) # unit = million

# change btbo_avg to long format
btbo_avg = btbo_avg %>% gather(type, avg, -year)


# merge btbo_tot and btbo_avg
btbo_by_year = merge(btbo_tot, btbo_avg)

# calculate boxoffice/budget ratio by year
bo_bt_ratio_by_year = dat[, c("year", "budget", "boxoffice")] %>% group_by(year) %>% 
        summarise(bo_bt_ratio = sum(boxoffice) / sum(budget))


# calculate budget sum and boxoffice sum by year_cat
btbo_tot = dat[, c("year_cat", "budget", "boxoffice")] %>% group_by(year_cat) %>% 
        summarise(budget = sum(budget) / 10^9,
                  boxoffice = sum(boxoffice) / 10^9) # unit = billion 

# change btbo to long format
btbo_tot = btbo_tot %>% gather(type, tot, -year_cat)


# calculate avg budget and boxoffice per film by year_cat
btbo_avg = dat[, c("year_cat", "budget", "boxoffice")] %>% group_by(year_cat) %>%
        summarise(budget = mean(budget) / 10^6,
                  boxoffice = mean(boxoffice) / 10^6) # unit = million

# change btbo_avg to long format
btbo_avg = btbo_avg %>% gather(type, avg, -year_cat)

# merge btbo_tot and btbo_avg
btbo_by_yearcat = merge(btbo_tot, btbo_avg)

# calculate boxoffice/budget ratio by year_cat
bo_bt_ratio_by_yearcat = dat[, c("year_cat", "budget", "boxoffice")] %>% 
        group_by(year_cat) %>% summarise(bo_bt_ratio = sum(boxoffice) / sum(budget))

