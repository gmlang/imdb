#' @title Generate exploratory plots for boxoffice vs. other variables
#'
#' @return 14 ggplot2 objects
#' @export
plot_bo_vs_others = function() {
        t0 = proc.time()

        # create function to do scatter plot
        plt = ezplot::mk_scatterplot(dat)

        # plot boxoffice vs. budget
        p = plt("budget", "boxoffice", pt_size = 1.5, alpha = 0.2)
        p = ezplot::add_labs(p, xlab = "Budget (in USD)",
                             ylab = "Boxoffice (in USD)",
                             title = "Boxoffice vs. Budget (1913-2014)")
        p = ezplot::scale_axis(p, scale = "log10")
        p = ezplot::scale_axis(p, "x", scale="log10")
        p = ezplot::add_lm_line(p)
        p = ezplot::web_display(p)
        print(p)

        # plot boxoffice vs. votes
        p = plt("votes", "boxoffice", pt_size = 1.5, alpha = 0.2)
        p = ezplot::add_labs(p, xlab = "Number of votes",
                             ylab = "Boxoffice (in USD)",
                             title = "Boxoffice vs. Votes (1913-2014)"
                             )
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::scale_axis(p, "x", scale="log10")
        p = ezplot::add_lm_line(p)
        p = ezplot::web_display(p)
        print(p)

        # plot boxoffice vs. rating
        p = plt("rating", "boxoffice", pt_size = 1.5, alpha = 0.2)
        p = ezplot::add_labs(p, ylab = "Boxoffice (in USD)",
                             xlab = "Average user rating",
                             title = "Boxoffice vs. Rating (1913-2014)")
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::add_lm_line(p)
        p = ezplot::web_display(p)
        print(p)

        # create function to do boxplot
        plt = ezplot::mk_boxplot(dat)

        # plot boxoffice vs. mpaa
        p = plt("mpaa", "boxoffice")
        p = ezplot::add_labs(p, ylab = "Boxoffice (in USD)",
                             title = "Boxoffice vs. MPAA (1913-2014)")
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::add_lm_line(p)
        p = ezplot::web_display(p)
        print(p)

        # plot boxoffice vs. genre
        genres = c("drama", "comedy", "thriller", "romance", "action", "crime",
                   "adventure", "sci_fi", "horror", "family")

        titles = rep(NA, length(genres))
        names(titles) = genres
        for (genre_var in genres) {
                tit = paste("Boxoffice vs.", genre_var, "(1913-2014)")
                p = plt(genre_var, "boxoffice")
                p = ezplot::add_labs(p, xlab = genre_var,
                                     ylab = "Boxoffice (in USD)",
                                     title = tit)
                p = ezplot::scale_axis(p, scale = "log10")
                p = ezplot::web_display(p)
                print(p)
                titles[genre_var] = tit
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
