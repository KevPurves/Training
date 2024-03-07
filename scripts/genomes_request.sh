#!/bin/bash
#BATCH --job-name=01.genomes_request # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-5:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/01.genome_request_error_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/01.genome_request_%j.log
#SBATCH --cpus-per-task=4

#Direct download of camel genome 
#curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/803/125/GCF_000803125.2_CamDro3/GCF_000803125.2_CamDro3_genomic.fna.gz --output /home/people/kpurves/scratch/training/reference/arabian_camel_genome.fa

#download the tick genome

curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/013/339/685/GCA_013339685.2_BIME_Hyas_1.3/GCA_013339685.2_BIME_Hyas_1.3_genomic.fna.gz --output /home/people/kpurves/scratch/training/reference/Hyalomma_asiaticum.fa.gz

#Virus database for masking
#curl https://rvdb.dbi.udel.edu/download/C-RVDBvCurrent.fasta.gz --output /home/people/kpurves/scratch/training/reference/RVDB_230224.fa.gz


#module load anaconda/3.5.2

#/opt/software/anaconda/3.5.2/bin/conda activate /home/people/kpurves/tools/entrez-direct

#conda activate /home/people/kpurves/tools/entrez-direct

#efetch -db nuccore -id GCA_000803125.3 -format fasta > /home/people/kpurves/scratch/training/reference/arabian_camel_genome.fa

#conda deactivate

#module unload anaconda/3.5.2