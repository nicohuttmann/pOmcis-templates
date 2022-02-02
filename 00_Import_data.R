

# 00
# Importing MS and additional data


# Load libraries
library(pOmics)
library(tidyverse)

# Build folder structure
#setup_folders()

# Import data by name
import_files(files = paste0("Data/", c("Dataset1.txt", "Dataset2.txt")))

# Import data from folder
import_files(dir = "./Data", ext = "txt")


# Create one new dataset
new_dataset(import = .imports[[1]])

# Make multiple new datasets with default data columns
for (i in names(.imports)) {
  new_dataset(import = .imports[[i]])
}

# Make new dataset with specific arguments (not necessary if MaxQuant output 
# are not renamed)
new_dataset(import = .imports[["Dataset1"]],
            name = "Dataset1",
            data.type = "proteinGroups",
            identifier = "Protein.IDs",
            data.columns = c("Gene.names",
                           "Protein.names",
                           "Peptides",
                           "LFQ.intensity",
                           "Only.identified.by.site",
                           "Potential.contaminant",
                           "Reverse"))




# Import additional information from file names
import_files(paste0("Data/", c("Dataset1_info.csv", "Dataset2_info.csv")))
# or
import_files(files = "./Data/Dataset_Elisa.csv")


# Add info from csv file
for (i in get_datasets()) {
  add_info_from_csv(x = .imports[["Dataset_Elisa"]], dataset = i)
}



# Import fasta file and included information
import_fasta(file = "Data/Human_fasta_file.fasta")

# Save data image
save.image("Data/RData/00.RData")
