cat positions.list | while read line; do echo "./sh/filterscan.sh input/{name_of_min_score_pdb}.pdb ${line}"; done > tasks

