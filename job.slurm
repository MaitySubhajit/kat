#!/bin/bash
### #SBATCH --account=smaity
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16384
#SBATCH --gres=gpu:2
#SBATCH --constraint=h100
#SBATCH --time=120:00:00
#SBATCH --error=outs/%J.err
#SBATCH --output=outs/%J.out
#SBATCH --job-name=kat_tiny

module purge
### source /apps/anaconda/anaconda3/etc/profile.d/conda.sh
module load gcc
module load cuda/cuda-12.1
module load anaconda
### source activate video-chatgpt
conda activate KAT

module list

## Run job ##
cd /home/smaity/projects/kat

bash scripts/train_kat_tiny_8x128.sh