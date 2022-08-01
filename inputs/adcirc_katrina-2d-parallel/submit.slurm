#!/bin/bash --login

#SBATCH --job-name=test_job
#SBATCH --nodes=1
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=0:5:0

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=n01-sowise
#SBATCH --partition=standard
#SBATCH --qos=standard

# Load the xthi module to get access to the xthi program
module load PrgEnv-gnu/8.0.0
module load cray-mpich-abi/8.1.4 
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel

# srun launches the parallel program based on the SBATCH options

srun $exepath/padcirc > padcirc_log.txt
