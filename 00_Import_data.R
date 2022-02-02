
# 
# 00
# Import of raw data, trait information, and fasta files
#


# ---- Load libraries ----
library(pOmics)
library(tidyverse)


# ---- Import data ----
import_files(files = paste0("Data/", 
                            c("proteinGroups.txt", 
                              "peptides.txt", 
                              "modificationSpecificPeptides.txt")))


# ---- Create dataset from imported raw files ----
new_dataset(import = .imports[["proteinGroups"]],
            name = "proteinGroups",
            identifier = "Protein.IDs",
            data.columns = c("Gene.names",
                             "Protein.names",
                             "Peptides",
                             "LFQ.intensity",
                             "Only.identified.by.site",
                             "Potential.contaminant",
                             "Reverse"))

# ---- Create multiple datasets from imported raw files ----
for (i in names(.imports)) {
  new_dataset(import = .imports[[i]])
}


# ---- Import additional information for samples ----
import_files(paste0("Data/", c("Dataset_info.csv")))


# ---- Import fasta file ----
import_fasta(file = "Data/Human.fasta")


# ---- Save data image ----
save.image("Data/RData/00.RData")
