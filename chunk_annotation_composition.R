# Purpose: Compare annotation composition (cellular component) among samples as 
# bar graph

# Required: setup_org_database

# Create TERM2GENE mapping
TERM2GENE <- select_org(keys = get_proteome(), 
                        columns = "GOALL", 
                        output = "TERM2GENE", 
                        subtype = "CC")

# Calculate compositions (use correct by if number of proteins 
# without annotation is high)
data_ <- do_annotation_composition(
  list_ = list(Reference = get_proteome(), Identified = get_variables(clean)), 
  TERM2GENE = TERM2GENE, 
  correct.fractions.by = "cellular_component")

# Plot composition as bar plot
data_ <- plot_bar_composition(
  data_ = data_,
  TERMS = c("nucleus", 
            "intrinsic component of membrane", 
            "cytosol", 
            "extracellular region", 
            "mitochondrion"), 
  color = rev(RColorBrewer::brewer.pal(9, "Blues")[c(4,7)]))




# Pipe version

# Create TERM2GENE mapping
output <- select_org(
  keys = Analysis[["Dataset_venn"]][["Identification_table"]] %>% 
    dplyr::filter(Labeling | Clusters) %>% 
    dplyr::pull(variables),
  columns = "GOALL", 
  output = "TERM2GENE", 
  subtype = "CC") %>% 
  # Calculate compositions (use correct by if number of proteins 
  # without annotation is high)
  # 
  # Note: {} brackets are necessary because first argument of 
  # do_annotation_composition is not TERM2GENE
  {do_annotation_composition(
    list_ = list(
      Proteome = get_proteome(), 
      Labeling = Analysis[["Dataset_venn"]][["Identification_table"]] %>% 
        dplyr::filter(Labeling) %>% 
        dplyr::pull(variables), 
      Clusters = Analysis[["Dataset_venn"]][["Identification_table"]] %>% 
        dplyr::filter(Clusters) %>% 
        dplyr::pull(variables)), 
    TERM2GENE = ., 
    correct.fractions.by = "cellular_component")} %>% 
  # Plot composition as bar plot
  plot_bar_composition(
    TERMS = c("nucleus", 
              "intrinsic component of membrane", 
              "cytosol", 
              "extracellular region", 
              "mitochondrion", 
              "extracellular exosome"), 
    color = ghibli::ghibli_palette("MononokeMedium", )[c(5, 3, 1)])




