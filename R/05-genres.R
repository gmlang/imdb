#' @title Generate descriptive plots for genres
#'
#' @return 3 ggplot2 objects
#' @export
plot_genre = function() {
        t0 = proc.time()

        # plot bar charts to show the overall percent of films by genre
        plt = ezplot::mk_barploth_resp(films_by_genre)
        p = plt("pct", "genre", label_size = 0, show_pct = T)
        p = ezplot::add_labs(
                p, title = "Percent of films by genre", xlab = NULL)
        # p = ezplot::web_display(p)
        print(p)

        # plot heatmap to show the top 5 genres for each period
        plt = ezplot::mk_heatmap(top5genres_by_yearcat)
        p = plt("year_cat", "genre", fillby = "pct")
        p = ezplot::add_labs(
                p, title = "Percent of Top 5 Genres (1913-2014)")
        p = ezplot::web_display(p, 12)
        print(p)

        # plot line charts to show the top 10 genres over each year
        plt = ezplot::mk_lineplot(top_genres_by_year_long)
        p = plt("year", "cnt", fillby = "genre")
        p = ezplot::add_labs(
                p, xlab = NULL, ylab = "Frequency",
                title = "Frequencies of top 10 genres (1913-2014)")
        p = ezplot::web_display(p)
        print(p)

        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]

        # create data.frame to hold message and run time
        stats = data.frame(tab="genre", msg="success", seconds=runtime)

        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3)
        plt_tabs = c("Genre")
        plts = data.frame(tab=plt_tabs, title=plt_titles,
                          n=1:3, has_caption=FALSE, caption="")

        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)
}
