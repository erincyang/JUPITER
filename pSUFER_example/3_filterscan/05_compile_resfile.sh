header=1
for filename in output/I3_1/resfiles/*; do
	pdb=`echo $filename |rev | cut -d'/' -f3|rev`
	if [[ $header -eq 1 ]]; then
		head -2 $filename > ${pdb}.resfile
		header=0
	fi
	tail -n+3 $filename >> ${pdb}.resfile
done
