# BAGEP
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3731118.svg)](https://doi.org/10.5281/zenodo.3731118)

Bacterial Genome Pipeline (BAGEP) is an automated and scalable workflow for downstream analysis of Whole genome sequencing of bacterial samples. It also generates a graphical interactive heatmap for the visulisation of SNPs and their positions across the genome.
## Installation
[BAGEP](https://github.com/idolawoye/BAGEP.git) is hosted on github. 
Clone the pipeline with:

`git clone https://github.com/idolawoye/BAGEP.git`

The pipeline has only been tested to work on Linux OS - Ubuntu 16.04 and later versions. Earlier versions should work fine as long as the dependencies are properly installed. Ensure you have the [miniconda](https://conda.io/docs/user-guide/install/linux.html) package manager and [R version 3.4.4](https://cran.r-project.org/src/base/R-3/R-3.4.4.tar.gz) installed.
The best way to install the pipeline with all it's dependencies is creating a conda environment. To do that, navigate into the BAGEP directory using `cd BAGEP` and run:

`conda env create -f environment.yml`

To activate the pipeline environment:

`conda activate bagep`

To exit the environment:

`conda deactivate`

## Dependencies
All dependencies should be rightly installed on the path of the workstation or server
* Fastp 
* Snippy 
* IQ-TREE 
* Abricate
* Snakemake
* Centrifuge
* R libraries for processing and visualisation
  - vcfR
  - ggplot2
  - heatmaply

### Setting up Centrifuge
Download and install Centrifuge database which is approximately 8 GB with the following steps

`wget -c ftp://ftp.ccb.jhu.edu/pub/infphilo/centrifuge/data/p_compressed+h+v.tar.gz`
`mkdir $HOME/centrifuge-db`
`tar -C $HOME/centrifuge-db -zxvf p_compressed+h+v.tar.gz`
`export CENTRIFUGE_DEFAULT_DB=$HOME/centrifuge-db/p_compressed+h+v`

### Setting up Krona Taxonomy Plot
`rm -rf ~/miniconda3/envs/bagep/opt/krona/taxonomy`
`mkdir -p ~/krona/taxonomy`
`ln -s ~/krona/taxonomy/ ~/miniconda3/envs/bagep/opt/krona/taxonomy`
`ktUpdateTaxonomy.sh ~/krona/taxonomy`

## Running TBpipeline
Ensure that the BAGEP environment is active before running and that you have set Centrifuge's database to global locations on your PC and Kraken's taxonomy.

Your paired end FASTQ files should have this format:
``SampleName_R1.fastq.gz`` and ``SampleName_R2.fastq.gz``
If they occur as ``SampleName_pass_1.fastq.gz`` and ``SampleName_pass_2.fastq.gz``
You can rename them to the appropriate format by running:
`snakemake -s rename.txt`

All fastQ files **(paired end reads)** of same bacterial species should be saved in a **fastq/** folder. The pipeline uses [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) to run the workflow by cleaning and trimming the files, antimicrobial resistance gene detection, taxonomic classification, calling variants, generating alignment files from the core and whole genome and constructing a phylogeny tree on either the core genome or whole genome using maximum likelihood. To run the pipeline, simply enter:


`snakemake --config ref={users reference genome}` 

### Outputs
#### Quality control
Trimmed files will be deposisted in the **fastp** folder. A reference genome for mapping should be provided for the bacterial samples, either in .gbk or .fasta format.
#### Taxonomic classification
Taxonomic visualization of individual isolate is found in **taxonomy/fastq/**. HTML files show interactive Krona plot of taxonomic classification in sequencing reads. An example is shown below
#### Variant detection and Genome alignments
Alignment of core genomes will be deposited in the **results/** directory as `core.aln`, whole genome alignment in same directory as `core.full.aln` TAB and VCF reports are also generated. If you wish to inspect individual variant reports it will be deposited in a folder with the name of the sample as a sub directory in fastq
#### Phylogenetics
The phylogeny tree is constructed using the aligned core/whole genomes (whole genomes by default), generating `*.treefile` which can be visualised using any tree visualisation tool.
#### Interactive visualization
The SNP heatmap will generate an interative image in an HTML file named `heatmap_output.html`. An example is shown below
![SNP heatmap](https://github.com/idolawoye/BAGEP/blob/master/data/Screenshot%20from%202019-10-14%2014-34-03.png)
![krona_plot](https://github.com/idolawoye/BAGEP/blob/master/data/krona_plot.svg)

## References 
1. Shifu Chen, Yanqing Zhou, Yaru Chen, Jia Gu (2018); fastp: an ultra-fast all-in-one FASTQ preprocessor, Bioinformatics, Volume 34, Issue 17, Pages i884–i890, https://doi.org/10.1093/bioinformatics/bty560
2. L.-T. Nguyen, H.A. Schmidt, A. von Haeseler, B.Q. Minh (2015) IQ-TREE: A fast and effective stochastic algorithm for estimating maximum likelihood phylogenies.. Mol. Biol. Evol., 32:268-274. https://doi.org/10.1093/molbev/msu300
3. Knaus, Brian J., and Niklaus J. Grunwald. (2017). VCFR: a package to manipulate and visualize variant call format data in R. Molecular Ecology Resources 17(1):44-53. http://dx.doi.org/10.1111/1755-0998.12549.
3. Köster, Johannes and Rahmann, Sven (2012). Snakemake - A scalable bioinformatics workflow engine. Bioinformatics.
5. [Snippy](https://github.com/tseemann/snippy).
6. Petr Danecek, Adam Auton, Goncalo Abecasis, Cornelis A. Albers, Eric Banks, Mark A. DePristo, Robert Handsaker, Gerton Lunter, Gabor Marth, Stephen T. Sherry, Gilean McVean, Richard Durbin and 1000 Genomes Project Analysis Group (2011). The Variant Call Format and VCFtools. Bioinformatics, Volume 27, Issue 15, Pages 2156 - 2158.
7. Tal Galili, Alan O'Callaghan, Jonathan Sidi, Carson Sievert; heatmaply: an R package for creating interactive cluster heatmaps for online publishing. Bioinformatics, , btx657, https://doi.org/10.1093/bioinformatics/btx657
8. Kim, D., Song, L., Breitwieser, F. P., & Salzberg, S. L. (2016). Centrifuge: rapid and sensitive classification of metagenomic sequences. Genome research, 26(12), 1721–1729. https://doi.org/10.1101/gr.210641.116
9. Ondov, B.D., Bergman, N.H. & Phillippy, A.M. Interactive metagenomic visualization in a Web browser. BMC Bioinformatics 12, 385 (2011). https://doi.org/10.1186/1471-2105-12-385
10. Seemann T, Abricate, Github https://github.com/tseemann/abricate
