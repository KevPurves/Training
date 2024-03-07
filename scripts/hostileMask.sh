#!/bin/bash
#BATCH --job-name=hostileMask # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-5:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/hostileMask_error_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/hostileMask_%j.log
#SBATCH --cpus-per-task=7

# Load anaconda module
module load anaconda/3.5.2

#####################################hostile###############################################################################################

source activate /home/people/kpurves/tools/hostile_env

# You will then use hostile to mask your host reference genome with viral reference genomes. 
# This will prevent the alignment of viral reads to the host genome and their subsequent removal.

hostile mask /home/people/kpurves/scratch/training/reference/Hyalomma_asiaticum.fa.gz /home/people/kpurves/scratch/training/reference/RVDB_230224.fa.gz --threads 8\
 --out-dir home/people/kpurves/scratch/training/reference/masked/
conda deactivate

### Remove host contamination
#Now that we have our masked host genome, we can use Hostile to remove host contamination from our metagenomic data. 

####################################################################################################################################################

# edited for long read data
bowtie2-build "/home/people/kpurves/scratch/training/reference/masked/masked/masked.fa" "/home/people/kpurves/scratch/training/reference/masked/masked/mask.index"

minimap2 -d /home/people/kpurves/scratch/training/reference/masked/masked/mask.mmi /home/people/kpurves/scratch/training/reference/masked/masked/masked.fa

mkdir /home/people/kpurves/scratch/training/data/CleanData

source activate /home/people/kpurves/tools/hostile_env

hostile clean --fastq1 /home/people/kpurves/scratch/training/data/filtlong_data/SRR19500735/1000/SRR19500735.fastq.gz \
--index /home/people/kpurves/scratch/training/reference/masked/masked/mask.mmi \
--out-dir /home/people/kpurves/scratch/training/data/CleanData \
--aligner minimap2 

conda deactivate