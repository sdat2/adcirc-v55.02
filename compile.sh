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

echo "** Moving into work directory **"

cd adcirc/work

echo "** About to create makefile with cmake **"

# turned on swan, seemed to work?
# cmake .. -DCMAKE_C_COMPILER="/apps/intel/2013_sp1.2.144/composer_xe_2013_sp1.2.144/bin/intel64/icc" -DCMAKE_CXX_COMPILER="/apps/intel/2013_sp1.2.144/composer_xe_2013_sp1.2.144/bin/intel64/icc" -DCMAKE_Fortran_COMPILER="/apps/intel/2013_sp1.2.144/composer_xe_2013_sp1.2.144/bin/intel64/ifort" -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=ON -DENABLE_OUTPUT_NETCDF=ON -DFortran_COMPILER_SPECIFIC_FLAG="-ffixed-line-length-132" -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG="-ffixed-line-length-132" -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" 

# -DNETCDF_LIBRARIES="/opt/cray/pe/netcdf/4.7.4.3/bin" -DNETCDF_INCLUDE_DIRS="/opt/cray/pe/netcdf/4.7.4.3/bin" -DNETCDF_LIBRARY="/opt/cray/pe/netcdf/4.7.4.3/bin"

echo "** Now moving onto compilation **"

make

echo "** Compilation attempted **"
