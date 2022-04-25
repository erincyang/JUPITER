# JUPITER

These scripts are example scripts used by the undergraduates in the JUPITER program. 
Program described in: 

# pSUFER example 

The first step is to relax the cage: 

1. in 1_relax/, run 00_gen_relax_tasks.sh

2. Execute each task job. On a slurm scheduler: in 1_relax/, run sbatch -a 1-$(cat tasks|wc -l)%100 slurm_array_job.sh |tee slurm.log

To select the lowest energy state of the cage and identify the positions at the interface for filterscan: 

3. in 2_find_min_and_pos/, run 01_compile_score.sh 

4. in 2_find_min_and_pos/, Run the 02_find_minimum.py with python3.7

5. in 2_find_min_and_pos/, Run 03_id_int_positions.sh 

To execute filterscan and analyze results:

6. in 3_filterscan/, Run 04_gen_filterscan_tasks.sh

7. in 3_filterscan/, Run sbatch -a 1-$(cat tasks|wc -l)%100 slurm_array_job.sh |tee slurm.log

8. in 3_filterscan/, Run 05_compile_resfile.sh

9. in 3_filterscan/, Run 06_parse_score_file.ipynb in jupyter notebooks 


