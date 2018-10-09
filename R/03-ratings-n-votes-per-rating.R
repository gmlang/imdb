#' @title Generate descriptive plots for ratings and votes per rating
#'
#' @return 4 ggplot2 objects
#' @export
plot_ratings = function() {
        t0 = proc.time()

        # plot heatmap to show the distribution of votes
        # for each rating r1-10
        plt = ezplot::mk_heatmap(votes_per_rating)
        p = plt("rating", "votes", "val", palette = "D")
        p = ezplot::add_labs(
                p, title = "Distribution of votes at each rating r1-10 (1913-2014)")
        p = ezplot::web_display(p, legend_title = F)
        print(p)

        # plot ratings distribution
        plt = ezplot::mk_densityplot(dat)
        p = plt("rating", cut_tail = 0)
        p = ezplot::add_labs(
                p, title = "Distribution of users' average ratings (1913-2014)")
        p = ezplot::web_display(p)
        print(p)

        # plot median ratings over the years
        plt = ezplot::mk_lineplot(rating_stats_by_year)
        p = plt("year", "med_rating")
        p = ezplot::add_labs(p, ylab = "rating scale",
                             xlab = NULL, subtitle = NULL,
                             title = "Median Rating (1913-2014)")
        p = ezplot::web_display(p)
        print(p)

        # plot distributions of ratings over the years
        plt = ezplot::mk_boxplot(dat)
        p = plt("year_cat", "rating scale")
        p = ezplot::add_labs(
                p, ylab = "rating",
                title = "Distribution of users' ratings (1913-2014)")
        p = ezplot::web_display(p)
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
