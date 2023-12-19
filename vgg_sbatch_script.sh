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

cd /temp

wget https://repo.anaconda.com/condap/Miniconda3-latest-Linux-x86_64.sh -O /temp/condap/miniconda.sh

bash /temp/condap/miniconda.sh -b -u -p /temp/condap

/temp/condap/bin/conda init

source ~/.bashrc

conda create --name d2l python=3.9 -y

source activate d2l

pip install torch==2.0.0 torchvision==0.15.1

pip install d2l==1.0.3

watch -n 1 nvidia-smi

python3 vgg.py
