#2020-02-17
input="${1}"; index="${2}"

#define run settings
exe_path="/software/rosetta/latest/bin/rosetta_scripts -database /software/rosetta/latest/main/database/"

#dump asu?
dump_asu="true"

#parse components
in_name=`echo ${input##*/} |cut -d'.' -f1`

sym=`echo ${in_name} |cut -d'_' -f1`
arche=`echo ${sym} |cut -c1`
axis1=`echo ${sym} |cut -c2`
axis2=`echo ${sym} |cut -c3`
axis3=`echo ${sym} |cut -c4`

#check number of components
if [[ -z ${axis1} ]]; then echo "axis 1 cannot be empty!"; exit
elif [[ -z ${axis2} ]]; then num_comp="1"
elif [[ -z ${axis3} ]]; then num_comp="2"
else num_comp="3"; fi

reverse="F"

#parse dofs
a1="0"
a2="0"
r1="0"
r2="0"

file_input="${in_name}.pdb"
use_transforms="no_transforms"

#make folders
mkdir -p output/${in_name}
outpath="output/${in_name}"
	
#symmmetry
nsub_bb=${axis1}
symfile="symdef/I3.sym"
symdof1="JCT00"
symdof2="${symdof1}"

#check reverse
flip_axes="0,0"
if [[ "${reverse}" == 'R' ]]; then
	flip_axes="y,0"
	if [[ "${comp1_dummy}" == "dummy" ]]; then
		flip_axes="0"
	fi
fi

#run Rosetta
if [[ ! -e ${outpath}/score_${index}.sc ]]; then
	${exe_path} \
		-out::file::pdb_comments \
		-parser:protocol xml/refine_Ag_cage.xml \
		-s      ${file_input} \
		-native ${file_input} \
		-use_input_sc \
		-extrachi_cutoff 5 \
		-ignore_unrecognized_res \
		-use_occurrence_data \
		-nstruct 1 \
		-parser:script_vars sym="${symfile}" a1="${a1}" a2="${a2}" r1="${r1}" r2="${r2}" nsub_bb="${nsub_bb}" flip_axes="${flip_axes}" symdof1="${symdof1}" symdof2="${symdof2}" outpath="${outpath}" use_transforms="${use_transforms}" comp="${num_comp}comp" \
		-overwrite 1 \
		-chemical:exclude_patches LowerDNA  UpperDNA Cterm_amidation SpecialRotamer VirtualBB ShoveBB VirtualDNAPhosphate VirtualNTerm CTermConnect sc_orbitals pro_hydroxylated_case1 pro_hydroxylated_case2 ser_phosphorylated thr_phosphorylated  tyr_phosphorylated tyr_sulfated lys_dimethylated lys_monomethylated  lys_trimethylated lys_acetylated glu_carboxylated cys_acetylated tyr_diiodinated N_acetylated C_methylamidated MethylatedProteinCterm \
		-linmem_ig 10 \
		-ignore_zero_occupancy false \
		-unmute all \
		-out:suffix "_${index}" \
		-out:level 300 \
		-out::path::all ${outpath}/ \
        -output_only_asymmetric_unit ${dump_asu} \
        -failed_job_exception False \
        -mute core.select.residue_selector.SecondaryStructureSelector \
		> ${outpath}/${in_name}_${index}.log
else
	echo "${outpath}/score_${index}.sc exists!"
fi
