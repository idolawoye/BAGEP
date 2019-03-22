# BAGEP
Bacterial Genome Pipeline (BAGEP) is an automated workflow for downstream analysis of Whole genome sequencing of bacterial samples
## Installation
[BAGEP](https://github.com/idolawoye/BAGEP.git) is hosted on github. 
Clone the pipeline with:

`git clone https://github.com/idolawoye/BAGEP.git`

The pipeline has only been tested to work on Linux OS - Ubuntu 16.04 version. Earlier versions should work fine as long as the dependencies are properly installed. Ensure you have the [miniconda](https://conda.io/docs/user-guide/install/linux.html) package manager installed.
Once miniconda has been installed, run `bash install.sh` and follow on screen instructions.
## Dependencies
All dependencies should be rightly installed on the path of the workstation or server
* Fastp 
* Snippy 
* IQ-TREE 
* fasttree
* Snakemake
* VCFtools
## Running TBpipeline
All fastQ files **(paired end reads)** of same bacterial species should be saved in a **fastq/** folder. The pipeline uses [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) to run the workflow by cleaning and trimming the files, calling variants, generating alignment files from the core and whole genome and constructing a phylogeny tree on either the core genome or whole genome using maximum likelihood. To run the pipeline, simply enter: `snakemake -s bagep --config ref = {users reference genome}` You can specify the number of cores to run the workflow by adding `-j` followed by the number of cores.

Trimmed files will be deposisted in the **fastp** folder. A reference genome for mapping should be provided for the bacterial samples, either in .gbk or .fasta format.

Alignment of core genomes will be deposited in the **results/** directory as `core.aln`, whole genome alignment in same directory as `core.full.aln` TAB and VCF reports are also generated. If you wish to inspect individual variant reports it will be deposited in a folder with the name of the sample as a sub directory in fastq
The phylogeny tree is constructed using the aligned core/whole genomes (whole genomes bu default), generating `*.treefile` which can be visualised using any tree visualisation tool.


## References 
1. Shifu Chen, Yanqing Zhou, Yaru Chen, Jia Gu (2018); fastp: an ultra-fast all-in-one FASTQ preprocessor, Bioinformatics, Volume 34, Issue 17, Pages i884–i890, https://doi.org/10.1093/bioinformatics/bty560
2. L.-T. Nguyen, H.A. Schmidt, A. von Haeseler, B.Q. Minh (2015) IQ-TREE: A fast and effective stochastic algorithm for estimating maximum likelihood phylogenies.. Mol. Biol. Evol., 32:268-274. https://doi.org/10.1093/molbev/msu300
3. Köster, Johannes and Rahmann, Sven (2012). Snakemake - A scalable bioinformatics workflow engine. Bioinformatics.
4. [Snippy](https://github.com/tseemann/snippy).

5. Petr Danecek, Adam Auton, Goncalo Abecasis, Cornelis A. Albers, Eric Banks, Mark A. DePristo, Robert Handsaker, Gerton Lunter, Gabor Marth, Stephen T. Sherry, Gilean McVean, Richard Durbin and 1000 Genomes Project Analysis Group (2011). The Variant Call Format and VCFtools. Bioinformatics, Volume 27, Issue 15, Pages 2156 - 2158.
6. Morgan N. Price  Paramvir S. Dehal  Adam P. Arkin (2009). FastTree: Computing Large Minimum Evolution Trees with Profiles instead of a Distance Matrix. Molecular Biology and Evolution, Volume 26, Issue 7, Pages 1641–1650
