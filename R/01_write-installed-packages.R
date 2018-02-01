## deja vu from yesterday!


## create a data frame of your installed packages

## keep the variables
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built

## write it to data/installed-packages.csv
## YES overwrite the file that is there now
## that came from me (Jenny)
## it an example of what yours should look like

## when this script works, stage & commit it and the csv file
## PUSH!

installed_packages <- installed.packages()

library(tidyverse)
library(here)

installed_packages %>%
  as.tibble() %>%
  select(Package,LibPath,Version,Priority,Built) %>%
  write_csv(path = paste(here(),"data","installed-packages.csv",sep="/"))

