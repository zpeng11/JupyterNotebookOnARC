#!/bin/bash
####### Reserve computing resources #############
#SBATCH --time=01:00:00
#SBATCH --mem=0
#SBATCH --partition=gpu-v100
#SBATCH --gres=gpu:1

####### Set environment variables ###############
echo -e '\n\n****\nPlease use -L ssh option to link '${SLURMD_NODENAME}':8888 to your local computer\n****\n\n'
unset XDG_RUNTIME_DIR

####### Run your script #########################
jupyter notebook --no-browser --ip=0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password=''
