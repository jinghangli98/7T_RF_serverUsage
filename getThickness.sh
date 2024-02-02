#!/bin/bash
#SBATCH --job-name=thickness_processing
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=99:00:00
#SBATCH --array=1-243
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jil202@pitt.edu
#SBATCH --account=haizenstein
#SBATCH --cluster=htc

source activate DL_DiReCT
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Define an array of input filenames
T1s=(/ix1/haizenstein/jil202/MsBrain/data/*/*/Hires/*Hires.nii)

current_img=${T1s[$SLURM_ARRAY_TASK_ID - 1]}
current_name=$(echo "$current_img" | rev | cut -d'/' -f1 | rev)
current_name=$(echo "$current_name" | cut -d'.' -f1)
current_name=$(echo "$current_name" | cut -d'_' -f1-4)

current_folder=$(echo "$current_img" | cut -d'/' -f1-5)
output="$current_folder/thickness/$current_name"

dl+direct --subject $current_name --bet $current_img $output
