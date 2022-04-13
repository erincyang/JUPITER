awk '/design_resis/ {print $3}' ../1_relax/output/I3_1/{CHANGE_NAME_HERE}.pdb > ../3_filterscan/positions.list

