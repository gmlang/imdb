#' @title Generate exploratory plots for boxoffice/budget ratio vs. other variables
#' 
#' @return 15 ggplot2 objects
#' @export
plot_bo_bt_ratio_vs_others = function() {
        t0 = proc.time()
        
        # get starting and ending years
        start = min(dat$year)
        end = max(dat$year)
        
        # create function to do scatter plot
        plt = ezplot::mk_scatterplot(dat)
        
        # plot bo_bt_ratio over the years
        title1 = "Boxoffice/Budget Ratio (1913-2014)"
        p = plt("year", "bo_bt_ratio", fillby = "made_money", main=title1,
                ylab = "boxoffice/budget ratio", pt_size=1.5, pt_alpha=0.7, 
                add_line=T)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::web_display(p)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        print(p)
        
        # plot bo_bt_ratio vs. budget
        title2 = "Boxoffice/Budget Ratio vs. Budget (1913-2014)"
        p = plt("budget", "bo_bt_ratio", fillby = "made_money", main=title2,
                xlab="budget (in US Dollars)", ylab="boxoffice/budget ratio", 
                pt_size=1.5, pt_alpha=0.7, add_line=T)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::scale_axis(p, "x", use_log10=T)
        p = ezplot::web_display(p)
        print(p)
        
        # plot bo_bt_ratio vs. votes
        title3 = "Boxoffice/Budget Ratio vs. Votes (1913-2014)"
        p = plt("votes", "bo_bt_ratio", fillby = "made_money", main=title3, 
                xlab="number of votes", ylab="boxoffice/budget ratio", 
                pt_size=1.5, pt_alpha=0.7, add_line=T)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::scale_axis(p, "x", use_log10=T)
        p = ezplot::web_display(p)
        print(p)
        
        # plot bo_bt_ratio vs. rating
        title4 = "Boxoffice/Budget Ratio vs. Rating (1913-2014)"
        p = plt("rating", "bo_bt_ratio", fillby = "made_money", 
                ylab="boxoffice/budget ratio", 
                xlab="average imdb user rating (the higher, the better)",
                main=title4, pt_size=1.5, pt_alpha=0.7, add_line=T)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::web_display(p)
        print(p)
        
        # create function to do boxplot
        plt = ezplot::mk_boxplot(dat)
        
        # plot bo_bt_ratio vs. mpaa
        title5 = "Boxoffice/Budget Ratio vs. MPAA (1913-2014)"
        p = plt("mpaa", "bo_bt_ratio", ylab="boxoffice/budget ratio", 
                main=title5, legend=F)
        p = ezplot::scale_axis(p, use_log10=T)
        p = ezplot::web_display(p)
        print(p)
        
        # plot bo_bt_ratio vs. genre
        genres = c("drama", "comedy", "thriller", "romance", "action", "crime", 
                   "adventure", "sci_fi", "horror", "family")
        
        titles = rep(NA, length(genres))
        names(titles) = genres
        for (genre_var in genres) {        
                title = paste("Boxoffice/Budget Ratio vs.", genre_var, "(1913-2014)")
                p = plt(genre_var, "bo_bt_ratio", xlab = genre_var,
                        ylab="boxoffice/budget ratio", main=title, legend=F)
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
        stats = data.frame(tab="bo_bt_ratio_vs_others", msg="success", 
                           seconds=runtime)
        
        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3, title4, title5, titles)
        plt_tabs = c("Boxoffice/Budget Ratio", "Boxoffice/Budget vs. Budget", 
                     "Boxoffice/Budget vs. Votes", "Boxoffice/Budget vs. Rating", 
                     "Boxoffice/Budget vs. MPAA", 
                     rep("Boxoffice/Budget vs. Genre", length(titles)))
        plts = data.frame(tab=plt_tabs, title=plt_titles, 
                          n=1:length(plt_titles), has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
