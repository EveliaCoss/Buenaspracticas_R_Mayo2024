# Como podemos usar las funciones del paquete que creamos
# Author: Evelia Coss
#
# --

# ---- paquetes ---
library(dplyr)
library(ggplot2)


# -- input y output ----
# Aqui se encuentra el archivo "DE_Treated_vs_control.csv"
indir <- "C:/Users/ecoss/OneDrive - CINVESTAV/Documentos/Github_notes/EveCoss_website/BestPractices/DEG_example/"
setwd(indir)

# figdir <- "C:/Users/ecoss/OneDrive - CINVESTAV/Documentos/Github_notes/EveCoss_website/BestPractices/DEG_example/figures/"

plot_volcano(file_name = "DE_Treated_vs_control.csv",
             figdir = "figures/",
             abslogFC = 1, noGeneNames = 20, plotTitle = F)



# Verificar resultados de genes diferencialmente expresados

example_df %>% mutate(Expression = case_when(log2FoldChange >= 1 & padj < 0.05 ~ "Up-regulated",
                              log2FoldChange <= -(1) & padj < 0.05 ~ "Down-regulated",
                              TRUE ~ "Unchanged")) %>%
  dplyr::select(Expression) %>%
  table()
