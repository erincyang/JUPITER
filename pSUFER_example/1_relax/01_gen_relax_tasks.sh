if [[ -e tasks ]]; then 
	rm tasks
fi

for pdb in input/*.pdb; do 
for i in {1..20}; do echo "./sh/relax.sh ${pdb} $i"; done ; done  > tasks