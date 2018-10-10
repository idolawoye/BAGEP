#!/bin/bash

echo "Installing dependencies from bioconda..."
echo "Installing Fastp"
conda install -c bioconda fastp
echo "Installing snippy"
conda install -c bioconda snippy
echo "Installing mykrobe"
conda install -c bioconda mykrobe
echo "Installing snakemake"
conda install -c bioconda snakemake
echo "Installing IQ-TREE"
conda install -c bioconda iqtree
echo "Installing VCF tools"
conda install -c bioconda vcftools
echo "DONE."