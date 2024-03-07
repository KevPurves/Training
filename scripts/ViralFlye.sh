#!/bin/bash
#BATCH --job-name=KP.ViralFlye # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user kevin.purves@ucd.ie # Where to send mail
#SBATCH -t 0-5:00  # Time for the task to complete
#SBATCH --error=/home/people/kpurves/scratch/training/logs/KP.ViralFlye_error_%j.log # Standard output and error log
#SBATCH --output=/home/people/kpurves/scratch/training/logs/KP.ViralFlye_%j.log
#SBATCH --cpus-per-task=7

#Create a draft assembly with flye


#module load anaconda/3.5.2
#source activate /home/people/kpurves/tools/flye
#flye --nano-raw /home/people/kpurves/scratch/training/data/CleanData/SRR19500735.clean.fastq.gz --out-dir /home/people/kpurves/scratch/training/data/Assembly/flye/SRR19500735 --threads 4 --meta 
#conda deactivate

#Once flye has completed, then use viralFlye to polish the assembly

module load anaconda/3.5.2
module activate viralFlye
viralFlye="/home/people/kpurves/tools/viralFlye/viralFlye.py"

$viralFlye --dir "/home/people/kpurves/scratch/training/data/Assembly/flye/SRR19500735" --hmm "/home/people/kpurves/tools/viralFlye/Pfam-A.hmm.gz" --reads "/home/people/kpurves/scratch/training/data/CleanData/SRR19500735.clean.fastq.gz" --outdir "/home/people/kpurves/scratch/training/data/Assembly/viralFlye/SRR19500735"

conda deactivate

module unload anaconda/3.5.2
