#!/bin/bash
####### Reserve computing resources #############
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=05:00:00
#SBATCH --mem=0
#SBATCH --partition=single

####### Set environment variables ###############
echo -e '\n\n****\nPlease use -L ssh option to link '${SLURMD_NODENAME}':8888 to your local computer\n****\n\n'
unset XDG_RUNTIME_DIR

####### Run your script #########################
jupyter notebook --no-browser --ip=0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password=''
