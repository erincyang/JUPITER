for dirname in ../1_relax/output/*; do
header=1
pdb=`echo $dirname|rev|cut -d'/' -f1|rev`

	for filename in ../1_relax/output/${pdb}/*.sc; do
		if [[ $header -eq 1 ]]; then
		head -2 $filename |tail -1 > ../1_relax/output/${pdb}/${pdb}_scores.sc
		header=0
		fi
	
	tail -n+3 $filename >> ../1_relax/output/${pdb}/${pdb}_scores.sc

	done

done
