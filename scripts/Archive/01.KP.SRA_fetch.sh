#!/bin/bash
#BATCH --job-name=01.KP_SRA_fetch # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-48:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/01_SRA_fetch_err_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/01_SRA_fetch_%j.log
#SBATCH --cpus-per-task=7

# Modify this script to fetch the nucleotide sequence for the HEV3 strain from GenBank
module load anaconda/3.5.2

# Set up your conda environment for sra tools!
# https://bioconda.github.io/recipes/entrez-direct/README.html
source activate /home/people/kpurves/tools/sra_tools

# Specify the GenBank accession number that you want to download
# You will want to download at least 5 sequences for the next exercise, so make sure they are different
SRAs=("SRR19500735" "SRR18511568" "SRR12835201") 

# Specify the output file name for the FASTA file
# Remember to include the .fasta extension

OUTPUT_DIR="/home/people/kpurves/scratch/training/data"

## for loop
for SRA in "${SRAs[@]}"
do
    # Create a directory for each SRA accession
    mkdir -p "$OUTPUT_DIR/$SRA"
    
    # Change to the directory for the specific SRA accession
    cd "$OUTPUT_DIR/$SRA"
    
    # Download the SRA file using prefetch (part of SRA Toolkit)
    prefetch "$SRA"
    
    # Convert the SRA file to fastq format using fastq-dump (part of SRA Toolkit)
    fasterq-dump --split-files "$SRA" -O "$OUTPUT_DIR/$SRA"
    
    echo "Downloaded $SRA successfully"
done

conda deactivate 

module unload /home/people/kpurves/tools/anaconda/3.5.2