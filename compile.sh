#!/bin/bash

# module load PrgEnv-gnu/8.0.0
module load PrgEnv-gnu/8.3.3
# module load cray-hdf5-parallel
#module load cray-netcdf-hdf5parallel
module load cray-parallel-netcdf/1.12.3.1
module load cray-hdf5-parallel/1.12.2.1


cd adcirc
cd work
swan="-ffixed-line-length-72 -ffree-line-length-72"
ll="-ffixed-line-length-132 -ffree-line-length-132"
nc="/opt/cray/pe/netcdf/default/bin"

# turned on swan, seemed to work?
cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=ON -DENABLE_OUTPUT_NETCDF=ON -DBUILD_PADCSWAN=ON -DCMAKE_Fortran_FLAGS="-DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" -DNETCDF_LIBRARIES=$nc -DNETCDF_INCLUDE_DIRS=$nc -DNETCDF_LIBRARY=$nc -DADDITIONAL_FLAGS_SWAN=$swan -DADDITIONAL_FLAGS_ADCPREP=$ll  -DADDITIONAL_FLAGS_ADCIRC=$ll -DADDITIONAL_FLAGS_ASWIP=$ll -DADDITIONAL_FLAGS_UTILITIES=$ll


make
