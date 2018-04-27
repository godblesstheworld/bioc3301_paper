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

# create distance matrix 
echo "creating distance matrix pH"
time distance_matrix_from_mapping.py -i ~/2018_02_smb/map_quantitative.txt -c SamplePh -o ~/2018_02_smb/PH_dm.txt

# create distance matrix 
echo "creating distance matrix K"
time distance_matrix_from_mapping.py -i ~/2018_02_smb/map_quantitative.txt -c SamplePotassium -o ~/2018_02_smb/K_dm.txt

# create distance matrix 
echo "creating distance matrix N"
time distance_matrix_from_mapping.py -i ~/2018_02_smb/map_quantitative.txt -c SampleNitrogen -o ~/2018_02_smb/N_dm.txt

# create distance matrix 
echo "creating distance matrix P"
time distance_matrix_from_mapping.py -i ~/2018_02_smb/map_quantitative.txt -c SamplePhosphorus -o ~/2018_02_smb/P_dm.txt

# compare distance matrix
echo "comparing dist matrix pH"
time compare_distance_matrices.py --method=mantel -i /home/cbmucl40/2018_02_smb/PH_dm.txt,/home/cbmucl40/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_dm.txt -o ~/2018_02_smb/mantel_out/pH -n 999

# compare distance matrix
echo "comparing dist matrix K"
time compare_distance_matrices.py --method=mantel -i /home/cbmucl40/2018_02_smb/K_dm.txt,/home/cbmucl40/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_dm.txt -o ~/2018_02_smb/mantel_out/K -n 999

# compare distance matrix
echo "comparing dist matrix N"
time compare_distance_matrices.py --method=mantel -i /home/cbmucl40/2018_02_smb/N_dm.txt,/home/cbmucl40/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_dm.txt -o ~/2018_02_smb/mantel_out/N -n 999

# compare distance matrix
echo "comparing dist matrix P"
time compare_distance_matrices.py --method=mantel -i /home/cbmucl40/2018_02_smb/P_dm.txt,/home/cbmucl40/2018_02_smb/cdout_2018_open/bdiv_even1000/unweighted_unifrac_dm.txt -o ~/2018_02_smb/mantel_out/P -n 999

#deactivating environment
source deactivate 