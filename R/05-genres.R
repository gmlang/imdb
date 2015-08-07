#' @title Generate descriptive plots for genres
#' 
#' @return 3 ggplot2 objects
#' @export
plot_genre = function() {
        t0 = proc.time()
        
        # plot bar charts to show the overall percent of films by genre
        plt = ezplot::mk_barplot(films_by_genre)
        title1 = "Percent of Films by Genre"
        p = plt("genre", "pct", fillby="genre", main=title1, legend=F)
        p = ezplot::scale_axis(p, scale="pct")
        p = ezplot::rotate_axis_text(p, text_angle_x=270, hjust_x=0, vjust_x=0)
        p = ezplot::web_display(p)
        print(p)
        
        # plot stacked bar charts to show the top 5 genres for each period
        plt = ezplot::mk_barplot(top5genres_by_yearcat)
        title2 = "Percent of Top 5 Genres over 4 periods (1913-2014)"
        p = plt("year_cat", "pct", fillby="genre", main=title2)
        p = p + ggplot2::scale_fill_brewer(palette="Spectral")
        p = ezplot::scale_axis(p, scale="pct", pct_jump=0.2)
        p = ezplot::web_display(p)
        print(p)
        
        # plot line charts to show the top 10 genres over each year
        plt = ezplot::mk_lineplot(top_genres_by_year_long)
        title3 = "Top 10 Genres over the years (1913-2014)"
        p = plt("year", "cnt", fillby="genre", main=title3)
        
        start = min(top_genres_by_year_long$year)
        end = max(top_genres_by_year_long$year)
        p = p + ggplot2::scale_x_continuous(limits = c(start, end), 
                                            breaks = seq(start, end, 10)) + 
                ggplot2::scale_color_brewer(palette="Spectral")
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
