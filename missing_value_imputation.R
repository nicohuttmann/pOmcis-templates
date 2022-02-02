# ---- Combine technical replicates ----

# Define technical replicate groups (e.g. sample1_A and sample1_B)
template <- get_observations_template(dataset = 1)
template <- substr(names(template), 1, nchar(names(template)) - 2)

# Add groups
add_observations_data(data = factor(template),
                      name = "replicates",
                      dataset = "proteinGroups")

# Combine technical replicates by mean but set to 0 if one of two values is 0
data <- get_data(data.name = "LFQ.intensity", 
                 observations.set = "raw") %>%
  include_groups(groups = groups) %>%
  collapse_groups(FUN = mean_or_0, group.column = "replicates")

# Save new data frame
add_data(data = data,
         name = "LFQ.tech.repl",
         dataset = "Dataset",
         set.default.data.name = TRUE,
         new.observations.set.name = "combined")