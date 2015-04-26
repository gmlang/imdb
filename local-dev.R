# install local package
install.packages("/Users/gmlang/openCPU/apps/imdb", repos=NULL, type="source")
library(imdb)

# run single server
library(opencpu)
opencpu$stop()
cleanup()
opencpu$start(2498)
# opencpu$browse("/github/gmlang/NormalToBinom/R/norm_to_binom/")

# run these lines at terminal
curl http://localhost:2498/ocpu/library/imdb/R/plot_films_n_votes/json -d ''
curl http://localhost:2498/ocpu/library/imdb/R/plot_films_n_votes/ -d ''
curl http://localhost:2498/ocpu/library/imdb/R/plot_budget_n_boxoffice/ -d ''
curl http://localhost:2498/ocpu/library/imdb/R/plot_ratings/ -d ''

# retrieve the plot
http://localhost:2498/ocpu/tmp/x0d7d04c86e/R/.val
http://localhost:2498/ocpu/tmp/x0dc57f94f3/info
http://localhost:2498/ocpu/tmp/x0d0a8b773b/console
http://localhost:2498/ocpu/tmp/x01efb582bf/stdout
http://localhost:2498/ocpu/tmp/x0945740207/graphics/1/png
http://localhost:2498/ocpu/tmp/x0b12271750/graphics/1/pdf
http://localhost:2498/ocpu/tmp/x09ee972d26/files/plt.png
