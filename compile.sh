#!/bin/bash

module load PrgEnv-gnu/8.0.0
module load cray-mpich-abi/8.1.4 
module load cray-hdf5
# module load cray-netcdf
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel


cd adcirc
cd work

# turned on swan, seemed to work?
cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=OFF -DENABLE_OUTPUT_NETCDF=ON -DFortran_COMPILER_SPECIFIC_FLAG="-ffixed-line-length-132" -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG="-ffixed-line-length-132" -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" -DNETCDF_LIBRARIES="/opt/cray/pe/netcdf/4.7.4.3/bin" -DNETCDF_INCLUDE_DIRS="/opt/cray/pe/netcdf/4.7.4.3/bin" -DNETCDF_LIBRARY="/opt/cray/pe/netcdf/4.7.4.3/bin"

make
