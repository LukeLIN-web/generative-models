#!/bin/bash

#SBATCH --job-name=my_job        # Job name
#SBATCH --output=result.out      # Output file
#SBATCH --error=error.err        # Error file
#SBATCH --ntasks=1               # Number of tasks (usually set to 1 for serial jobs)
#SBATCH --cpus-per-task=4        # Number of CPU cores per task
#SBATCH --mem=16G                # Memory per node (in GB)
#SBATCH --time=01:00:00          # Time limit (hh:mm:ss)
#SBATCH --partition=gpu          # Partition (queue) to submit to (gpu, general, etc.)
#SBATCH --gres=gpu:v100-sxm2:1             # Request 1 GPU 32GB V100
#SBATCH --mail-type=END,FAIL     # Notifications for job done & fail
#SBATCH --mail-user=forxexamp  # Send notifications to this email

module load cuda/12.1
conda activate videosys

nvidia-smi > gpu_info.txt
python export.py

