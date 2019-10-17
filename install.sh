#! /bin/bash

echo "Installing R packages for visualisation"

Rscript -e 'install.packages("ggplot2", "vcfR", "heatmaply")'

echo "Installation COMPLETED."
