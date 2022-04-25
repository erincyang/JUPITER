for f in `cat all_min_pdbs`; do
	awk '/design_resis/ {print $3}' ../1_relax/output/*/${f}.pdb > ../3_filterscan/positions/${f}_positions.list; 
done
