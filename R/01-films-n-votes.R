#' @title Generate descriptive plots for film and vote counts
#' 
#' @param NULL
#' @return 6 ggplot2 objects
#' @export
plot_films_n_votes = function() {
        t0 = proc.time()
        
        # make function to plot by_year data
        plt = ezplot::mk_lineplot(films_n_votes_by_year)
        # start = min(films_n_votes_by_year$year)
        # end = max(films_n_votes_by_year$year)
        
        # plot number of films over the years
        p = plt("year", "films", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "number of films", 
                title = "Annual Total Number of Films (1913 - 2014)")
        
        # title1 = "Annual Total Number of Films (1913 - 2014)"
        # ymin = min(films_n_votes_by_year$films)
        # ymax = max(films_n_votes_by_year$films)
        # p = plt("year", "films", ylab="number of films", main=title1, 
        #         linew=1.2, pt_size=3)
        # p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
        #                                     breaks = seq(start, end, 10)) + 
        #         ggplot2::scale_y_continuous(limits = c(0, ymax), 
        #                                     breaks = seq(0, ymax, 50))
        
        p = ezplot::web_display(p)
        print(p)
        
        # plot number of votes over the years
        p = plt("year", "votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "number of votes (in million)", 
                title = "Annual Total Number of Votes (1913 - 2014)")
        
        # title2 = "Annual Total Number of Votes (1913 - 2014)"
        # p = plt("year", "votes", ylab="number of votes (in million)", 
        #         main=title2, linew=1.2, pt_size=3)
        # p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
        #                                     breaks = seq(start, end, 10))
        p = ezplot::web_display(p)
        print(p)
        
        # plot average number of votes (per film) over the years
        p = plt("year", "avg_votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "average number of votes per film (in thousand)",
                title = "Annual Average Number of Votes (1913 - 2014)")
        
        # title3 = "Annual Average Number of Votes (1913 - 2014)"
        # p = plt("year", "avg_votes", main=title3, linew=1.2, pt_size=3,
        #         ylab="average number of votes per film (in thousand)")
        # p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
        #                                     breaks = seq(start, end, 10))
        p = ezplot::web_display(p)
        print(p)
        
        # make function to plot by_yearcat data
        plt = ezplot::mk_lineplot(films_n_votes_by_yearcat)
        
        # plot number of films over year_cat
        p = plt("year", "films", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "number of films", 
                title = "Number of Films Aggregated for 4 Periods (1913 - 2014)")
        # ymin = min(films_n_votes_by_yearcat$films)
        # ymax = max(films_n_votes_by_yearcat$films)
        # p = plt("year", "films", ylab = "number of films", main=title4,
        #         linew=1.2, pt_size=3)
        # p = p + ggplot2::scale_y_continuous(limits = c(ymin, ymax), 
        #                         breaks = c(ymin, seq(1000, 4000, 1000), ymax),
        #                         labels = scales::comma)
        p = ezplot::web_display(p)
        print(p)
        
        # plot number of votes over year_cat
        p = plt("year", "votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "number of votes (in millions)", 
                title = "Total Number of Votes Aggregated for 4 Periods (1913 - 2014)")
        # title5 = "Total Number of Votes Aggregated for 4 Periods (1913 - 2014)"
        # ymin = min(films_n_votes_by_yearcat$votes)
        # ymax = max(films_n_votes_by_yearcat$votes)
        # p = plt("year", "votes", ylab = "number of votes (in millions)", 
        #         main=title5, linew=1.2, pt_size=3)
        # p = p + ggplot2::scale_y_continuous(limits = c(ymin, ymax), 
        #                 breaks = c(round(ymin), seq(50, 200, 50), round(ymax)))
        p = ezplot::web_display(p)
        print(p)
        
        # plot average number of votes (per film) over year_cat
        p = plt("year", "avg_votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(
                p, ylab = "avg number of votes per film (in thousands)",
                title = "Average Number of Votes Aggregated for 4 Periods (1913 - 2014)")
        # title6 = "Average Number of Votes Aggregated for 4 Periods (1913 - 2014)"
        # ymin = min(films_n_votes_by_yearcat$avg_votes)
        # ymax = max(films_n_votes_by_yearcat$avg_votes)
        # p = plt("year", "avg_votes", main=title6, linew=1.2, pt_size=3,
        #         ylab = "avg number of votes per film (in thousands)")
        # p = p + ggplot2::scale_y_continuous(limits = c(ymin, ymax), 
        #                 breaks = c(round(ymin), seq(20, 50, 10), round(ymax)))
        p = ezplot::web_display(p)
        print(p)
        
        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]
        
        # create data.frame to hold message and run time
        stats = data.frame(tab="films-n-votes", msg="success", seconds=runtime)
        
        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3, title4, title5, title6)
        plt_tabs = c("Number of Films", "Number of Votes", "Average Number of Votes",
                     "Number of Films", "Number of Votes", "Average Number of Votes")
        plts = data.frame(tab=plt_tabs, title=plt_titles, n=1:6, 
                          has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}

