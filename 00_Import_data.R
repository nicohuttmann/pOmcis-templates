

# 00
# Importing MS and additional data


# Load libraries
library(pOmics)
library(tidyverse)

# Build folder structure
#setup_folders()

# Import data
import_files(files = paste0("Data/", c("Dataset1.txt", "Dataset2.txt")))


new_dataset(import = .imports[["Dataset1"]],
            name = "Dataset1",
            identifier = "Protein.IDs" ,
            data.types = c("Gene.names",
                           "Protein.names",
                           "Peptides",
                           "LFQ.intensity",
                           "Only.identified.by.site",
                           "Potential.contaminant",
                           "Reverse"))

new_dataset(import = .imports[["Dataset2"]],
            name = "Dataset2",
            identifier = "Protein.IDs" ,
            data.types = c("Gene.names",
                           "Protein.names",
                           "Peptides",
                           "LFQ.intensity",
                           "Only.identified.by.site",
                           "Potential.contaminant",
                           "Reverse"))



# Import additional information
import_files(paste0("Data/", c("Dataset1_info.csv", "Dataset2_info.csv")))


# Import fasta file and included information
import_fasta(file = "Data/Human_21042021_uniprot-reviewed yes+taxonomy 9606.fasta")

# Save data image
save.image("Data/RData/00.RData")
