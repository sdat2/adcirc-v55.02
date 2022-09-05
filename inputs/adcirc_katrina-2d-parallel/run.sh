#!/bin/bash

case_name="adcirc_katrina-2d-parallel"

module load intel/20.0.0
module load intel/cce/20.0.0
module load eb/OpenMPI/intel/4.1.0
module load intel/mpi/5.1.2.150
module load libpnetcdf/intel/14.0/1.5.0
module load libPHDF5/intel/14.0/1.8.12
module load netcdf/intel/14.0/4.3.2
module load netcdff/intel/14.0/4.2
module load parallel-netcdf/intel/20141122



#...Set variables
exepath=/home/users/sithom/adcirc-swan-old/adcirc/work
np=3

#...Run the case
echo ""
echo "|---------------------------------------------|"
echo "    TEST CASE: $case_name"
echo ""
echo -n "    Prepping case..."
$exepath/adcprep --np $np --partmesh
$exepath/adcprep --np $np --prepall
if [ $? == 0 ] ; then
    echo "done!"
else
    echo "ERROR!"
    exit 1
fi

echo -n "    Runnning case..."
$exepath/padcirc
exitstat=$?
echo "Finished"
echo "    ADCIRC Exit Code: $exitstat"
if [ "x$exitstat" != "x0" ] ; then
    echo "    ERROR: ADCIRC did not exit cleanly."
    exit 1
fi
echo ""