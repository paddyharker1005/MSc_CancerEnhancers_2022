#!/bin/bash



# To run this script, do 
# qsub -t 1-n submit_permutationTest.sh CONFIG IDS PERMUTATION_NUMBER CORES
#
#$ -N circPerm
#$ -j y
#$ -S /bin/bash
#$ -cwd
#$ -l h_vmem=32G
#$ -l h_rt=72:00:00

CONFIG=$1
IDS=$2
PERMUTATION_NUMBER=$3
CORES=$4

source $CONFIG

SAMPLE=$(head -n $SGE_TASK_ID $IDS | tail -n 1 | cut -f 1)
INPUTA=$(head -n $SGE_TASK_ID $IDS | tail -n 1 | cut -f 2)
INPUTB=$(head -n $SGE_TASK_ID $IDS | tail -n 1 | cut -f 3)


export PATH=/exports/igmm/eddie/Glioblastoma-WGS/anaconda/envs/stats/bin:$PATH

Rscript permutation.R \
	--inputA $INPUTA \
	--inputB $INPUTB \
	--sample $SAMPLE \
	--ntimes $PERMUTATION_NUMBER \
	--cores $CORES