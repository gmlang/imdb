library(devtools)
options(devtools.desc.author="'Guangming Lang <gmlang@cabaceo.com> [aut, cre]'")
options(devtools.desc.license="GNU General Public License v2.0")

# set paths
proj_path = "~/Apps"

# initialize package
setwd(file.path(proj_path, "imdb"))

# add Imports
use_package("ezplot")

# edit
file.edit("DESCRIPTION")

# create document
document()

# install package
install.packages(file.path(proj_path, "ezplot"), repos=NULL, type="source")
# devtools::install_github("gmlang/ezplot", ref = "v1.0.0")
library(ezplot)
