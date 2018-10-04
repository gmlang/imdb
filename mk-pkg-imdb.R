library(devtools)

options(devtools.desc.author="'Guangming Lang <gmlang@cabaceo.com> [aut, cre]'")
options(devtools.desc.license="MIT")

# set paths
proj_path = file.path("~/Apps")
setwd(file.path(proj_path, "imdb"))

# add Imports
use_package("ezplot")

# create data-raw folder and ignore it in the bundled version of the pkg
use_data_raw()

# edit
file.edit("DESCRIPTION")

# create document
document()

# install local package
install.packages("~/Apps/imdb", repos=NULL, type="source")
library(imdb)


#####################################
# local test on openCPU server ######
#####################################

# run single server
library(opencpu)
opencpu$stop()
cleanup()
opencpu$start(2498)
# opencpu$browse("/github/gmlang/NormalToBinom/R/norm_to_binom/")

# run these lines at terminal
# curl http://localhost:2498/ocpu/library/imdb/R/plot_films_n_votes/json -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_films_n_votes/ -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_budget_n_boxoffice/ -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_ratings/ -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_length_n_mpaa/ -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_genre/ -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_bo_vs_others/ -d ''
# curl http://localhost:2498/ocpu/library/imdb/R/plot_bo_bt_ratio_vs_others/ -d ''

# retrieve the plot
# http://localhost:2498/ocpu/tmp/x0ab49e39ca/R/.val
# http://localhost:2498/ocpu/tmp/x0dc57f94f3/info
# http://localhost:2498/ocpu/tmp/x0d0a8b773b/console
# http://localhost:2498/ocpu/tmp/x01efb582bf/stdout
# http://localhost:2498/ocpu/tmp/x0ab49e39ca/graphics/1/png
# http://localhost:2498/ocpu/tmp/x0b12271750/graphics/1/pdf
# http://localhost:2498/ocpu/tmp/x09ee972d26/files/plt.png
