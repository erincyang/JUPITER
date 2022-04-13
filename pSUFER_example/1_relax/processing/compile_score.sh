header=1
for filename in /home/akhmelin/JUPITER/LSO/1_relax/output/I3_1/*.sc; do
	if [[ $header -eq 1 ]]; then
		head -2 $filename |tail -1 > I3_1_scores.sc
		header=0
	fi
	tail -n+3 $filename >> I3_1_scores.sc
done
