#!/bin/bash

case_name="adcirc_katrina-2d-parallel"

module load PrgEnv-gnu/8.0.0
module load cray-mpich-abi/8.1.4 
module load cray-hdf5
# module load cray-netcdf
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel


#...Set variables
exepath=/work/n01/n01/sithom/adcirc-swan/adcirc/work
err=0.00001
np=3

nfiles=9
files=( "fort.63.nc" "fort.64.nc" "fort.73.nc" "fort.74.nc"
        "maxele.63.nc" "maxvel.63.nc" "maxwvel.63.nc" "minpr.63.nc" 
        "windDrag.173.nc" )

#...Run the case
echo ""
echo "|---------------------------------------------|"
echo "    TEST CASE: $case_name"
echo ""
echo -n "    Prepping case..."
$exepath/adcprep --np $np --partmesh >  adcprep.log
$exepath/adcprep --np $np --prepall  >> adcprep.log
if [ $? == 0 ] ; then
    echo "done!"
else
    echo "ERROR!"
    exit 1
fi

echo -n "    Runnning case..."
mpirun --allow-run-as-root -np $np $exepath/padcirc > padcirc_log.txt
exitstat=$?
echo "Finished"
echo "    ADCIRC Exit Code: $exitstat"
if [ "x$exitstat" != "x0" ] ; then
    echo "    ERROR: ADCIRC did not exit cleanly."
    exit 1
fi
echo ""

if [ $fail == 1 ] ; then
    exit 1
else
    exit 0
fi
