# TBpipeline
A pipeline for epidemiology studies of Mycobacterium tuberculosis outbreak using WGS.
## Installation
[TBpipeline](https://github.com/idolawoye/TBpipeline.git) is hosted on github. 
Clone the pipeline with:

`git clone https://github.com/idolawoye/TBpipeline.git`

The pipeline has only been tested to work on Linux OS - Ubuntu 16.04 version. Earlier versions should work fine as long as the dependencies are properly installed. Ensure you have the [miniconda](https://conda.io/docs/user-guide/install/linux.html) package manager installed.
Once miniconda has been installed, run `bash install.sh` and follow on screen instructions.
## Dependencies
All dependencies should be rightly installed on the path of the workstation or server
* Fastp 
* Mykrobe predictor 
* Snippy 
* IQ-TREE 
* Snakemake
* VCFtools
## Running TBpipeline
All fastQ files **(paired end reads)** of *M.tuberculosis* should be saved in the **data/** folder. The pipeline uses [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) to run the workflow by cleaning and trimming the files, calling the variants, predicting Antimicrobial resistance, generating alignment files from the variants and constructing a phylogeny tree using maximum likelihood. To run the pipeline, simply enter: `snakemake -s tb_snakefile` You can specify the number of cores to run the workflow by adding `-j` followed by the number of cores.

Trimmed files will be deposisted in the **fastp** folder and Antimicrobial prediction results are ``.JSON`` files in **mykrobe_out/** folder. Individual variant calls with mutation sites and annotation of each sample will be deposited in the sample name directory. The JSON files can be converted to a tabular TSV format using the [json_to_tsv](https://github.com/idolawoye/TBpipeline/tree/master/mykrobe/json_to_tsv.py) script adopted from [Mykrobe Predictor](https://github.com/iqbal-lab/Mykrobe-predictor). To convert JSON files, simply run `snakemake -s json_to_tsv_snakemake` and all tabular AMR prediction results will be saved in the **tsv_out/** folder.

Alignment of variant calls will be deposited in the **TBpipeline/** directory as `core.aln`, TAB and VCF reports are also generated.
The phylogeny tree is constructed using the variant call alignment file, generating `core.aln.treefile` which can be visualised using any tree visualisation tool.

After running the pipeline, you can remove unnecessary files that were created during the workflow by running `bash cleanup.sh` on the command line.

## References 
1. Shifu Chen, Yanqing Zhou, Yaru Chen, Jia Gu (2018); fastp: an ultra-fast all-in-one FASTQ preprocessor, Bioinformatics, Volume 34, Issue 17, Pages i884–i890, https://doi.org/10.1093/bioinformatics/bty560
2. L.-T. Nguyen, H.A. Schmidt, A. von Haeseler, B.Q. Minh (2015) IQ-TREE: A fast and effective stochastic algorithm for estimating maximum likelihood phylogenies.. Mol. Biol. Evol., 32:268-274. https://doi.org/10.1093/molbev/msu300
3. Bradley, Phelim, et al. (2015) Rapid antibiotic-resistance predictions from genome sequence data for Staphylococcus aureus and Mycobacterium tuberculosis. Nature communications 6.
4. Köster, Johannes and Rahmann, Sven (2012). Snakemake - A scalable bioinformatics workflow engine. Bioinformatics.
5. [Snippy](https://github.com/tseemann/snippy).

6. Petr Danecek, Adam Auton, Goncalo Abecasis, Cornelis A. Albers, Eric Banks, Mark A. DePristo, Robert Handsaker, Gerton Lunter, Gabor Marth, Stephen T. Sherry, Gilean McVean, Richard Durbin and 1000 Genomes Project Analysis Group (2011). The Variant Call Format and VCFtools. Bioinformatics, Volume 27, Issue 15, Pages 2156 - 2158.
