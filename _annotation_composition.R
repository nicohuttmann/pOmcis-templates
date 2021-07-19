# Purpose: Compare annotation composition (cellular component) among samples as bar graph

# Required: setup_org_database

# Create TERM2GENE mapping
TERM2GENE <- select_org(keys = get_proteome(), 
                        columns = "GOALL", 
                        output = "TERM2GENE", 
                        subtype = "CC")

# Calculate compositions (use correct by if )
data_ <- do_annotation_composition(list_ = list(Reference = get_proteome(), Identified = get_variables(clean)), 
                                   TERM2GENE = TERM2GENE, 
                                   correct.fractions.by = "cellular_component")

# Plot composition as bar plot
data_ <- plot_gg_bar_composition(data_ = data_,
                                 TERMS = c("nucleus", 
                                           "intrinsic component of membrane", 
                                           "cytosol", 
                                           "extracellular region", 
                                           "mitochondrion"), 
                                 color = rev(RColorBrewer::brewer.pal(9, "Blues")[c(4,7)]))

