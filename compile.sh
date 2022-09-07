#!/bin/bash

cd adcirc/work

# turned on swan, seemed to work?
cmake .. -DCMAKE_C_COMPILER="/opt/homebrew/Cellar/mpich/4.0.2_1/bin/mpicc" -DCMAKE_CXX_COMPILER="/opt/homebrew/Cellar/mpich/4.0.2_1/bin/mpicxx" -DCMAKE_Fortran_COMPILER="/opt/homebrew/Cellar/mpich/4.0.2_1/bin/mpifort" -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=ON -DENABLE_OUTPUT_NETCDF=OFF -DFortran_COMPILER_SPECIFIC_FLAG="-ffixed-line-length-132" -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG="-ffixed-line-length-132" -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" # -DNETCDF_LIBRARIES="/opt/homebrew/Cellar/netcdf/4.8.1_3/bin"

# /opt/homebrew/Cellar/mpich/4.0.2_1/bin
# /opt/homebrew/Cellar/mpich/4.0.2_1/bin/mpicxx
# /opt/homebrew/Cellar/mpich/4.0.2_1/bin/mpicc
# /opt/homebrew/Cellar/mpich/4.0.2_1/bin/mpifort
make
