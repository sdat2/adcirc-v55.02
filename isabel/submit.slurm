#!/bin/bash --login

#SBATCH --job-name=adcirc_katrina-2d-parallel
#SBATCH --nodes=3
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=3
#SBATCH --time=24:0:0

# Replace [budget code] below with your project code (e.g. t01)

#SBATCH --account=n01-SOWISE
#SBATCH --partition=standard
#SBATCH --qos=standard

# emailing for start and end.
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=sdat2@cam.ac.uk

# Load modules
module load PrgEnv-gnu/8.0.0
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel

# try to activate bashrc

work=/mnt/lustre/a2fs-work1/work/n01/n01/sithom

source $work/.bashrc

d1=/work/n01/n01/sithom/adcirc-swan/isabel

echo "hook 1"
eval "$(conda shell.bash hook)"

case_name="adcirc_katrina-2d-parallel"

#...Set variables
err=0.0001
np=3

#...Run the case
echo ""
echo "|---------------------------------------------|"
echo "    TEST CASE: $case_name"
echo ""
echo -n "    Prepping case..."
${d1}/adcprep --np $np --partmesh >  adcprep.log
${d1}/adcprep --np $np --prepall  >> adcprep.log
if [ $? == 0 ] ; then
    echo "done!"
else
    echo "ERROR!"
    exit 1
fi

echo -n "    Runnning case..."
srun --nodes=$np ${d1}/padcirc > padcirc_log.txt
exitstat=$?
echo "Finished"
echo "    ADCIRC Exit Code: $exitstat"
if [ "x$exitstat" != "x0" ] ; then
    echo "    ERROR: ADCIRC did not exit cleanly."
    exit 1
fi
echo ""

