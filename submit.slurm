#!/bin/bash --login

#SBATCH --job-name=test
#SBATCH --nodes=1
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=00:20:00

# Replace [budget code] below with your project code (e.g. t01)

#SBATCH --account=n02-bas
#SBATCH --partition=standard
#SBATCH --qos=short

# emailing for start and end.
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=sdat2@cam.ac.uk


# Load modules
module load PrgEnv-gnu/8.3.3 cray-hdf5-parallel/1.12.2.1 cray-netcdf-hdf5parallel/4.9.0.1



case_name="adcirc_katrina-2d-nws13-parallel"

#...Set variables
exepath=/work/n02/n02/sdat2/adcirc-swan/adcirc/work
err=0.0001
np=$SLURM_NTASKS

#np=$SLURM_NTASKS  # how many parallel tasks to define


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
srun --distribution=block:block --hint=nomultithread $exepath/padcirc > padcirc_log.txt
exitstat=$?
echo "Finished"
echo "    ADCIRC Exit Code: $exitstat"
if [ "x$exitstat" != "x0" ] ; then
    echo "    ERROR: ADCIRC did not exit cleanly."
    exit 1
fi
echo ""


#...Run the comparison test
echo -n "    Running comparison..."
for((i=0;i<$nfiles;i++))
do
    echo "" >> comparison.log
    echo "${files[$i]}" >> comparison.log
    CLOPTIONS="-t $err"
    if [[ ${files[$i]} = "maxvel.63" || ${files[$i]} = "maxele.63" || ${files[$i]} = "maxwvel.63" || ${files[$i]} = "minpr.63" ]]; then
       CLOPTIONS="$CLOPTIONS --minmax"
    fi    
    $exepath/adcircResultsComparison $CLOPTIONS -f1 ${files[$i]} -f2 control/${files[$i]} >> comparison.log 2>>comparison.log
    error[$i]=$?
done
echo "Finished"

#...Check the number of failed steps
fail=0
for((i=0;i<$nfiles;i++))
do
    echo -n "      "${files[$i]}": "
    if [ "x${error[$i]}" != "x0" ] ; then
        echo "Failed"
        fail=1
    else
        echo "Passed"
    fi
done

if [ $fail == 1 ] ; then
    echo "    Comparison Failed!"
else
    echo "    Comparison Passed!"
fi

echo "|---------------------------------------------|"
echo ""

if [ $fail == 1 ] ; then
    exit 1
else
    exit 0
fi
