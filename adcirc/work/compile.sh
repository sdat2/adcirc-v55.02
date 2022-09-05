#!/bin/bash

module load intel/20.0.0
module load intel/cce/20.0.0
module load eb/OpenMPI/intel/4.1.0
module load intel/mpi/5.1.2.150
module load libpnetcdf/intel/14.0/1.5.0
module load libPHDF5/intel/14.0/1.8.12
module load netcdf/intel/14.0/4.3.2
module load netcdff/intel/14.0/4.2
module load parallel-netcdf/intel/20141122


make

# https://github.com/geodynamics/axisem/issues/8

# NETCDF_INCLUDES:PATH=/usr/include
# NETCDF_INCLUDES_F90:PATH=NETCDF_INCLUDES_F90-NOTFOUND
# NETCDF_LIBRARIES:STRING=/usr/lib64/libnetcdf.so
# NETCDF_LIBRARIES_C:FILEPATH=/usr/lib64/libnetcdf.so
# NETCDF_LIBRARIES_F90:FILEPATH=/usr/lib64/libnetcdff.so
