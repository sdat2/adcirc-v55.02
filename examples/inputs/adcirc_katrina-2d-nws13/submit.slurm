#!/bin/bash --login

#SBATCH --job-name=ardcirc_katrina_nws13
#SBATCH --nodes=1
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=1:0:0

# Replace [budget code] below with your project code (e.g. t01)
# changed 
#SBATCH --account=n01-sowise
#SBATCH --partition=standard
#SBATCH --qos=standard

# Load the xthi module to get access to the xthi program
module load PrgEnv-gnu/8.0.0
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel

# srun launches the parallel program based on the SBATCH options
echo "about to run"
/work/n01/n01/sithom/adcirc-swan/adcirc/work/adcirc
echo "ran"
