#!/bin/sh

#$ -cwd
#$ -N fastqc
#$ -l h_rt=00:30:00
#$ -l h_vmem=10G
. /etc/profile.d/modules.sh
module load java
module load igmm/apps/FastQC/0.11.9 
./fastqc.sh 
#$ -e fastqc.e
