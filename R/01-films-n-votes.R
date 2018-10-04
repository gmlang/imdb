#' @title Generate descriptive plots for film and vote counts
#' 
#' @param NULL
#' @return 6 ggplot2 objects
#' @export
plot_films_n_votes = function() {
        t0 = proc.time()
        
        # make function to plot by_year data
        plt = ezplot::mk_lineplot(films_n_votes_by_year)
        
        # plot number of films over the years
        p = plt("year", "films", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(p, ylab = "Count", 
                             title = "Number of films (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)
        
        # plot number of votes over the years
        p = plt("year", "votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(p, ylab = "Count (in million)", 
                             title = "Number of votes (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)
        
        # plot average number of votes (per film) over the years
        p = plt("year", "avg_votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(p, ylab = "Votes per film (in thousand)",
                             title = "Average votes per film (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)
        
        # make function to plot by_yearcat data
        plt = ezplot::mk_lineplot(films_n_votes_by_yearcat)
        
        # plot number of films over year_cat
        p = plt("year", "films", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(p, ylab = "Count", 
                             title = "Number of films (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)
        
        # plot number of votes over year_cat
        p = plt("year", "votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(p, ylab = "Count (in millions)", 
                             title = "Number of votes (1913 - 2014)")
        p = ezplot::web_display(p)
        print(p)
        
        # plot average number of votes (per film) over year_cat
        p = plt("year", "avg_votes", linew = 1.2, pt_size = 3)
        p = ezplot::add_labs(p, ylab = "Votes per film (in thousands)",
                             title = "Average votes per film (1913 - 2014)")
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

