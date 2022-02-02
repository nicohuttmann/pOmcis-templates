
<<<<<<< HEAD
# 
=======

>>>>>>> 19853ef80ef43cdd2dcfd4dc9f0f3f1c9c3e17ad
# 01
# Data preparation
#


# ---- Load libraries ----
library(pOmics)
library(tidyverse)


# ---- Load data image ----
load("Data/RData/00.RData")


# ---- Add info from csv to dataset
add_info_from_csv(x = .imports[["Dataset_info"]],
                  dataset = "proteinGroups")




# ---- Manually add data from csv file ----

# Pull data from info data frame
template <- dplyr::pull(.imports[["proteinGroups_info"]], 
                        var = "groups", 
                        name = "id")

# Define levels
template <- factor(x = template,
                   levels = c("group1",
                              "group2"))

# Check 
template

# Add observations description
add_observations_data(data = template,
                      name = "groups",
                      observations.set = "raw",
                      dataset = c("proteinGroups"))



# ---- Manually define and add data from observation names ----

# Get named empty vector with names of observations 
template <- get_observations_template(dataset = 1)

# Modify names (e.g. condition_repl1 -> condition)
template[] <- strsplit_keep(names(template), 1)

# Save as factor (and optionally order with levels = ...)
add_observations_data(data = factor(template),
                      name = "condition", 
                      dataset = 1:3)



# ---- Set default dataset attributes ----
# default_variables
# default_variables_labels
# default_observations_set
# default_observations
# default_observations_labels
# default_groups
# default_data_name

# Example: Set default protein labels
set_dataset_attr(x = "Gene.names", 
                 which = "default_variables_labels", 
                 dataset = "")



# ---- Save data image ----
save.image("Data/RData/01.RData")
