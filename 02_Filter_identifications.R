

# 02
# Remove contaminants and reverse protein identifications


# Load libraries
library(pOmics)
library(tidyverse)

# Load data image
load("Data/RData/02.RData")



# Dataset DEN
set_default_dataset("Dataset1")

# Identify contaminant and reverse proteins
no.cont <- get_variables_data("Potential.contaminant") %>%
  is.na() %>%
  which_names() %>%
  cleanup_proteins_v()

# Identify proteins only identified by site
no.site <- get_variables_data("Only.identified.by.site") %>%
  is.na() %>%
  which_names() %>%
  cleanup_proteins_v()

# Intersect clean proteins and add to dataset
clean.proteins <- intersect(no.cont, no.site)

add_variables_data(data = clean.proteins, name = "clean", set.default = T)

rm(list = c("no.cont",
            "no.site",
            "clean.proteins"))



# Save data image
save.image("Data/RData/03.RData")
