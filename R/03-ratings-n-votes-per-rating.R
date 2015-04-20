#' @title Generate descriptive plots for ratings and votes per rating
#' 
#' @return ggplot2 objects
#' @export
plot_ratings = function() {
        t0 = proc.time()
        
        # plot stacked barcharts to show the distribution of votes 
        # for each rating r1-10
        plt = mk_barplot(votes_per_rating)
        p = plt("rating", "val", "votes", legend=lookup, 
                main="Distribution of Votes for Each Rating")
        print(p)
        
        # plot ratings distribution
        plt = mk_dist_plt(dat)
        p = plt("rating", "")
        print(p)
        
#         # create function to do boxplot 
#         plt = cabaceo::mk_box_plt(dat)
#         start = min(dat$year)
#         end = max(dat$year)
#         
#         # plot distributions of budget over the years
#         title1 = "Annual Distribution of Budget from 1913 to 2014"
#         p = plt("year", "budget", "year", ylab="budget", ylog10=T)
#         p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
#                                             breaks = seq(start, end, 10))
#         print(p)
#         
#         # plot distributions of boxoffice over the years
#         title2 = "Annual Distribution of Boxoffice from 1913 to 2014"
#         p = plt("year", "boxoffice", "year", ylab="boxoffice", ylog10=T)
#         p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
#                                             breaks = seq(start, end, 10))
#         print(p)
#         
#         # make function to plot by_year data
#         plt = cabaceo::mk_multiline_plt(btbo_by_year)
#         
#         # plot total budget and boxoffice over the years
#         title3 = "Annual Total Budget and Boxoffice from 1913 to 2014"
#         p = plt("year", "tot", "type", ylab="total amount ($billion)")
#         p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
#                                             breaks = seq(start, end, 10))
#         print(p)
#         
#         # plot average budget and boxoffice over the years
#         title4 = "Annual Average Budget and Boxoffice from 1913 to 2014"
#         p = plt("year", "avg", "type", ylab="average amount per film ($million)")
#         p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
#                                             breaks = seq(start, end, 10))
#         print(p)
#         
#         # plot boxoffice/budget ratio over the years
#         plt = cabaceo::mk_line_plt(bo_bt_ratio_by_year)
#         title5 = "Boxoffice/Budget Ratio from 1913 to 2014"
#         p = plt("year", "bo_bt_ratio", ylab="boxoffice/budget ratio", ylog10=T)
#         p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
#                                             breaks = seq(start, end, 10))
#         print(p)
#         
#         # make function to plot by_yearcat data
#         plt = cabaceo::mk_multiline_plt(btbo_by_yearcat)
#         
#         # plot total buget and boxoffice over year_cat
#         title6 = "Total Budget and Boxoffice Aggregated for 4 Periods between 1913 and 2014"
#         p = plt("year_cat", "tot", "type", 
#                 ylab="total amount ($billion)", draw_pt=T)
#         print(p)
#         
#         # plot average buget and boxoffice over the years
#         title7 = "Average Budget and Boxoffice Aggregated for 4 Periods between 1913 and 2014"
#         p = plt("year_cat", "avg", "type", 
#                 ylab="average amount per film ($million)", draw_pt = T)
#         print(p)
#         
#         # plot boxoffice/budget ratio over the years
#         plt = cabaceo::mk_line_plt(bo_bt_ratio_by_yearcat)
#         title8 = "Boxoffice/Budget Ratio for 4 Periods between 1913 and 2014"
#         p = plt("year_cat", "bo_bt_ratio", ylab="boxoffice/budget ratio", 
#                 draw_pt=T)
#         p = p + ggplot2::scale_y_continuous(limit=c(0,14), breaks=seq(0, 14, 2))
#         print(p)
        
        
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
