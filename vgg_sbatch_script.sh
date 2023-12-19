#!/bin/bash

# SLURM job script to check allocated resources and software environment

#SBATCH --job-name=vgg_trial
#SBATCH --output=vgg_trial.out
#SBATCH --error=vgg_trial.err
#SBATCH --comment="VGG trial"
#SBATCH --partition=medium
#SBATCH --time=02:59:00
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=safes.boas0z@icloud.com
#SBATCH --gpus=titanv:1

nvidia-smi

cd /temp

mkdir condap

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /temp/condap/miniconda.sh

bash /temp/condap/miniconda.sh -b -u -p /temp/condap


/temp/condap/bin/conda init

source ~/.bashrc

conda create --name d2l python=3.9 -y

source activate d2l

pip install torch==2.0.0 torchvision==0.15.1

pip install d2l==1.0.3

watch -n 1 nvidia-smi

python3 vgg.py
