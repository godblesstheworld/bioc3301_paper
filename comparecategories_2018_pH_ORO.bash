#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -n 24
#SBATCH -p short

#Load modules
module load eb
module load Miniconda2
module load R/3.2.1-foss-2015b

# loading virtualenv
source activate qiime1

# setting temporary directory
export TMPDIR=~/qiime_tmp

# Compare categories
echo "comparing categories"
time compare_categories.py --method adonis -i ~/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_dm.txt -m ~/2018_02_smb/map.tsv -c SamplePh -o ~/2018_02_smb/compare_categories/pH_open

#deactivating environment
source deactivate 