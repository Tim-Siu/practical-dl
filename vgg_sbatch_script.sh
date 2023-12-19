#!/bin/bash

# SLURM job script to check allocated resources and software environment

#SBATCH --job-name=vgg_trial
#SBATCH --output=vgg_trial.out
#SBATCH --error=vgg_trial.err
#SBATCH --comment=
#SBATCH --ntasks=1
#SBATCH --time=1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=safes.boas0z@icloud.com
#SBATCH --gpus=a100:1

source activate d2l

python3 vgg.py
