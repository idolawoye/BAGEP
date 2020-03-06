#! /bin/bash

echo "Installing R packages for visualisation"

Rscript -e 'install.packages("ggplot2")' && \
Rscript -e 'install.packages("vcfR")' && \
Rscript -e 'install.packages("heatmaply")' && \
Rscript -e 'install.packages("argparse")'

echo "Installation COMPLETED."
