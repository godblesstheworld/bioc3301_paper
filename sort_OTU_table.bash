#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -n 24
#SBATCH -p short

#Load modules
module load eb
module load Miniconda2

# loading virtualenv
source activate qiime1

# setting temporary directory
export TMPDIR=~/qiime_tmp

# sort OTU table
echo "sorting OTU table"
time sort_otu_table.py -i ~/2018_02_smb/otus_2018_open/otu_table_mc2_w_tax.biom -m ~/2018_02_smb/map.tsv -s SamplePh -o ~/2018_02_smb/otus_2018_open/sorted_otu_table.biom

#deactivating environment
source deactivate 