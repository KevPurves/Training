#!/bin/bash
#BATCH --job-name=01.nanopack.1000 # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-5:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/01.nanopack.1000_error_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/01.nanopack.1000_%j.log
#SBATCH --cpus-per-task=7

# Load anaconda module
module load anaconda/3.5.2
source activate /home/people/kpurves/tools/nanpack_env

# Run NanoPlot
NanoPlot --fastq /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/SRR19500735.fastq.gz --outdir /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/NanoPlot

# Run NanoCamp
# Replace <fastq-file1>, <fastq-file2>, etc. with your actual fastq files
NanoComp --fastq /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/SRR19500735.fastq.gz --outdir /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/NanoCamp

# Run NanoQC
NanoQC /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/SRR19500735.fastq.gz --outdir /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/NanoQC

# Deactivate the conda environment
conda deactivate 