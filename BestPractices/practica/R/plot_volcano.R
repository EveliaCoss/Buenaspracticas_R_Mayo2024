#' @title Obtener informacion para volcano plot
#'
#' @details
#' Funcion que permite obtener los datos para generar el volcano plot, dividiendo la informacion
#' de acuerdo al logfoldchange que tenemos, ademas podemos seleccionar cuantos genes queremos que tengan etiquetas en el plot.
#'
#' @usage plot_volcano(file_name, figdir, abslogFC = 1, noGeneNames = 20, plotTitle = F)
#'
#' @param file_name "DE_plotTitle.csv" resultados de la expresion diferencial deben empezar con DE y terminar con .csv.
#' @param figdir     Carpeta de salida para las figuras
#' @param abslogFC     Valor de corte de logFoldChange, default=1
#' @param noGeneNames  Numero de genes que quieres que tengan nombre en el plot, default =20
#' @param plotTitle   Si quieres agregar o no el titulo a la figura, default = FALSE.
#'
#' @return Genera un volcano plot por cada archivo de entrada
#' @import dplyr ggplot2
#' @export
#'
#' @examples
#' plot_volcano(file_name, figdir, abslogFC = 1, noGeneNames = 20, plotTitle = F)
plot_volcano <- function(file_name, figdir, abslogFC = 1, noGeneNames = 20, plotTitle = F){

  plot_name <- gsub("^DE_(.+)\\.csv$", "\\1", file_name)
  if (plotTitle == T) {
    ptitle <- plot_name
  } else{ptitle <- ''}

  df <- read.csv(file = file_name, row.names = 'X')
  df <- na.omit(df)
  # --
  # Add expression column
  df <- df %>%
    mutate(Expression = case_when(log2FoldChange >= abslogFC & padj < 0.05 ~ "Up-regulated",
                                  log2FoldChange <= -(abslogFC) & padj < 0.05 ~ "Down-regulated",
                                  TRUE ~ "Unchanged"))
  # --
  # Plot
  volcanoplot <- ggplot(df, aes(log2FoldChange, -log(padj,10))) +
    geom_point(aes(color = Expression), size = 0.7) +
    labs(title = ptitle) +
    xlab(expression("log"[2]*"FC")) +
    ylab(expression("-log"[10]*"p-adj")) +
    scale_color_manual(values = c("dodgerblue3", "gray50", "firebrick3")) +
    guides(colour = guide_legend(override.aes = list(size=1.5))) +
    geom_vline(xintercept = abslogFC, linetype = "dashed", color = "black", alpha = 0.5) +
    geom_vline(xintercept = -(abslogFC), linetype = "dashed", color = "black", alpha = 0.5) +
    geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black", alpha = 0.5)


  top <- noGeneNames # no. of highlighted genes in plot
  top_genes <- bind_rows(df %>%
                           filter(Expression == 'Up-regulated') %>%
                           arrange(padj, desc(abs(log2FoldChange))) %>%
                           head(top),
                         df %>%
                           filter(Expression == 'Down-regulated') %>%
                           arrange(padj, desc(abs(log2FoldChange))) %>%
                           head(top)
  )
  dim(df[df$Expression == 'Up-regulated',])
  dim(df[df$Expression == 'Down-regulated',])

  volcanoplot_names <-  volcanoplot +
    ggrepel::geom_label_repel(data = top_genes,
                              mapping = aes(log2FoldChange, -log(padj,10), label = rownames(top_genes)),
                              size = 2) + theme_classic() + theme(legend.position = 'bottom')
  ggsave(file = paste0(figdir, "volcano_", plot_name,".png"), plot = volcanoplot_names, dpi = 300)
  # save Rdata object
  save(volcanoplot_names, file =paste0(figdir, "volcano_", plot_name, ".RData"))
} # end function
