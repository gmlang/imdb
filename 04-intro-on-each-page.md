[IMDB](http://imdb.com/) is a website for collecting film data supplied by studios and fans. It claims to be the biggest movie database on the web, and it makes their data publicly [available for download](http://www.imdb.com/interfaces/). We used [Hadley Wickham's ruby scripts](https://github.com/hadley/data-movies) (with some small modifications) to download data from IMDB and parse them into useful form for data analysis. The final output is one tidy data set that contains 5944 films from 1913 - 2014 and the following fields:

* title.  Title of the movie.
* year.  Year of release.
* budget.  Total budget in US dollars.
* length.  Length in minutes.
* rating.  Average IMDB user rating. These ratings are on a scale of 1 (worst) to 10 (best).
* votes.  Number of IMDB users who rated this movie.
* r1-10.  Distribution of votes for each rating, to mid point of nearest decile: 0 = no votes, 4.5 = 1-9 votes, 14.5 = 11-19 of votes, etc.  Due to rounding errors these may not sum to 100.
* mpaa.  MPAA rating (ex: R, PG-13).
* boxoffice. Total Ticket sales in US dollars.
* actor, actress, director, and writer. String variables giving these people's names.
* action, animation, comedy, drama, documentary, romance, short, and etc. Binary variables representing if movie was classified as belonging to that genre.

We thoroughly analyzed the data set and made this web app to present our findings. In particular, we looked at

* How the number of films made and user votes change over the years.
* How budget and boxoffice change over the years.

We hope you find these discoveries interesting. You can find out more about us at [cabaceo.com](http://cabaceo.com).