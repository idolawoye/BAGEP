#!/bin/bash

echo "Installing dependencies from bioconda..."
echo "Installing Fastp"
conda install -c bioconda fastp -y
echo "Installing snippy"
conda install -c conda-forge -c bioconda snippy -y
echo "Installing snakemake"
conda install -c bioconda -c conda-forge snakemake -y
echo "Installing IQ-TREE"
conda install -c bioconda iqtree -y
echo "Installing fasttree"
conda install -c bioconda fasttree -y
echo "Installing VCF tools"
conda install -c bioconda vcftools -y
echo "Installing R packages"
Rscript -e 'install.packages("ggplot2", "vcfR", "heatmaply")
echo "DONE."
