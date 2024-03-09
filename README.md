# adcirc-swan

ADCIRC-SWAN folder, which includes particular versions of the code, and script to run it.

On Archer2 I have found that the cray `gfortran` compilers seem to work the best for compiling ADCIRC.

One particular issue in the code is the presence of Fortran from multiple styles (ending determined), and very long lines (up to 132 characters).

I found that trying to use the default cray compilers was very difficult, as the compiler flag, which should have been `-N 132` did not seem to work.

I experimented to some extent with installing the environment as a singularity container from various docker images, but this was generally unsuccessful.

The `cmake` method seems to be much more reliable than `Makefile`.

## Compile on ARCHER2

```bash

module load PrgEnv-gnu/8.0.0
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel

# /opt/cray/pe/netcdf/4.7.4.3/bin/ncdump
sh compile.sh

```

## NetCDF path

```bash
ls /opt/cray/pe/netcdf/4.7.4.3/bin
nc-config  nccopy  ncdump  ncgen  ncgen3  ncxx4-config  nf-config
```

## TODO

I still have issues with:

 - compiling SWAN.
 - running the unit tests.
 - testing netcdf outputs.
 - running slurm jobs easily in an automated fashion.


## Look at old jobs

```bash
sacct -l
```

## A record of useful commands tried

```bash

docker pull asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20200513:latest

singularity pull docker://zcobell/adcirc_20191101

singularity pull docker://asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20170924

singularity shell --bind /work/n01/n01/sithom/adcirc-swan singularity/asgs -nv

cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DCMAKE_Fortran_FLAGS="-N 132" -DFortran_LINELENGTH_FLAG="-N 132"

cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=OFF -DBUILD_ADCSWAN=OFF Fortran_COMPILER_SPECIFIC_FLAG="-N 132" -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG="-N 132"

cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=OFF -DFortran_COMPILER_SPECIFIC_FLAG=-ffixed-line-length-132 -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG=-ffixed-line-length-132 -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2"

//Executable for running MPI programs.
MPIEXEC_EXECUTABLE:FILEPATH=/usr/lib64/mpi/gcc/openmpi/bin/mpirun

//MPI compiler for CXX
MPI_CXX_COMPILER:FILEPATH=/opt/cray/pe/craype/2.7.6/bin/cc

adcirc/adcirc_quarterannular-2d

sh ./RunSingleTest.sh /work/n01/n01/sithom/adcirc-swan/adcirc/work /work/n01/n01/sithom/adcirc-swan/adcirc-cg-testsuite/adcirc/adcirc_quarterannular-2d

//MPI compiler for C
MPI_C_COMPILER:FILEPATH=/opt/cray/pe/craype/2.7.6/bin/cc

//MPI compiler for Fortran
MPI_Fortran_COMPILER:FILEPATH=/opt/cray/pe/craype/2.7.6/bin/ftns

sh ./RunSingleTest.sh /work/n01/n01/sithom/adcirc-swan/adcirc/work /work/n01/n01/sithom/adcirc-swan/adcirc-cg-testsuite/adcirc/adcirc_internal_overflow

PrgEnv-gnu/8.0.0
 
```


## Manual Pages for SWAN/ADCIRC

Compiling SWAN manual pages
https://swanmodel.sourceforge.io/online_doc/swanimp/node8.html

ADCIRC architecture
https://adcirc.org/wp-content/uploads/sites/2255/2013/02/ADCIRC-Architecture.png

ADCIRC compiling.
https://wiki.adcirc.org/wiki/Compiling

## ADCIRC inputs structure

- fort.11  = density initial conditions
- fort.13 = nodal attributes
- fort.14 = mesh
- fort.15 = input parameters
- fort.19 = Non periodic, time varying elevation boundary condition file if eleveation specificed boundary nodes.
- fort.20 = Non periodic, Normal Flux Boundary Condition.
- fort.22 = Meteorological Forcing
- fort.23 = Wave radiaiton stress frocing
- fort.61, fort.62, fot.81, fort.71, fort.71 = elevation, velocity, concentation, met stations
- fort.63, fort.64, fort.83, fort.73, fort.74 = global elevation, velociyt, concentratiion, met stations.



## SWAN Compilation problem

```txt
Error: Syntax error in data declaration at (1)
/work/n01/n01/sithom/adcirc-swan/adcirc/work/CMakeFiles/swan_serial_source/swmod1.f:2617:77:

 2617 |       REAL                FPI                                             40.88
      |                                                                             1
Error: Syntax error in data declaration at (1)
```

## Holland Hurricane Model

https://github.com/CLIMADA-project/climada_python

https://github.com/ec-jrc/pyStorms/blob/master/Notebooks/Estimate%20Holland%20Parameters.ipynb


## Figure generation script based on GMT

https://ccht.ccee.ncsu.edu/figuregen-v-49/

## ADCIRC KATRINA current error

```bash

    TEST CASE: adcirc_katrina-2d-parallel

    Prepping case...done!
    Runnning case...MPICH ERROR [Rank 0] [job id ] [Mon Aug  1 19:08:41 2022] [ln04] - Abort(0) (rank 0 in comm 496): application called MPI_Abort(comm=0x84000000, 0) - process 0

Finished
    ADCIRC Exit Code: 0
```

## Run Test

```
cd /work/n01/n01/sithom/adcirc-swan/inputs/adcirc_katrina-2d-parallel
sbatch submit.slurm
```


### Getting NWS 13 span up

Done:

- First check that editing NWS13 files using xarray-datatree works ok.
- Translate betweeen track netcdf and `fort.22.nc'
- Force some 30k node examples.
- Find way to trim big meshes.


TODO:

- Try with extra entries in 
- Try running in debugging mode (need to recompile programs with option -g).
- Verify different model setups against tidal gauge data.
