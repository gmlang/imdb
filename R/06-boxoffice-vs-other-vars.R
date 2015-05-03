#' @title Generate descriptive plots for genres
#' 
#' @return 3 ggplot2 objects
#' @export
plot_bo_vs_others = function() {
        t0 = proc.time()
        
        # create function to do scatter plot
        plt = ezplot::mk_scatterplot(dat)
        
        # plot boxoffice vs. budget
        title1 = "Boxoffice vs. Budget (1913-2014)"
        p = plt("budget", "boxoffice", xlab="budget (in US Dollars)", main=title1,
                ylab="boxoffice (in US Dollars)", pt_size=1.5, pt_alpha=0.7)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::scale_axis(p, "x", use_log10=T)
        p = ezplot::web_display(p)
        p = p + ggplot2::geom_smooth(method="lm", se=T, 
                                     color=ezplot::palette("cb_black")[2])
        print(p)
        
        # plot boxoffice vs. votes
        title2 = "Boxoffice vs. Votes (1913-2014)"
        p = plt("votes", "boxoffice", xlab="number of votes", main=title2, 
                ylab="boxoffice (in US Dollars)", pt_size=1.5, pt_alpha=0.7)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::scale_axis(p, "x", use_log10=T)
        p = ezplot::web_display(p)
        p = p + ggplot2::geom_smooth(method="lm", se=T, 
                                     color=ezplot::palette("cb_black")[2])
        print(p)
        
        # plot boxoffice vs. rating
        title3 = "Boxoffice vs. Rating (1913-2014)"
        p = plt("rating", "boxoffice", ylab="boxoffice (in US Dollars)", main=title3, 
                xlab="average imdb user rating (the higher, the better)", 
                pt_size=1.5, pt_alpha=0.7)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::web_display(p)
        p = p + ggplot2::geom_smooth(method="lm", se=T, 
                                     color=ezplot::palette("cb_black")[2])
        print(p)
        
        # create function to do boxplot
        plt = ezplot::mk_boxplot(dat)
        
        # plot boxoffice vs. mpaa
        title4 = "Boxoffice vs. MPAA (1913-2014)"
        p = plt("mpaa", "boxoffice", ylab="boxoffice (in US Dollars)", main=title4, 
                legend=T)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::web_display(p)
        print(p)
        
        # plot boxoffice vs. genre
        genres = c("drama", "comedy", "thriller", "romance", "action", "crime", 
                   "adventure", "sci_fi", "horror", "family")
        
        titles = rep(NA, length(genres))
        names(titles) = genres
        for (genre_var in genres) {        
                title = paste("Boxoffice vs.", genre_var, "(1913-2014)")
                p = plt(genre_var, "boxoffice", ylab="boxoffice (in US Dollars)", 
                        main=title, legend=T)
                p = ezplot::scale_axis(p, use_log10=T)
                p = ezplot::web_display(p)
                print(p)
                
                titles[genre_var] = title
        }
        
        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]
        
        # create data.frame to hold message and run time
        stats = data.frame(tab="bo_vs_others", msg="success", seconds=runtime)
        
        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3, titles)
        plts = data.frame(tab="bo_vs_others", title=plt_titles, 
                          n=1:length(plt_titles), has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
