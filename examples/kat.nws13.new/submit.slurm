#!/bin/bash --login

#SBATCH --job-name=kat.nws13.long!
#SBATCH --nodes=1
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=96:00:0

# Replace [budget code] below with your project code (e.g. t01)

#SBATCH --account=n01-SOWISE
#SBATCH --partition=standard
#SBATCH --qos=long

# emailing for start and end.
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=sdat2@cam.ac.uk


# Load modules
module load PrgEnv-gnu/8.3.3
module load cray-hdf5-parallel/1.12.2.1
module load cray-netcdf-hdf5parallel/4.9.0.1

# adcirc executables
d1=/work/n01/n01/sithom/adcirc-swan/adcirc/work

# define variables
case_name=$SLURM_JOB_NAME # name for printing
echo "case_name = ${case_name}"
echo "tpn = $SLURM_TASKS_PER_NODE"
echo "nodes = $SLURM_NNODES"
echo "ntasks = $SLURM_NTASKS"
np=$SLURM_NTASKS #  $(( $SLURM_TASKS_PER_NODE * $SLURM_NNODES ))  # how many parallel tasks to define
echo "np = ${np}"

# prevent unauthorized access.
export OMP_NUM_THREADS=1

# Propagate the cpus-per-task setting from script to srun commands
#    By default, Slurm does not propagate this setting from the sbatch
#    options to srun commands in the job script. If this is not done,
#    process/thread pinning may be incorrect leading to poor performance
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

# Launch the parallel job
#   Using 512 MPI processes and 128 MPI processes per node
#   srun picks up the distribution from the sbatch options


#...Run the case
echo ""
echo "|---------------------------------------------|"
echo "    TEST CASE: $case_name"
echo ""

# check if directories ["PE{:04}".format(x) for x in range(1, np+1)] exist in bash
# if not run adcprep to create them
# first say that all_exist = True, then check if any of the directories do not exist
# if any do not exist, set all_exist = False
# if all_exist = False, run adcprep

skip_adcprep=true
for i in $(seq 0 $(($np-1))) # 1 to np in increments of 1
do
    if [ ! -d $(printf "PE%04d\n" $i) ]; then
        # echo "Directory $(printf "PE%04d\n" $i) does not exist"
        skip_adcprep=false
    fi
done

# check if too many directories exist
if [ -d $(printf "PE%04d\n" $((np))) ]; then
    echo "Too many directories exist"
    skip_adcprep=false
fi

skip_adcprep=false # force adcprep to run

if [ true ]; then #  ! [ $skip_adcprep ]; then
    echo -n "    Prepping case..."
    ${d1}/adcprep --np $np --partmesh >  adcprep.log
    ${d1}/adcprep --np $np --prepall  >> adcprep.log
    if [ $? == 0 ] ; then
        echo "done!"
    else
        echo "ERROR!"
        exit 1
    fi
else
    echo "    Skipping adcprep"
fi

echo -n "    Runnning case..."
srun --distribution=block:block --hint=nomultithread ${d1}/padcirc > padcirc_log.txt
exitstat=$?
echo "Finished"
echo "    ADCIRC Exit Code: $exitstat"
if [ "x$exitstat" != "x0" ] ; then
    echo "    ERROR: ADCIRC did not exit cleanly."
    exit 1
fi
echo ""

