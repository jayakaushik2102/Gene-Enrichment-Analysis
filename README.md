Gene Enrichment Analysis in R  
Exploring GO & KEGG Enrichment with Key Inflammation Genes.

1. About the Project

This is a mini bioinformatics project built in R, aimed at extracting biological meaning from a curated list of inflammation-related human genes. Using Bioconductor tools such as clusterProfiler, this project identifies enriched Gene Ontology (GO) terms and KEGG pathways to better understand gene functions and associations.

Objective:  
To practice and demonstrate real-world gene enrichment analysis — from gene selection to biological insights — using reproducible and structured R code.

2. Genes Analyzed

A curated list of 10 well-known genes involved in inflammation and immune signaling:

IL6, TNF, CXCL8, JUN, FOS, STAT1, STAT3, IRF1, CCL2, NFKB1

These genes play pivotal roles in inflammatory responses and disease mechanisms.

3. Tools & Packages Used

- clusterProfiler, org.Hs.eg.db, AnnotationHub
- KEGGREST, GOSemSim, enrichplot
- openxlsx for Excel exports
- ggplot2 for visualizations

4. What This Project Covers

A. Gene ID Conversion  
- Converted gene symbols to Entrez IDs using Bioconductor databases.

B. GO Enrichment Analysis  
- Performed enrichment for 3 categories:
- Biological Process (BP)
- Molecular Function (MF)
- Cellular Component (CC)

C. KEGG Pathway Enrichment  
- Identified significant biological pathways using KEGG

D. Plotting & Visualization  
- Barplots for GO terms  
- Dotplot for KEGG pathways  
- Gene-concept network plot (cnetplot)  
- Enrichment map plot (emapplot)

E. Exported Results  
- CSV files for all GO and KEGG tables  
- High-quality PNG plots  
- One Excel file summarizing all outputs  
- One PDF containing all barplots and dotplot

5. Output Folder Overview

All results are saved in the gene_enrichment_output/ directory:

- gene_df.csv                                   → Entrez ID conversion table  
- GO_enrichment_BP.csv                          → GO Biological Process results  
- GO_enrichment_MF.csv                          → GO Molecular Function results  
- GO_enrichment_CC.csv                          → GO Cellular Component results  
- KEGG_enrichment.csv                           → KEGG pathway results  
- GO_BP_barplot.png                             → Barplot: GO BP terms  
- GO_MF_barplot.png                             → Barplot: GO MF terms  
- GO_CC_barplot.png                             → Barplot: GO CC terms  
- KEGG_dotplot.png                              → Dotplot: KEGG pathways  
- GO_BP_cnetplot.png                            → Cnetplot: GO BP  
- gene_enrichment_all_results.xlsx              → Excel file containing all results  
- All_GO_KEGG_Barplots.pdf                      → Combined PDF of GO + KEGG plots  

6. Why This Project Is Unique

- Focused and biologically relevant gene list  
- Full coverage of all GO categories + KEGG pathways  
- Clean, reproducible R code for educational use  
- Automatically generated publication-quality plots  
- Ready for GitHub, LinkedIn, or academic showcase

7. What I Did

- Selected 10 human inflammation-associated genes  
- Converted gene symbols to Entrez IDs using org.Hs.eg.db  
- Conducted GO enrichment for BP, MF, and CC  
- Performed KEGG pathway enrichment  
- Visualized results with barplots, dotplot, cnetplot, and emapplot  
- Exported:
   - CSV files for all analysis results  
   - PNG files for all plots  
   - Excel file combining all outputs  
   - One PDF for all GO + KEGG visualizations  
    - Organized everything in a structured folder: gene_enrichment_output/

8. Why I Made This

- To practice enrichment analysis using real genes and datasets  
- To learn key Bioconductor tools like clusterProfiler, enrichplot, and GOSemSim  
- To gain insight into biological processes and molecular pathways  
- To build a mini bioinformatics project for GitHub and LinkedIn  
- To strengthen my profile as an M.Tech biotechnology student interested in data-driven discovery

9. About Me

I'm currently pursuing my M.Tech in Industrial Biotechnology, with a strong interest in:

- Bioinformatics & Data Analysis  
- Gene Expression Profiling  
- Functional Enrichment using R & Bioconductor

This project is one of my first full pipelines using real gene sets and visualization tools. I'm building more such projects and actively sharing my learning journey.

Let’s connect!  
- [GitHub Profile](https://github.com/jayakaushik2102)  
- [LinkedIn Profile](https://www.linkedin.com/in/jaya-kaushik-b51978237)
