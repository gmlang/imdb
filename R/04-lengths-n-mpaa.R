#' @title Generate descriptive plots for ratings and votes per rating
#'
#' @return 2 ggplot2 objects
#' @export
plot_length_n_mpaa = function() {
        t0 = proc.time()

        # plot histogram to show the distribution of lengths
        plt = ezplot::mk_histogram(dat)
        p = plt("length")
        p = ezplot::add_labs(p, xlab = "Minutes",
                             title = "Distribution of film lengths")
        p = ezplot::web_display(p)
        print(p)

        # plot distribution of mpaa ratings
        plt = ezplot::mk_barplot_freq(dat)
        p = plt("mpaa", show_pct = T)
        p = ezplot::add_labs(p, title = "Distribution of MPAA ratings")
        p = ezplot::web_display(p)
        print(p)

        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]

        # create data.frame to hold message and run time
        stats = data.frame(tab="length-n-mpaa", msg="success", seconds=runtime)

        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2)
        plt_tabs = c("Film Lengths", "MPAA")
        plts = data.frame(tab=plt_tabs, title=plt_titles,
                          n=1:2, has_caption=FALSE, caption="")

        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)
}
