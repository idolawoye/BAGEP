library('vcfR')
library('heatmaply')
library('argparse')

parser <- ArgumentParser(description='VCF visualisation script')
parser$add_argument("vcf", type='character', action="store", help="Input VCF file")
parser$print_help()
args <- commandArgs(trailingOnly = TRUE)

if (length(args)>1) {
  stop("Only one input must be supplied: VCF file", call.=FALSE)
} else if (length(args)==1) {
  noquote(". . . Checking input files")
}
vcf_file <- args[[1]]
vcf <- read.vcfR(vcf_file, verbose = FALSE)

chrom <- create.chromR(name = 'vcf_heatmap', vcf = vcf, seq = NULL, ann = NULL)

genotype <- extract.gt(chrom, element = "GT", as.numeric = TRUE)
rownames(genotype) <- chrom@var.info$POS
genotype[!rowSums(!is.finite(genotype)),]
genotype[!is.finite(genotype)] <- 0

heatmaply(genotype, colors = viridis(n = 256, alpha = 1, begin = 0, end = 1, option = 'viridis')
          , limits = c(0,2), xlab = 'Genomes', ylab = 'SNP position',
          k_row = 1, k_col = 3, column_text_angle = 90, width = 500, height = 900,
          label_names = c("position", "sample", "SNP"), file = 'heatmap_output.html')
noquote("DONE!")
noquote('Thank you for using vcfR heatmapper')
