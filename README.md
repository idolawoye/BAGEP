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

Trimmed files will be deposisted in the **fastp** folder and Antimicrobial prediction results are ``.JSON`` files in **mykrobe_out/** folder. Individual variant calls with mutation sites and annotation of each sample will be deposited in the sample name directory. The JSON files can be converted to a tabular TSV format using the [json_to_tsv] script adopted from [Mykrobe Predictor](https://github.com/iqbal-lab/Mykrobe-predictor)

Alignment of variant calls will be deposited in the **TBpipeline/** directory as `core.aln`, TAB and VCF reports are also generated.
The phylogeny tree is constructed using the variant call alignment file, generating `core.aln.treefile` which can be visualised using any tree visualisation tool.
