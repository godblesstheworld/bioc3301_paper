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

# Make 2D PCoA plots
echo "making 2D PCoA plots for pH"
time  make_2d_plots.py -i ~/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_pc.txt -m ~/2018_02_smb/map.tsv -b 'SamplePh' -o ~/2018_02_smb/cdout_2018_open/2D_PCoA/pH/

# Make 2D PCoA plots
echo "making 2D PCoA plots for K"
time  make_2d_plots.py -i ~/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_pc.txt -m ~/2018_02_smb/map.tsv -b 'SamplePotassium' -o ~/2018_02_smb/cdout_2018_open/2D_PCoA/K/

# Make 2D PCoA plots
echo "making 2D PCoA plots for N"
time  make_2d_plots.py -i ~/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_pc.txt -m ~/2018_02_smb/map.tsv -b 'SampleNitrogen' -o ~/2018_02_smb/cdout_2018_open/2D_PCoA/N/

# Make 2D PCoA plots
echo "making 2D PCoA plots for P"
time  make_2d_plots.py -i ~/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_pc.txt -m ~/2018_02_smb/map.tsv -b 'SamplePhosphorus' -o ~/2018_02_smb/cdout_2018_open/2D_PCoA/P/

#deactivating environment
source deactivate 