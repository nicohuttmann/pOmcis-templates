

# 02
# Data preparation


# Load libraries
library(pOmics)
library(tidyverse)

# Load data image
load("Data/RData/00.RData")




# DEN dataset
set_default_dataset(name = "Dataset1")



# Define technical replicate groups (Technical replicates are indicated as sample_name_A and sample_name_B)
dummy <- get_observations_template(dataset = 1)
dummy[] <- substr(names(dummy), 1, nchar(names(dummy)) - 2)


# Add groups
add_observations_data(data = factor(dummy),
                      name = "groups",
                      dataset = "Dataset1")



# Combine technical replicates by mean but set to 0 if one of two values is 0
data <- get_data(data.name = "LFQ.intensity", observations.set = "raw") %>%
  include_groups(groups = groups) %>%
  collapse_groups(FUN = mean_or_0, group.column = "groups")

# Save new data frame
add_data(data = data,
         name = "LFQ.tech.repl",
         dataset = "Dataset",
         set.default.data.name = TRUE,
         new.observations.set.name = "combined")








# Add sample names from info file
dummy <- pull(.imports[["iDC_info"]], var = "name", name = "id")

dummy <- factor(x = dummy,
                levels = dummy)

dummy

add_observations_data(data = dummy,
                      name = "name",
                      observations.set = "combined",
                      dataset = "Dataset1",
                      order.by = TRUE)








# Add sample groups
dummy <- pull(.imports[["Dataset1_info"]], var = "groups", name = "id")

dummy <- factor(x = dummy,
                levels = c("group1",
                           "group2",))

dummy

add_observations_data(data = dummy,
                      name = "groups",
                      observations.set = "combined",
                      dataset = "DEN")


# Add group labels
template <- get_observations_template(dataset = 1)

dummy <- c(rep(c("wt", "wt +DEN", "Hjv-/-", "Hjv-/- +DEN"), each = 5))

names(dummy) <- names(template)

dummy

add_observations_data(data = factor(dummy),
                      name = "group.label",
                      observations.set = "combined",
                      dataset = "Dataset1")





# Add genotype data
dummy <- pull(.imports[["Dataset1_info"]], var = "genotype", name = "id")

dummy <- factor(x = dummy,
                levels = c("WT", "HJV"))

add_observations_data(data = dummy,
                      name = "genotype",
                      observations.set = "combined",
                      dataset = "DEN",
                      ignore.names = T)


view_observations()


rm(list = c("data",
            "dummy",
            "template"))




# Save data image
save.image("Data/RData/01.RData")
