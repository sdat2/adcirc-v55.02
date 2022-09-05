#!/bin/bash

# module load PrgEnv-gnu/8.0.0
# module load cray-hdf5-parallel
# module load cray-netcdf-hdf5parallel

module load gcc/8.2.0
module load eb/OpenMPI/gcc/4.0.0       
module load parallel-netcdf/gnu/20141122
# module load  parallel-netcdf/gnu/20141122

cd adcirc
cd work

# turned on swan, seemed to work?
cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=gcc -DCMAKE_Fortran_COMPILER=gfortran -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=ON  -DBUILD_PADCSWAN=ON  -DENABLE_OUTPUT_NETCDF=OFF -DFortran_COMPILER_SPECIFIC_FLAG="-ffixed-line-length-132" -DFortran_LINELENGTH_FLAG="-ffixed-line-length-132" -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" -DNETCDF_LIBRARIES="/apps/libs/netCDF/intel14/gnu4.4.7/4.2/" -DNETCDF_INCLUDE_DIRS="/apps/libs/netCDF/gnu4.4.7/4.3.2/" -DNETCDF_LIBRARY="/apps/libs/netCDF/gnu4.4.7/4.3.2/"

make
