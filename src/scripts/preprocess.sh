#!/bin/bash 

FASTQ_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/data

tail -n +2 ${FASTQ_PATH}/cell_line_squamous_datasets.txt | while read line || [ -n "$line" ];
do
	echo $line
	SRR=$(echo "$line" | awk 'BEGIN {FS="\t"} {print $5}')
	NEWNAME=$(echo "$line" | awk 'BEGIN {FS="\t"} {print $6}')
	TYPE=$(echo "$line" | awk 'BEGIN {FS="\t"} {print $4}')

	echo $SRR
	echo $NEWNAME
	echo $TYPE
	
	if [ "$TYPE" == "PAIRED" ]; 
	then
		mv ${FASTQ_PATH}/${SRR}_1.fastq.gz $FASTQ_PATH/${NEWNAME}_1.fastq.gz
		mv ${FASTQ_PATH}/${SRR}_2.fastq.gz $FASTQ_PATH/${NEWNAME}_2.fastq.gz
	else
		mv ${FASTQ_PATH}/${SRR}.fastq.gz $FASTQ_PATH/${NEWNAME}.fastq.gz
	fi
done
