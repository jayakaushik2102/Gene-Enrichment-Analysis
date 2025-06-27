# Check if BiocManager is installed; if not, install it
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Install all necessary Bioconductor packages (force = TRUE to reinstall if already present)
BiocManager::install(c("clusterProfiler", "org.Hs.eg.db", "DOSE", "AnnotationHub",
                       "KEGGREST", "enrichplot", "pathview", "GOSemSim"), force = TRUE)

# Install openxlsx for writing Excel files
install.packages("openxlsx")

# Load required libraries for gene enrichment analysis and visualization
library(clusterProfiler)
library(org.Hs.eg.db)
library(DOSE)
library(AnnotationHub)
library(ggplot2)
library(enrichplot)
library(GOSemSim)
library(pathview)
library(openxlsx)

# Set working directory where outputs will be saved
setwd("C:/Users/jaya Kaushik/Documents/gene_enrichment_output")

# Define a list of gene symbols for analysis
gene_symbols <- c("IL6", "TNF", "CXCL8", "JUN", "FOS", "STAT1", "STAT3", "IRF1", "CCL2", "NFKB1")

# Convert gene symbols to Entrez IDs using org.Hs.eg.db
gene_df <- bitr(gene_symbols, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# Remove duplicate entries (if any)
gene_df <- gene_df[!duplicated(gene_df), ]

# Extract Entrez IDs for downstream analysis
entrez_genes <- gene_df$ENTREZID

# Save cleaned gene conversion table to CSV
write.csv(gene_df, "gene_df_cleaned.csv", row.names = FALSE)

# Perform Gene Ontology (GO) enrichment analysis for Biological Process (BP)
go_result <- enrichGO(gene = entrez_genes, OrgDb = org.Hs.eg.db, keyType = "ENTREZID",
                      ont = "BP", pAdjustMethod = "BH", pvalueCutoff = 0.05, readable = TRUE)

# Perform GO enrichment analysis for Molecular Function (MF)
go_mf <- enrichGO(gene = entrez_genes, OrgDb = org.Hs.eg.db, keyType = "ENTREZID",
                  ont = "MF", pAdjustMethod = "BH", pvalueCutoff = 0.05, readable = TRUE)

# Perform GO enrichment analysis for Cellular Component (CC)
go_cc <- enrichGO(gene = entrez_genes, OrgDb = org.Hs.eg.db, keyType = "ENTREZID",
                  ont = "CC", pAdjustMethod = "BH", pvalueCutoff = 0.05, readable = TRUE)

# Perform KEGG pathway enrichment analysis
kegg_result <- enrichKEGG(gene = entrez_genes, organism = 'hsa', pvalueCutoff = 0.05)


# Convert enrichment results to data frames and remove duplicates by Description
go_bp_df <- as.data.frame(go_result)
go_bp_df <- go_bp_df[!duplicated(go_bp_df$Description), ]
go_mf_df <- as.data.frame(go_mf)
go_mf_df <- go_mf_df[!duplicated(go_mf_df$Description), ]
go_cc_df <- as.data.frame(go_cc)
go_cc_df <- go_cc_df[!duplicated(go_cc_df$Description), ]
kegg_df <- as.data.frame(kegg_result)
kegg_df <- kegg_df[!duplicated(kegg_df$Description), ]

# Save cleaned enrichment result tables to CSV files
write.csv(go_bp_df, "GO_enrichment_BP_cleaned.csv", row.names = FALSE)
write.csv(go_mf_df, "GO_enrichment_MF_cleaned.csv", row.names = FALSE)
write.csv(go_cc_df, "GO_enrichment_CC_cleaned.csv", row.names = FALSE)
write.csv(kegg_df, "KEGG_enrichment_cleaned.csv", row.names = FALSE)

# Define a reusable function to save plots as PNG files
save_plot <- function(filename, plot_expr, width = 1000, height = 800) {
  png(filename, width = width, height = height)
  print(plot_expr)
  dev.off()
}

# Save GO and KEGG enrichment plots as PNG images
save_plot("GO_BP_barplot.png", barplot(go_result, showCategory = 10, title = "GO Biological Process"))
save_plot("GO_MF_barplot.png", barplot(go_mf, showCategory = 10, title = "GO Molecular Function"))
save_plot("GO_CC_barplot.png", barplot(go_cc, showCategory = 10, title = "GO Cellular Component"))
save_plot("KEGG_dotplot.png", dotplot(kegg_result, showCategory = 10, title = "KEGG Pathways"))
save_plot("GO_BP_cnetplot.png", cnetplot(go_result, showCategory = 5))

# Save all enrichment results into a single Excel workbook with separate sheets
write.xlsx(list(
  Gene_Conversion = gene_df,
  GO_Biological_Process = go_bp_df,
  GO_Molecular_Function = go_mf_df,
  GO_Cellular_Component = go_cc_df,
  KEGG_Pathways = kegg_df
), file = "gene_enrichment_all_results.xlsx")

# Combine all barplots into a single PDF file
pdf("All_GO_KEGG_Barplots.pdf", width = 10, height = 8)
print(barplot(go_result, showCategory = 10, title = "GO Biological Process"))
print(barplot(go_mf, showCategory = 10, title = "GO Molecular Function"))
print(barplot(go_cc, showCategory = 10, title = "GO Cellular Component"))
print(dotplot(kegg_result, showCategory = 10, title = "KEGG Pathways"))
dev.off()
