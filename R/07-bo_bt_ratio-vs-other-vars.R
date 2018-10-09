#' @title Generate exploratory plots for boxoffice/budget ratio vs. other variables
#'
#' @return 15 ggplot2 objects
#' @export
plot_bo_bt_ratio_vs_others = function() {
        t0 = proc.time()

        # create function to do scatter plot
        plt = ezplot::mk_scatterplot(dat)

        # plot bo_bt_ratio over the years
        p = plt("year", "bo_bt_ratio", fillby = "made_money", pt_size=1.5,
                alpha = 0.2)
        p = ezplot::add_labs(p, ylab = "boxoffice/budget", xlab = NULL,
                             title = "Boxoffice/Budget (1913-2014)")
        p = ezplot::add_lm_line(p, pval_xpos = "left")
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::web_display(p)
        print(p)

        # plot bo_bt_ratio vs. budget
        p = plt("budget", "bo_bt_ratio", fillby = "made_money", pt_size = 1.5,
                alpha = 0.2)
        p = ezplot::add_labs(p, ylab = "boxoffice/budget",
                             xlab = "budget (in USD)",
                             title = "Boxoffice/Budget vs. Budget (1913-2014)")
        p = ezplot::add_lm_line(p, pval_xpos = "left")
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::scale_axis(p, "x", scale="log10")
        p = ezplot::web_display(p)
        print(p)

        # plot bo_bt_ratio vs. votes
        p = plt("votes", "bo_bt_ratio", fillby = "made_money",
                pt_size = 1.5, alpha = 0.2)
        p = ezplot::add_labs(p, ylab="boxoffice/budget", xlab="number of votes",
                             title = "Boxoffice/Budget vs. Votes (1913-2014)")
        p = ezplot::add_lm_line(p, pval_xpos = "left")
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::scale_axis(p, "x", scale="log10")
        p = ezplot::web_display(p)
        print(p)

        # plot bo_bt_ratio vs. rating
        p = plt("rating", "bo_bt_ratio", fillby = "made_money",
                pt_size = 1.5, alpha = 0.2)
        p = ezplot::add_labs(p, ylab = "boxoffice/budget",
                             xlab = "average user rating",
                             title = "Boxoffice/Budget vs. Rating (1913-2014)")
        p = ezplot::add_lm_line(p, pval_xpos = "left")
        p = ezplot::scale_axis(p, scale="log10")
        p = ezplot::web_display(p)
        print(p)

        # create function to do boxplot
        plt = ezplot::mk_boxplot(dat)

        # plot bo_bt_ratio vs. mpaa
        p = plt("mpaa", "bo_bt_ratio")
        p = ezplot::add_labs(p, ylab = "boxoffice/budget",
                             title = "Boxoffice/Budget vs. MPAA (1913-2014)")
        p = ezplot::scale_axis(p, scale = "log10")
        p = ezplot::web_display(p)
        print(p)

        # plot bo_bt_ratio vs. genre
        genres = c("drama", "comedy", "thriller", "romance", "action", "crime",
                   "adventure", "sci_fi", "horror", "family")

        titles = rep(NA, length(genres))
        names(titles) = genres
        for (genre_var in genres) {
                tit = paste("Boxoffice/Budget vs.", genre_var, "(1913-2014)")
                p = plt(genre_var, "bo_bt_ratio")
                p = ezplot::add_labs(p, xlab = genre_var,
                                     ylab = "boxoffice/budget",
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
