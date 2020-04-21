---
title: 'The Bacteria Genome Pipeline (BAGEP): An automated, scalable workflow for bacteria genomes with Snakemake'
tags:
  - Bacteria
  - Bioinformatics
  - Genome
  - Pipeline
  - Workflow
authors:
  - name: Idowu B. Olawoye
    orcid: 0000-0002-6658-9917
    affiliation: "1, 2"
  - name: Simon D.W. Frost
    affiliation: "3, 4"
  - name: Christian T. Happi
    orcid: 0000-0002-3056-6705
    affiliation: "1, 2"
affiliations:
  - name: Department of Biological Sciences, Faculty of Natural Sciences, Redeemer's University, Ede, Osun State, Nigeria.
    index: 1
  - name: African Centre of Excellence of Genomics of Infectious Diseases (ACEGID), Redeemer's University, Ede, Osun State, Nigeria.
    index: 2
  - name: Microsoft Research, Redmond, Washington, USA.
    index: 3
  - name: London School of Hygiene and Tropical Medicine, London, UK
    index: 4
date: 21 April 2020
bibliography: paper.bib
---

# Summary

Next generation sequencing technologies are becoming more accessible and affordable over the years, with the entire genomes of pathogens being deciphered in few hours. However, there is the need to analyze multiple genomes within a short time, in order to provide critical information about a pathogen of interest such as drug resistance, mutations and patient-to-patient transmission in an outbreak setting. Many pipelines that do this are stand-alone workflows and require huge computational requirements to analyze multiple genomes. We present an automated and scalable pipeline called BAGEP that performs quality control on FASTQ paired end files, maps them to a reference genome of choice, constructs a phylogenetic tree from core genome alignments and generates a Short Nucleotide Polymorphism (SNP) visualization across core genomes in the dataset. The aim was to create an easy to use pipeline from existing bioinformatics tools that can be deployed on a personal computer.

BAGEP was built on <em>Snakemake</em> [@Koster:2012] framework and utilizes existing tools for each processing step: <em>fastp</em> [@Chen:2018] for quality trimming, <em>snippy</em> for variant calling, <em>snippy-core</em> for whole and core genome alignments [@Seemann:2015], <em>IQ-TREE</em> [@Nguyen:2015] for phylogenetic tree construction and <em>vcfr</em> [@Knaus:2017] for the interactive heatmap visualization showing SNPs at specific locations across the genomes.

BAGEP was successfully tested and validated with <em>Mycobacterium tuberculosis</em> (n=20) and <em>Salmonella enterica</em> serova Typhi (n=20) genomes which were about 4.4 million and 4.8 million base pairs respectively. Running these test data on a 8 GB RAM, 2.5 GHz quad core laptop took 28 and 19 minutes on respective data sets to complete the analysis.

# Statement of Need


# Citations


# Figures


# Acknowledgements


# References
