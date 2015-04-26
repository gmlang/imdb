#' @title Generate descriptive plots for ratings and votes per rating
#' 
#' @return 3 ggplot2 objects
#' @export
plot_ratings = function() {
        t0 = proc.time()
        
        # plot stacked barcharts to show the distribution of votes 
        # for each rating r1-10
        plt = ezplot::mk_barplot(votes_per_rating)
        title1 = "Distribution of Votes at Each Rating r1-10 (1913-2014)"
        p = plt("rating", "val", "votes", main=title1) 
        p = ezplot::scale_axis(p, "y", use_pct=T)
        p = p + ggplot2::scale_fill_brewer(palette="Spectral")
        p = ezplot::web_display(p, legend_title=F)
        print(p)
        
        # plot ratings distribution
        plt = ezplot::mk_distplot(dat)
        title2 = "Distribution of Ratings (1913-2014)"
        p = plt("rating", binw=0.3, main=title2, add_vline_mean=T) 
        p = ezplot::web_display(p)
        print(p)
        
        # plot distributions of ratings over the years
        plt = ezplot::mk_boxplot(dat)
        cbPalette = ezplot::palette("cb_gray") # use color-blind friendly palettes
        title3 = "Distribution of Ratings Aggregated for 4 Periods (1913-2014)"
        p = plt("year_cat", "rating", ylab="rating", main=title3) +
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
        plt_titles = c(title1, title2, title3)

        plts = data.frame(tab="rating-n-votes-per-rating", title=plt_titles, 
                          n=1:3, has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
