#!/bin/bash
#BATCH --job-name=KP_HEV3_fetch # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-01:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/01_HEV3_fetch_err_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/01_HEV3_fetch_%j.log
#SBATCH --cpus-per-task=1

# Modify this script to fetch the nucleotide sequence for the HEV3 strain from GenBank
module load anaconda/3.5.2

# Set up your conda environment for entrez!
# https://bioconda.github.io/recipes/entrez-direct/README.html
source activate /home/people/kpurves/tools/entrez-direct

# Specify the GenBank accession number that you want to download
# You will want to download at least 5 sequences for the next exercise, so make sure they are different
accession_number="MH664124.2"  # Replace with the actual accession number

# Specify the output file name for the FASTA file
# Remember to include the .fasta extension
# Output files should be stored in the training/wk1/data folder
output_file="Hepeviridae_isolate_S26.fasta"
outdir="/home/people/kpurves/scratch/training/data"

# Fetch the nucleotide sequence for the provided accession number
# Try to modify this command to download protein sequences instead of nucleotide sequences
response=$(efetch -db nuccore -id "$accession_number" -format fasta -mode text 2>/dev/null)

conda deactivate /home/people/kpurves/tools/entrez-direct