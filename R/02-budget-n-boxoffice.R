#' @title Generate descriptive plots for budget and boxoffice
#'
#' @param NULL
#' @return 8 ggplot2 plots
#' @export
plot_budget_n_boxoffice = function() {
        t0 = proc.time()

        dat_long = tidyr::gather(dat[c("year_cat", "budget", "boxoffice")],
                                 type, val, -year_cat)

        # create function to do boxplot
        plt = ezplot::mk_boxplot(dat_long)

        # plot distributions of budget and boxoffice over the years
        p = plt("year_cat", "val", "type")
        p = ezplot::add_labs(
                p, ylab = "USD",
                title = "Distribution of Budget and Boxoffice (1913 - 2014)")
        p = ezplot::scale_axis(p, scale = "log10")
        p = ezplot::web_display(p, legend_title = F)
        print(p)

        # make function to plot by_year data
        plt = ezplot::mk_lineplot(btbo_by_year)

        # plot total budget and boxoffice over the years
        p = plt("year", "tot", "type", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "($Billion)", xlab = NULL,
                title = "Total Budget and Boxoffice (1913 - 2014)")
        p = ezplot::web_display(p, legend_title = F)
        print(p)

        # plot average budget and boxoffice over the years
        p = plt("year", "avg", "type", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "Average per film ($million)", xlab = NULL,
                title = "Average Budget and Boxoffice (1913 - 2014)")
        p = ezplot::web_display(p, legend_title = F)
        print(p)

        # plot boxoffice/budget ratio over the years
        plt = ezplot::mk_lineplot(bo_bt_ratio_by_year)
        p = plt("year", "bo_bt_ratio", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "Multiple", xlab = NULL,
                title = "Boxoffice/Budget (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)

        # make function to plot by_yearcat data
        plt = ezplot::mk_lineplot(btbo_by_yearcat)

        # plot total buget and boxoffice over year_cat
        p = plt("year_cat", "tot", "type", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "($billion)", xlab = NULL,
                title = "Total Budget and Boxoffice (1913 - 2014)"
                )
        p = ezplot::web_display(p, legend_title = F)
        print(p)

        # plot average buget and boxoffice over the years
        p = plt("year_cat", "avg", "type", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "Average per film ($million)", xlab = NULL,
                title = "Average Budget and Boxoffice (1913 - 2014)"
                )
        p = ezplot::web_display(p, legend_title = F)
        print(p)

        # plot boxoffice/budget ratio over the years
        plt = ezplot::mk_lineplot(bo_bt_ratio_by_yearcat)
        p = plt("year_cat", "bo_bt_ratio", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "Multiple", xlab = NULL,
                title = "Boxoffice/Budget (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)


        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]

        # create data.frame to hold message and run time
        stats = data.frame(tab="budget-n-boxoffice", msg="success",
                           seconds=runtime)

        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3, title4, title5, title6,
                       title7, title8)
        plt_tabs = c("Distribution", "Distribution", "Total & Average",
                     "Total & Average", "Boxoffice/Budget Ratio",
                     "Total & Average", "Total & Average", "Boxoffice/Budget Ratio")
        plts = data.frame(tab=plt_tabs, title=plt_titles, n=1:8,
                          has_caption=FALSE, caption="")

        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)
}
