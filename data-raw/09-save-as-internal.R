# save R objects to R/sysdata.rda to be used internally by other functions
devtools::use_data(films_n_votes_by_year, films_n_votes_by_yearcat,
                   btbo_by_year, bo_bt_ratio_by_year, 
                   btbo_by_yearcat, bo_bt_ratio_by_yearcat, votes_per_rating,
                   rating_stats_by_year,
                   internal=TRUE, overwrite=TRUE)


