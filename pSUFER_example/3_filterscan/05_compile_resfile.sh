header=1
for filename in output/*/resfiles/*; do
	cagename=`echo ${filename} | rev| cut -d'/' -f3| rev`
	if [[ $header -eq 1 ]]; then
		head -2 ${filename} > all_resfiles/${cagename}.resfile
		header=0
	fi
	tail -n+3 ${filename} >> all_resfiles/${cagename}.resfile
done
