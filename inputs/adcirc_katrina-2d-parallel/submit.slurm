#!/bin/bash --login

#SBATCH --job-name=ardcirc_katrina_parralel
#SBATCH --nodes=3
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=0:5:0

# Replace [budget code] below with your project code (e.g. t01)
# changed 
#SBATCH --partition=standard
#SBATCH --qos=standard

# Load the xthi module to get access to the xthi program
module load gcc/8.2.0
module load eb/OpenMPI/gcc/4.0.0
module load libPHDF5/gnu/4.4.7/1.8.12
module load libpnetcdf/gnu/4.4.7/1.5.0
module load netcdf/gnu/4.4.7/4.3.2
module load netcdff/gnu/4.4.7/4.2
module load parallel-netcdf/gnu/20141122

# srun launches the parallel program based on the SBATCH options
echo "about to run"
mpirun /home/users/sithom/adcirc-swan/adcirc/work/padcirc
echo "ran"
