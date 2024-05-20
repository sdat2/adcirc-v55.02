#!/bin/bash

module load PrgEnv-gnu/8.3.3
module load cray-hdf5-parallel/1.12.2.1
module load cray-netcdf-hdf5parallel/4.9.0.1

#module load PrgEnv-gnu/8.3.3
# export NETCDF_DIR=/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/
# ncconfig="/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/bin/nc-config"
# /opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/bin/nc-config --version

sw="-ffixed-line-length-72 -ffree-line-length-72"
ll="-ffixed-line-length-132 -ffree-line-length-132"
nchome="$(nc-config --prefix)"
ncl="$(nc-config --libdir)" # "$(${ncconfig} --libdir)"
nci="$(nc-config --includedir)" # "$(${ncconfig} --includedir)"
echo "NETCDF_LIBRARY_DIR: ${ncl}"
echo "NETCDF_INCLUDE_DIR: ${nci}"

which ftn
ftn --version
which cc
cc --version


export Fortran_LINELENGTH_FLAG="${ll}"

cd adcirc
cd work

cmake .. --debug-output -DCMAKE_C_COMPILER=cc \
        -DCMAKE_CXX_COMPILER=cc \
        -DCMAKE_Fortran_COMPILER=ftn \
        -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON \
        -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=ON \
        -DENABLE_OUTPUT_NETCDF=ON -DBUILD_PADCSWAN=ON \
        -DBUILD_ASWIP=ON -DBUILD_UTILITIES=ON \
        -DBUILD_SWAN=ON -DBUILD_PUNSWAN=ON \
        -DCMAKE_Fortran_FLAGS="-DREAL8 -DCSCA -DLINUX -g -fbacktrace -w -fallow-argument-mismatch -O2" \
        -DFortran_LINELENGTH_FLAG="${ll}" \
        -DADDITIONAL_FLAGS_SWAN="${swan}" \
        -DADDITIONAL_FLAGS_ADCPREP="${ll}"  \
        -DADDITIONAL_FLAGS_ADCIRC="${ll}" \
        -DADDITIONAL_FLAGS_ASWIP="${ll}" \
        -DADDITIONAL_FLAGS_UTILITIES="${ll}" \
        -DNETCDFHOME="${NETCDF_DIR}" \
        -DNETCDF_LIBRARY="${ncl}" -DNETCDF_INCLUDE_DIR="${nci}" \
        -DNETCDFHOME="${nchome}" \
        -DNETCDF_F90_LIBRARY="${ncl}/libnetcdff.so"

# -DNETCDFHOME=$(nc-config --prefix)

make

# NETCDF_F90_LIBRARY:FILEPATH=/opt/cray/pe/netcdf-hdf5parallel/4.9.0.1/gnu/9.1/lib/libnetcdff.so
