#!/bin/bash

module load intel/20.0.0
module load intel/cce/20.0.0
module load eb/OpenMPI/intel/4.1.0
module load intel/mpi/5.1.2.150
which ncdump

module load libpnetcdf/intel/14.0/1.5.0
which ncdump

module load libPHDF5/intel/14.0/1.8.12
which ncdump

module load netcdf/intel/14.0/4.3.2
which ncdump

module load netcdff/intel/14.0/4.2
which ncdump
ls /apps/libs/netCDF/intel14/fortran/4.2/
ls /apps/libs/netCDF/intel14/4.3.2/

module load parallel-netcdf/intel/20141122
which ncdump


make