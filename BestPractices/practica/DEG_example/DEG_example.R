# Ejemplo de resultados de expresion diferencial
# Evelia Coss
# Tutorial y datos proveniente de: https://4va.github.io/biodatasci/r-rnaseq-airway.html#deseq2_analysis
# --

# --- Paquetes ---
library(tidyverse)
library(DESeq2)

setwd("C:/Users/ecoss/OneDrive - CINVESTAV/Documentos/Github_notes/EveCoss_website/BestPractices/DEG_example")

#--- Cargar archivos ----
mycounts <- read.csv("data/airway_scaledcounts.csv")
metadata <-  read.csv("data/airway_metadata.csv")

# Acomodar formato
mycounts <- as.data.frame(mycounts)
metadata <- as.data.frame(metadata)

# -- Modificar archivos----
# Los IDS de los transcriptomas deben coincidir con los IDs de la metadata
names(mycounts)[-1]
metadata$id
names(mycounts)[-1]==metadata$id
all(names(mycounts)[-1]==metadata$id)

# Convertir la variable "dex" a factor
metadata$dex <- as.factor(metadata$dex)

# --- Generar dds ----
dds <- DESeqDataSetFromMatrix(countData=mycounts, 
                              colData=metadata, 
                              design=~dex,  # modelo
                              tidy=TRUE)
dds
# ---Obtener resultados -----
# Correr analisis
dds <- DESeq(dds)

# Extraer resultados
res <- results(dds, tidy=TRUE)
res

# convertir a dataframe
results_df <- as.data.frame(res)
row.names(results_df) <- results_df$row # rownames
head(results_df)

# We’re passing the tidy=TRUE argument, which tells DESeq2 to output the results table with rownames as 
# a first column called ‘row.’ If we didn’t do this, the gene names would be stuck in the row.names, and 
# we’d have a hard time filtering or otherwise using that column.

# --- Salvar resultado ----
write.csv(results_df, "DE_Treated_vs_control.csv", 
          quote = FALSE, # sin caracteres de " "
          row.names = TRUE, # Con nombre en filas
          col.names = TRUE # Con nombres de las columnas
          )

