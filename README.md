# MSc_CancerEnhancers_2022
This repository contains the Eddie compute cluster submission scripts used to process and integrate the raw SOX2, SOX9 and H3K27ac ChIP-seq data for glioblastoma stem cell (GSC) cell lines and squamous cell carcinoma (SCC) cell lines (see ```raw_data/``` for sample summaries).

Many of the scripts have been adapted from those created by Alhafidz Hamdan for the analysis of SOX2/SOX9 ChIP-seq data. See https://github.com/alhafidzhamdan/SOX2_SOX9_self-renewal for these scripts.

## Overview of ChIP-seq data processing scripts:

1. ```sub_fastqc.sh```: Raw sequence read QC (both single and paired-end reads)

2. ```sub_TrimFilt.sh```: Trim and filter the raw reads to remove adapters and discard low quality reads (both single and paired-end reads) 

3. ```sub_alignment.sh``` / ```sub_alignment_BWAmem.sh```: Alignment to hg38 using BWA aln (read length <70bp) or BWA mem (read length >=70bp)

4. ```sub_preseq_phantom.sh```: Assess library complexity (preseq) and ChIP enrichment (phantompeak)

5. ```sub_bamQC.sh```: Remove multi-mapped reads and filter blacklisted regions 

6. ```sub_plotFingerprint.sh```: Assess ChIP enrichment

7. ```sub_MACS2_callpeak.sh```: Call peaks using MACS2 for SOX2 (narrow) and H3K27ac (broad)

8. ```sub_bamCov.sh```: Generate bigWig coverage files

## Overview of analysis scripts:

1. ```sub_permutation.sh/permutation.R```: Circular permutation test and local Z-score shifting from regioneR (see https://www.bioconductor.org/packages/devel/bioc/vignettes/regioneR/inst/doc/regioneR.html)

2. ```sub_SOX2_SOX9_intersect.sh```: Intersect SOX2 and SOX9 peaks for GBM data and extract fasta sequences 

3. ```sub_SOX2_SOX9_enhancer_intersect_alt.sh```: Intersect putative SOX2/SOX9 enhancers between cell lines and cancer types and extract fasta sequences of shared and cancer-specific enhancers
