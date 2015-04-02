suppressPackageStartupMessages({
        library(ggplot2)
        library(dplyr)
        library(tidyr)
        library(cabaceo)        
})

# load data
load("data/dat.rda")

# get min and max of year
start = min(dat$year)
end = max(dat$year)