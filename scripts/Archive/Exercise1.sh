#!/bin/bash

# Conda is an open-source package management and environment management system for installing and 
# managing software packages and dependencies across various computing platforms. 
# It simplifies the process of creating, sharing, and managing software environments for different 
# projects and applications.

# We can use conda to create a new environment for our project. 
# This environment will contain all the necessary libraries and tools we need to complete our project.
# To use conda, we first need to load the Anaconda module.

# To load modules, we use the module load command followed by the name of the module we want to load.
module load anaconda/3.5.2

# To see a list of available modules, we can use the module avail command.
module avail 

# To see a list of modules that are currently loaded, we can use the module list command.
moudle list

###########################################################################################################
# It is good practice to store all of your tools (packages, libraries, etc.) in a separate folder in your home directory
# Create a new folder named 'tools' in your home directory

# Step 1: Navigate to your home directory
cd ~

# Step 2: Create a new folder named 'tools'
mkdir tools

# Step 3: Navigate to the new folder
cd tools

############################################################################################################
# Now let's create a new Conda environment for the tool Diamond
# DIAMOND (DIAMOND Is A Metagenomic Omic pipeline for NGS Data) is a bioinformatics tool designed for rapid and sensitive sequence alignment and similarity searches, 
# commonly used for comparing protein or nucleotide sequences against large databases. 
# It employs efficient algorithms and heuristics, providing a faster alternative to traditional tools like BLAST for analyzing large-scale genomic and metagenomic datasets.

# create the conda environment first using a prefix command to specify the path to the new environment
conda create --prefix /home/people/<username>/tools/diamond_env

# Activate the new environment
conda activate /home/people/<username>/tools/diamond_env

# Install Diamond from the bioconda channel
conda install -c bioconda diamond

# Check that the installation was successful
diamond help

# You should see a list of commmands in you terminal such as the following: makeblastdb, blastp, blastx, blastn, etc.

###############################################################################################################
# Now we will use diamond to make a database from a fasta file that I have provided for you
# Data analysis should always be performed on the scratch folder of the HPC 

# Step 1: Navigate to your scratch folder
cd /scratch/<username>

# Step 2: Create a new folder named training/wk1/data
mkdir -p training/wk1/data

# Step 3: Navigate to the new folder
cd training/wk1/data

# Step 4: Copy the fasta file from my home directory to your scratch folder
cp /home/people/<username>/training/wk1/data/HEV3.fasta .

# Step 5: Create the diamond_db
diamond makedb --in HEV3.fasta -d HEV3

# Step 6: Check that the database was created
ls

# Congratulations! You have successfully created a diamond database from a fasta file