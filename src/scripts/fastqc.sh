#!/bin/bash

FASTQ_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/data
OUTPUT_PATH=/exports/eddie/scratch/s1749179/sox_cancer_enhancers/results/read_QC

fastqc ${FASTQ_PATH}/*.fastq.gz -t 20 -o $OUTPUT_PATH
