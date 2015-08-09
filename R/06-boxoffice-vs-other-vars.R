#' @title Generate exploratory plots for boxoffice vs. other variables
#' 
#' @return 14 ggplot2 objects
#' @export
plot_bo_vs_others = function() {
        t0 = proc.time()
        
        # get color-blind friendly colors
        purple = ezplot::cb_color("reddish_purple")
        green = ezplot::cb_color("bluish_green")
        red = ezplot::cb_color("vermilion")
        blue = ezplot::cb_color("blue")
        orange = ezplot::cb_color("orange")
        
        # create function to do scatter plot
        plt = ezplot::mk_scatterplot(dat)
        
        # plot boxoffice vs. budget
        title1 = "Boxoffice vs. Budget (1913-2014)"
        p = plt("budget", "boxoffice", xlab="budget (in US Dollars)", 
                main=title1, ylab="boxoffice (in US Dollars)", pt_size=1.5, 
                pt_alpha=0.7, add_line=T)
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::scale_axis(p, "x", scale="log10")
        p = ezplot::web_display(p)
        print(p)
        
        # plot boxoffice vs. votes
        title2 = "Boxoffice vs. Votes (1913-2014)"
        p = plt("votes", "boxoffice", xlab="number of votes", main=title2, 
                ylab="boxoffice (in US Dollars)", pt_size=1.5, pt_alpha=0.7,
                add_line=T)
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::scale_axis(p, "x", scale="log10")
        p = ezplot::web_display(p)
        print(p)
        
        # plot boxoffice vs. rating
        title3 = "Boxoffice vs. Rating (1913-2014)"
        p = plt("rating", "boxoffice", ylab="boxoffice (in US Dollars)", 
                xlab="average imdb user rating (the higher, the better)", 
                main=title3, pt_size=1.5, pt_alpha=0.7, add_line=T)
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::web_display(p)
        print(p)
        
        # create function to do boxplot
        plt = ezplot::mk_boxplot(dat)
        
        # plot boxoffice vs. mpaa
        title4 = "Boxoffice vs. MPAA (1913-2014)"
        p = plt("mpaa", "boxoffice", ylab="boxoffice (in US Dollars)", 
                main=title4, legend=F)
        p = p + ggplot2::scale_fill_manual(values = c(purple, green, red, 
                                                      blue, orange))
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::web_display(p)
        print(p)
        
        # plot boxoffice vs. genre
        genres = c("drama", "comedy", "thriller", "romance", "action", "crime", 
                   "adventure", "sci_fi", "horror", "family")
        
        titles = rep(NA, length(genres))
        names(titles) = genres
        for (genre_var in genres) {        
                title = paste("Boxoffice vs.", genre_var, "(1913-2014)")
                p = plt(genre_var, "boxoffice", xlab = genre_var,
                        ylab="boxoffice (in US Dollars)", main=title, legend=F)
                p = p + ggplot2::scale_color_manual(values = c(purple, green))
                p = ezplot::scale_axis(p, scale="log10")
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
        plt_titles = c(title1, title2, title3, title4, titles)
        plt_tabs = c("Boxoffice vs. Budget", "Boxoffice vs. Votes", 
                     "Boxoffice vs. Rating", "Boxoffice vs. MPAA", 
                     rep("Boxoffice vs. Genre", length(titles)))
        plts = data.frame(tab=plt_tabs, title=plt_titles, 
                          n=1:length(plt_titles), has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
