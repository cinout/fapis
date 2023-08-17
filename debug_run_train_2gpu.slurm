#!/bin/bash

###SBATCH --partition=gpu-a100

#SBATCH --partition=feit-gpu-a100
#SBATCH --qos=feit

###SBATCH --partition=deeplearn
###SBATCH --qos=gpgpudeeplearn
###SBATCH --constraint=dlg4|dlg5

#SBATCH --job-name="fap"
#SBATCH --account=punim1623
#SBATCH --time=0-01:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --gres=gpu:2

### "ntasks-per-node" should have same value as "res=gpu:"

#SBATCH --mem=50G

module purge

eval "$(conda shell.bash hook)"
conda activate fapis

set -e
set -x

data_dir="./dataset/mvtec_train/"
output_dir="./output/mvtec"

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 ./tools/dist_train.sh \
    configs/mask_rcnn_r50_fpn_1x.py \
    2 \



    

##Log this job's resource usage stats###
my-job-stats -a -n -s
##