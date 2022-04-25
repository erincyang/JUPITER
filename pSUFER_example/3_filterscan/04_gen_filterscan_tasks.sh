for f in `cat ../2_find_min_and_pos/all_min_pdbs`; do 
	cp ../1_relax/output/*/${f}.pdb input/scaffolds/
	cat positions/${f}_positions.list | while read line; do echo "./sh/filterscan.sh ${f}.pdb ${line}"; done > tasks
done