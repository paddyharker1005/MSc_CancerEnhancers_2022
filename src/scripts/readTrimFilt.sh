#!/bin/bash


FASTQ_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/raw_data
TRIMMED_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/processed_data/trimmed_reads
REFRENCE_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/raw_data/reference
OUTPUT_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/results/read_QC

#trim and filter the raw reads to remove adapters and discard low quality reads
tail -n +2 ${FASTQ_PATH}/cell_line_squamous_datasets.txt | while read line || [ -n "$line" ];
do
	TYPE=$(echo "$line" | awk 'BEGIN {FS="\t"} {print $4}')
	NEWNAME=$(echo "$line" | awk 'BEGIN {FS="\t"} {print $6}')
	if [ "$TYPE" == "PAIRED" ];
	then
		fastp -i ${FASTQ_PATH}/${NEWNAME}_1.fastq.gz -I ${FASTQ_PATH}/${NEWNAME}_2.fastq.gz -o ${TRIMMED_PATH}/trimmed_${NEWNAME}_1.fastq.gz -O ${TRIMMED_PATH}/trimmed_${NEWNAME}_2.fastq.gz -V --trim_poly_g --detect_adapter_for_pe
	else
		fastp -i ${FASTQ_PATH}/${NEWNAME}.fastq.gz -o ${TRIMMED_PATH}/trimmed_${NEWNAME}.fastq.gz -V --trim_poly_g

	fi
done

#run quality control again on the trimmed data
fastqc ${TRIMMED_PATH}/*.fastq.gz -t 20 -o $OUTPUT_PATH



