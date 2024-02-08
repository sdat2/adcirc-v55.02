#!/bin/bash --login

#SBATCH --job-name=test_job
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:5:0

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=n01-sowise
#SBATCH --partition=standard
#SBATCH --qos=short

module load PrgEnv-gnu/8.3.3
module load cray-hdf5-parallel/1.12.2.1
module load cray-parallel-netcdf/1.12.3.1
module load cray-mpich/8.1.23

which ncmpidump