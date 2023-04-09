#!/bin/bash

module load PrgEnv-gnu/8.0.0
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel


cd adcirc
cd work
swan="-ffixed-line-length-72 -ffree-line-length-72"
ll="-ffixed-line-length-132 -ffree-line-length-132"

# turned on swan, seemed to work?
cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=ON -DENABLE_OUTPUT_NETCDF=ON -DBUILD_PADCSWAN=OFF -DCMAKE_Fortran_FLAGS="-DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" -DNETCDF_LIBRARIES="/opt/cray/pe/netcdf/4.7.4.3/bin" -DNETCDF_INCLUDE_DIRS="/opt/cray/pe/netcdf/4.7.4.3/bin" -DNETCDF_LIBRARY="/opt/cray/pe/netcdf/4.7.4.3/bin" -DADDITIONAL_FLAGS_SWAN=$swan -DADDITIONAL_FLAGS_ADCPREP=$ll  -DADDITIONAL_FLAGS_ADCIRC=$ll -DADDITIONAL_FLAGS_ASWIP=$ll -DADDITIONAL_FLAGS_UTILITIES=$ll


make
