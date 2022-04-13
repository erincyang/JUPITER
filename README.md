# JUPITER

These scripts are example scripts used by the undergraduates in the JUPITER program. 
Program described in: 

# pSUFER example 
1. in 1_relax/, run 00_gen_relax_tasks.sh
2. in 1_relax/, run sbatch -a 1-$(cat tasks|wc -l)%100 slurm_array_job.sh |tee slurm.log
3. in 2_procesing/, run 01_compile_score.sh 
4. in 2_processing/, Run the 02_find_minimum.ipynb in jupyter notebooks and replace the name of the minimum score pdb name in 02_id_intpositions.sh 
5. in 2_processing/, Run 03_id_intpositions.sh 
6. in 3_filterscan/, Run 04_gen_filterscan_tasks.sh; change the name of the pdb file to the minumum score pdb name from step 4
7. in 3_filterscan/, Run sbatch -a 1-$(cat tasks|wc -l)%100 slurm_array_job.sh |tee slurm.log
8. in 3_filterscan/, Run 05_compile_resfile.sh
9. in 3_fitlerscan/, Run 06_parse_score_file.ipynb in jupyter notebooks 


