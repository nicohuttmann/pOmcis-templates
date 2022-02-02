
# 
# 03
# Download and setup annotation databases
# 


# ---- Load libraries ---- 
library(pOmics)
library(tidyverse)


# ---- Load data image ----
load("Data/RData/02.RData")


# ---- Setup taxonomy information ----
setup_taxonomy_information()


# Set attributes manually

# UniProt taxonomy ID
set_dataset_attr(x = taxId, which = "taxId", dataset = dataset)

# Scientific name (not important)
set_dataset_attr(x = scientific_name, 
                 which = "scientific_name", 
                 dataset = 1)

# KEGG organism code
clusterProfiler::search_kegg_organism("Pseudomonas ae")

set_dataset_attr(x = "pae", which = "kegg_code", dataset = dataset)

# Common name ( not important)
set_dataset_attr(x = common_name, which = "common_name", dataset = dataset)



# ---- Setup organism annotation package (if available from Bioconductor) ---- 
setup_org_database(dataset = 1, 
                   OrgDb = , 
                   taxId = )



# ---- Setup other annotation databases (ToDo) ----

#setup_CORUM_annotations()

#setup_STRINGdb()

#setup_MSigDB()



# Test annotation
test <- fun_enrich(proteins = get_variables(), 
                   background = get_proteome(), 
                   database = c("GO", "KEGG"), 
                   pvalueCutoff = 0.05, 
                   pAdjustMethod = "BH", )

rm(test)


# ---- Save data image ----
save.image("Data/RData/03.RData")
