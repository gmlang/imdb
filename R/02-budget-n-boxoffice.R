#' Generate some descriptive plots for budget and boxoffice over the years
#' 
#' @return 8 ggplot2 plots
#' @export
plot_budget_n_boxoffice = function() {
        t0 = proc.time()
        
        # create function to do boxplot 
        plt = ezplot::mk_boxplot(dat)
        start = min(dat$year)
        end = max(dat$year)
        
        # plot distributions of budget over the years
        title1 = "Distribution of Budget (1913 - 2014)"
        p = plt("year", "budget", ylab="budget", main=title1, ylog10=T)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        p = ezplot::web_display(p)
        print(p)
        
        # plot distributions of boxoffice over the years
        title2 = "Distribution of Boxoffice (1913 - 2014)"
        p = plt("year", "boxoffice", ylab="boxoffice", main=title2, ylog10=T)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        p = ezplot::web_display(p)
        print(p)
        
        # make function to plot by_year data
        plt = ezplot::mk_lineplot(btbo_by_year)
        
        # plot total budget and boxoffice over the years
        title3 = "Annual Total Budget and Boxoffice (1913 - 2014)"
        p = plt("year", "tot", "type", ylab="total amount ($billion)",
                main=title3, linew=1.2, pt_size=3)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        p = ezplot::web_display(p, legend_title=F)
        print(p)
        
        # plot average budget and boxoffice over the years
        title4 = "Annual Average Budget and Boxoffice (1913 - 2014)"
        p = plt("year", "avg", "type", ylab="average amount per film ($million)",
                main=title4, linew=1.2, pt_size=3)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        p = ezplot::web_display(p, legend_title=F)
        print(p)
        
        # plot boxoffice/budget ratio over the years
        plt = ezplot::mk_lineplot(bo_bt_ratio_by_year)
        title5 = "Boxoffice/Budget Ratio (1913 - 2014)"
        p = plt("year", "bo_bt_ratio", ylab="boxoffice/budget ratio", ylog10=T,
                main=title5, linew=1.2, pt_size=3)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        p = ezplot::web_display(p)
        print(p)
        
        # make function to plot by_yearcat data
        plt = ezplot::mk_lineplot(btbo_by_yearcat)
        
        # plot total buget and boxoffice over year_cat
        title6 = "Total Budget and Boxoffice Aggregated for 4 Periods (1913 - 2014)"
        p = plt("year_cat", "tot", "type", main=title6, linew=1.2, pt_size=3,
                ylab="total amount ($billion)")
        p = ezplot::web_display(p, legend_title=F)
        print(p)
        
        # plot average buget and boxoffice over the years
        title7 = "Average Budget and Boxoffice Aggregated for 4 Periods (1913 - 2014)"
        p = plt("year_cat", "avg", "type", main=title7, linew=1.2, pt_size=3,
                ylab="average amount per film ($million)")
        p = ezplot::web_display(p, legend_title=F)
        print(p)
        
        # plot boxoffice/budget ratio over the years
        plt = ezplot::mk_lineplot(bo_bt_ratio_by_yearcat)
        title8 = "Boxoffice/Budget Ratio for 4 Periods (1913 - 2014)"
        p = plt("year_cat", "bo_bt_ratio", ylab="boxoffice/budget ratio", 
                main=title8, linew=1.2, pt_size=3)
        p = p + ggplot2::scale_y_continuous(limit=c(0,14), breaks=seq(0, 14, 2))
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

        plts = data.frame(tab="budget-n-boxoffice", title=plt_titles, n=1:8, 
                          has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
