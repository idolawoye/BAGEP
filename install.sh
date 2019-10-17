#!/bin/bash

echo "Installing R packages"
Rscript -e 'install.packages("ggplot2", "vcfR", "heatmaply")
echo "DONE."
