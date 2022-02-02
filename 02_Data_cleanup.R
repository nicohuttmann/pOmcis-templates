
#
# 02
# Prepare proteins to use for analysis
#


# ---- Load libraries ----
library(pOmics)
library(tidyverse)


# ---- Load data image ---- 
load("Data/RData/01.RData")


# ---- Identify contaminant, reverse and site identified proteins ---- 
get_variables_data(which = c("Potential.contaminant", 
                             "Only.identified.by.site", 
                             "Reverse"), 
                   output.type = "tibble") %>%
  do_expr(is.na(x)) %>% 
  do_column_summary(FUN = function(x) mean(x) == 1) %>% 
  pull_data() %>% 
  add_variables_data("clean", set.default = TRUE)


# ---- Save data image ----
save.image("Data/RData/02.RData")
