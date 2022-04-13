#!/bin/bash
#SBATCH -J relax_cage
#SBATCH -p short
#SBATCH --mem=10G
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o digs.log
#SBATCH -e digs.log

echo "Hello from job $SLURM_JOB_ID on $(hostname) at $(date)"
CMD=$(head -n $SLURM_ARRAY_TASK_ID tasks | tail -1)
exec ${CMD}

#####command:
#####sbatch -a 1-$(cat tasks|wc -l)%100 digs_array_job.sh |tee digs.log
