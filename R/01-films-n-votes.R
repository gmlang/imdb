#' Generate some descriptive plots for film and vote counts over the years
#' 
#' @return 6 ggplot2 plots
#' @export
plot_films_n_votes = function() {
        t0 = proc.time()
        
        # make function to plot by_year data
        plt = cabaceo::mk_line_plt(films_n_votes_by_year)
        start = min(films_n_votes_by_year$year)
        end = max(films_n_votes_by_year$year)
        
        # plot number of films over the years
        title1 = "Annual Total Number of Films from 1913 to 2014"
        ymin = min(films_n_votes_by_year$films)
        ymax = max(films_n_votes_by_year$films)
        p = plt("year", "films", ylab="number of films", draw_pt=F)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10)) + 
                ggplot2::scale_y_continuous(limits = c(0, ymax), 
                                            breaks = seq(0, ymax, 50))
        print(p)
        
        # plot number of votes over the years
        title2 = "Annual Total Number of Votes from 1913 to 2014"
        p = plt("year", "votes", ylab="number of votes (in million)", draw_pt=F)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        print(p)
        
        # plot average number of votes (per film) over the years
        title3 = "Annual Average Number of Votes from 1913 to 2014"
        p = plt("year", "avg_votes", 
                ylab="average number of votes per film (in thousand)", draw_pt=F)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10))
        print(p)
        
        # make function to plot by_yearcat data
        plt = cabaceo::mk_line_plt(films_n_votes_by_yearcat)
        
        # plot number of films over year_cat
        title4 = "Total Number of Films Aggregated for 4 Periods between 1913 and 2014"
        ymin = min(films_n_votes_by_yearcat$films)
        ymax = max(films_n_votes_by_yearcat$films)
        p = plt("year", "films", ylab = "number of films", draw_pt = TRUE)
        p = p + ggplot2::scale_y_continuous(limits = c(ymin, ymax), 
                                breaks = c(ymin, seq(1000, 4000, 1000), ymax))
        print(p)
        
        # plot number of votes over year_cat
        title5 = "Total Number of Votes Aggregated for 4 Periods between 1913 and 2014"
        ymin = min(films_n_votes_by_yearcat$votes)
        ymax = max(films_n_votes_by_yearcat$votes)
        p = plt("year", "votes", ylab = "number of votes (in millions)", draw_pt = T)
        p = p + ggplot2::scale_y_continuous(limits = c(ymin, ymax), 
                        breaks = c(round(ymin), seq(50, 200, 50), round(ymax)))
        print(p)
        
        # plot average number of votes (per film) over year_cat
        title6 = "Average Number of Votes Aggregated for 4 Periods between 1913 and 2014"
        ymin = min(films_n_votes_by_yearcat$avg_votes)
        ymax = max(films_n_votes_by_yearcat$avg_votes)
        p = plt("year", "avg_votes", 
                ylab = "avg number of votes per film (in thousands)", draw_pt = T)
        p = p + ggplot2::scale_y_continuous(limits = c(ymin, ymax), 
                        breaks = c(round(ymin), seq(20, 50, 10), round(ymax)))
        print(p)
        
        # calculate total time
        dur = proc.time() - t0
        names(dur) = NULL
        runtime = dur[3]
        
        # create data.frame to hold message and run time
        stats = data.frame(tab="films-n-votes", msg="success", seconds=runtime)
        
        # create data.frame to hold plots title and index
        plt_titles = c(title1, title2, title3, title4, title5, title6)
        plts = data.frame(tab="films-n-votes", title=plt_titles, n=1:6, 
                          has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}

