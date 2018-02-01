## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()

install_packages_df <- read_csv(file = paste(here(),"data","installed-packages.csv",sep="/"))
## filter out packages in the default library

install_packages_df_filter <- install_packages_df %>%
  filter(LibPath == .libPaths()[1])

## keep variables Package and Built
install_packages_df_filter <- install_packages_df_filter %>%
  select(Package,Built)
## if you use dplyr, code like this will work:
# apt <- ipt %>%
#   filter(LibPath == .libPaths()[1]) %>%
#   select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
install_packages_df_filter %>%
  write_csv(path = paste(here(),"data","add-on-packages.csv",sep="/"))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- install_packages_df_filter %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

apt_freqtable %>%
write_csv(path = paste(here(),"data","add-on-packages-freqtable.csv",sep="/"))
## when this script works, stage & commit it and the csv files
## PUSH!

# install_packages_df %>%
# filter(LibPath == .libPaths()[1]) %>%
#   select(Package, Built)
