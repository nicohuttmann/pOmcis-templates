

# 03
# What happens in this script


# Load libraries
library(pOmics)
library(tidyverse)

# Load data image
load("Data/RData/02.RData")



# Add combined dataset
#add_combined_dataset()


# Setup annotation databases
setup_taxonomy_information()

# Setup organism annotation package
setup_org_database()


# CORUM
#setup_CORUM_annotations()


#setup_STRINGdb(dataset = )

#setup_MSigDB()



import_fasta(file = "Data/Human_21042021_uniprot-reviewed yes+taxonomy 9606.fasta")


test <- fun_enrich(proteins = get_variables(), 
                   background = get_proteome(), 
                   database = c("GO", "KEGG"), 
                   pvalueCutoff = 0.05, 
                   pAdjustMethod = "BH", )

rm(test)




# Save data image
save.image("Data/RData/03.RData")
