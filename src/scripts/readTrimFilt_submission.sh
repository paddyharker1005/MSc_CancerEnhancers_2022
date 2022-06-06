#$ -cwd
#$ -N fastqc
#$ -l h_rt=01:00:00
#$ -l h_vmem=10G
. /etc/profile.d/modules.sh 
module load anaconda
source activate chipseq
./readTrimFilt.sh 
#$ -e fastqc.e
