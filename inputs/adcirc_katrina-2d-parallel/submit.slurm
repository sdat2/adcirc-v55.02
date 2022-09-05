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
module load intel/20.0.0
module load intel/cce/20.0.0
module load eb/OpenMPI/intel/4.1.0
module load intel/mpi/5.1.2.150
module load libpnetcdf/intel/14.0/1.5.0
module load libPHDF5/intel/14.0/1.8.12
module load netcdf/intel/14.0/4.3.2
module load netcdff/intel/14.0/4.2
module load parallel-netcdf/intel/20141122


# srun launches the parallel program based on the SBATCH options
echo "about to run"
mpirun /home/users/sithom/adcirc-swan-old/adcirc/work/padcirc
echo "ran"
