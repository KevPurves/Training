#!/bin/bash
#BATCH --job-name=01.filtlong.minlengths # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-5:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/01.filtlong.minlengths_error_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/01.filtlong.minlengths_%j.log
#SBATCH --cpus-per-task=7

#Testing limit for worst reads
bins=(1000 2000 3000 4000 5000 6000 7000)

OUTPUT_DIR="/home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/"

## for loop
for bin in "${bins[@]}"
do
    # Create a directory for each SRA accession
    mkdir -p "$OUTPUT_DIR/$bin"
    
    filtlong --min_length $bin --keep_percent 90 \
     /home/people/kpurves/scratch/training/data/Raw_data/SRR19500735/SRR19500735.fastq.gz | gzip > "/home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/$bin/SRR19500735.fastq.gz"
    
    echo "Filtered the reads by min_length with $bin successfully"

done