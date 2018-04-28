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

# calculate alpha diversity
echo "calculating alpha diversity"
time alpha_diversity.py -i ~/2018_02_smb/otus_2018_open/sorted_otu_table.biom -o ~/2018_02_smb/otus_2018_open/alpha_diversity_open.tsv -t ~2018_02_smb/otus_2018_open/rep_set.tre -m chao1,shannon 

# Rarefaction
echo "Plotting rarefaction plots"
time alpha_rarefaction.py -i ~/2018_02_smb/otus_2018_open/sorted_otu_table.biom -o ~/2018_02_smb/cdout_2018_open/rarefaction/ -p ~/2018_02_smb/parameters.txt -t ~/2018_02_smb/otus_2018_open/rep_set.tre -m ~/2018_02_smb/map_pH.txt

#deactivating environment
source deactivate 