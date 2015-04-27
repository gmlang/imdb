#' @title Generate descriptive plots for ratings and votes per rating
#' 
#' @return 2 ggplot2 objects
#' @export
plot_length_n_mpaa = function() {
        t0 = proc.time()
        
        # plot histogram to show the distribution of lengths
        plt = ezplot::mk_distplot(dat)
        title1 = "Distribution of Film Lengths"
        p = plt("length", xlab="minutes", main=title1, add_vline_mean=T)
        p = ezplot::scale_axis(p, "y", use_comma=T)
        p = ezplot::web_display(p)
        print(p)
        
        # plot distribution of mpaa ratings
        tbl = table(dat$mpaa)
        tbl = data.frame(prop.table(tbl))
        names(tbl) = c("cat", "pct")
        plt = ezplot::mk_barplot(tbl)
        title2 = "Percent of Different MPAA Ratings"
        p = plt("cat", "pct", fillby="cat", main=title2, legend=F)
        p = ezplot::scale_axis(p, "y", use_pct=T, pct_jump=0.25)
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
        plts = data.frame(tab="length-n-mpaa", title=plt_titles, 
                          n=1:2, has_caption=FALSE, caption="")
        
        # collect into out
        out = list(status=stats, tables=list(), plots=plts, prints=list())
        return(out)                
}
