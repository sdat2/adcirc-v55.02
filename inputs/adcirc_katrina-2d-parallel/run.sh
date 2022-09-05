#!/bin/bash

case_name="adcirc_katrina-2d-parallel"

module load gcc/8.2.0
module load eb/OpenMPI/gcc/4.0.0
module load libPHDF5/gnu/4.4.7/1.8.12
module load libpnetcdf/gnu/4.4.7/1.5.0
module load netcdf/gnu/4.4.7/4.3.2
module load netcdff/gnu/4.4.7/4.2
module load parallel-netcdf/gnu/20141122

#...Set variables
exepath=/home/users/sithom/adcirc-swan/adcirc/work
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
mpirun $exepath/padcirc
exitstat=$?
echo "Finished"
echo "    ADCIRC Exit Code: $exitstat"
if [ "x$exitstat" != "x0" ] ; then
    echo "    ERROR: ADCIRC did not exit cleanly."
    exit 1
fi
echo ""