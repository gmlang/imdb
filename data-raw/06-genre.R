# make a helper function to count films by genre
cnt_films_by_genre = function(genres) {
        function(dat) {
                cnt = rep(0, length(genres))
                names(cnt) = genres
                for (var in genres)
                        cnt[var] = sum(dat[[var]] == 1)
                cnt = cnt[order(-cnt)]
                pct = cnt / sum(cnt)
                out = data.frame(cnt, pct)
                out$genre = factor(names(cnt), levels=names(cnt))
                row.names(out) = NULL        
                out
        }
}

# gather all genres into a vector
genres = c("short", "drama", "comedy", "documentary", "adult", "action", 
           "romance", "thriller", "animation", "family", "crime", "horror",         
           "music", "adventure", "fantasy", "sci_fi", "mystery", "biography",      
           "history", "sport", "musical", "western", "war", "reality_tv",     
           "news", "talk_show", "film_noir")

# calculate the number and percent of films of each genre
tally_genres = cnt_films_by_genre(genres)
films_by_genre = tally_genres(dat)

# find the top 5 genres for each period (1913-2014)
lst_of_dfs = split(dat, dat$year_cat)
top5genres_by_yearcat = lapply(lst_of_dfs, function(df) tally_genres(df)[1:5,])
year_cat = rep(names(top5genres_by_yearcat), each=5)
top5genres_by_yearcat = do.call("rbind", top5genres_by_yearcat)
top5genres_by_yearcat = cbind(year_cat, top5genres_by_yearcat)
row.names(top5genres_by_yearcat) = NULL

# find the top 10 genres every year
top_genres = as.character(films_by_genre[1:10,][["genre"]])
dat_top = dat[, c("year", top_genres)]
for (var in top_genres)
        dat_top[[var]] = as.numeric(levels(dat_top[[var]]))[dat_top[[var]]]
top_genres_by_year = dat_top %>% group_by(year) %>% summarise_each(funs(sum))
top_genres_by_year_long = top_genres_by_year %>% gather(genre, cnt, -year)



