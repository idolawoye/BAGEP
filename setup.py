import os
from setuptools import setup

setup(
		name = "TBpipeline",
		version = "0.0.1",
		author = "Idowu Olawoye",
		author_email = "idowuolawoye@gmail.com",
		description = ("Pipeline for phylogenic analysis of TB to track transmission"),
		license = "MIT",
		keywords = "mycobacterium tuberculosis, mtb, molecular epidemiology",
		url = "https://github.com/idolawoye/TBpipeline]",
		install_requires = [
			"biopython >=1.71",
			"boto >=2.48.0",
			"cvxopt >=1.1.9",
			"Cython >=0.28.2",
			"jsonschema >=2.6.0",
			"matplotlib >=2.2.2",
			"networkx >=2.1",
			"numpy >=1.14.3",
			"pandas >=0.23.3",
			"pysam >=0.14.1",
			"PyYAML >=3.12",
			"scipy >=1.1.0",
			"seaborn >=0.6.0",
			"snakemake >=5.1.2"]
		)
