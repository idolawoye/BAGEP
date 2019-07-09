#!/bin/bash

echo "Installing dependencies from bioconda..."
echo "Installing Fastp"
conda install -c bioconda fastp
echo "Installing snippy"
conda install -c conda-forge -c bioconda snippy
echo "Installing snakemake"
conda install -c bioconda -c conda-forge snakemake
echo "Installing IQ-TREE"
conda install -c bioconda iqtree
echo "Installing fasttree"
conda install -c bioconda fasttree
echo "Installing VCF tools"
conda install -c bioconda vcftools
echo "DONE."
