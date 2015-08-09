#' @title Generate descriptive plots for ratings and votes per rating
#' 
#' @return 4 ggplot2 objects
#' @export
plot_ratings = function() {
        t0 = proc.time()
        
        # plot stacked barcharts to show the distribution of votes 
        # for each rating r1-10
        plt = ezplot::mk_barplot(votes_per_rating)
        title1 = "Distribution of Votes at Each Rating r1-10 (1913-2014)"
        p = plt("rating", "val", "votes", main=title1) 
        p = ezplot::scale_axis(p, "y", scale="pct")
        p = p + ggplot2::scale_fill_brewer(palette="Blues")
        p = ezplot::web_display(p, legend_title=F)
        print(p)
        
        # plot ratings distribution
        plt = ezplot::mk_distplot(dat)
        title2 = "Distribution of Ratings (1913-2014)"
        p = plt("rating", binw=0.3, xlab="rating", main=title2, add_vline_mean=T) 
        p = ezplot::web_display(p)
        print(p)
        
        # plot median ratings over the years
        plt = ezplot::mk_lineplot(rating_stats_by_year)
        start = min(dat$year)
        end = max(dat$year)
        title3 = "Median Ratings (1913-2014)"
        p = plt("year", "med_rating", ylab="rating scale", main=title3)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10)) +
                ggplot2::scale_y_continuous(limits = c(1, 10), 
                                            breaks = seq(1, 10, 1))
        p = ezplot::web_display(p)
        print(p)
        
        # plot distributions of ratings over the years
        plt = ezplot::mk_boxplot(dat)
        cbPalette = ezplot::cb_color("cb_gray") # use color-blind friendly palettes
        title4 = "Distribution of Ratings Aggregated for 4 Periods (1913-2014)"
        p = plt("year_cat", "rating", ylab="rating", main=title4) +
                ggplot2::scale_fill_manual(values=cbPalette)
        p = ezplot::web_display(p, legend_pos="none")
        print(p)
        
        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]
        
        # create data.frame to hold message and run time
        stats = data.frame(tab="rating-n-votes-per-rating", msg="success", 
                           seconds=runtime)
        
        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3, title4)
        plt_tabs = c("Distribution of Votes", "Distribution of Ratings",
                     "Distribution of Ratings", "Distribution of Ratings")
        plts = data.frame(tab=plt_tabs, title=plt_titles, 
                          n=1:4, has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
