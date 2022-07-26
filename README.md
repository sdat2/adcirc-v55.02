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
module load cray-mpich-abi/8.1.4 

sh compile.sh
```

## TODO

I still have issues with:

 - compiling SWAN.
 - running the unit tests.
 - testing netcdf outputs.
 - running slurm jobs easily in an automated fashion.


## A record of useful commands tried

```bash
docker pull asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20200513:latest

singularity pull docker://zcobell/adcirc_20191101

singularity pull docker://asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20170924

singularity shell --bind /work/n01/n01/sithom/adcirc-swan singularity/asgs -nv

   cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DCMAKE_Fortran_FLAGS=-N 132
    -DFortran_LINELENGTH_FLAG="-N 132"
   cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=OFF -DBUILD_ADCSWAN=OFF 
   Fortran_COMPILER_SPECIFIC_FLAG="-N 132"
   -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG="-N 132"

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

```
https://wiki.adcirc.org/wiki/Compiling
```

mpif90 libmpich-dev_3.0.4-6ubuntu1_amd64

module load PrgEnv-gnu/8.0.0
module load cray-mpich-abi/8.1.4 

```bash

ln -s /usr/bin/gfortran /usr/bin/f90
alias f90=gfortran
alias f90="gfortran --ffreeform"
ln -s /usr/local/bin/gfortran /usr/local/bin/f90

---------------------------------------------- /opt/cray/pe/lmod/modulefiles/comnet/crayclang/10.0/ofi/1.0 -----------------------------------------------
   cray-mpich-abi/8.1.4 (D)    cray-mpich-abi/8.1.9    cray-mpich/8.1.4 (L,D)    cray-mpich/8.1.9

```


PrgEnv-gnu/8.1.0


## Manual Pages for SWAN/ADCIRC

Compiling SWAN manual pages
https://swanmodel.sourceforge.io/online_doc/swanimp/node8.html

ADCIRC architecture
https://adcirc.org/wp-content/uploads/sites/2255/2013/02/ADCIRC-Architecture.png

## ADCIRC inputs structure

- fort.11  = density initial conditions
- fort.13 = nodal attributes
- fort.14 = mesh
- fort.15 = input parameters
- fort.19 = Non periodic, time varying elevation boundary condition file if eleveation specificed boundary nodes.
- fort.20 = Non periodic, Normal Flux Boundary Condition.
- fort.22 = Meteorological Forcing
- fort.23 = Wave radiaiton stress frocing
- fort.61, fort.62, fot.81, fort.71, fort.71. = elevation, velocity, concentation, met stations
- fort.63, fort.64, fort.83, fort.73, fort.74 = global elevation, velociyt, concentratiion, met stations.



## SWAN Compilation problem

```
Error: Syntax error in data declaration at (1)
/work/n01/n01/sithom/adcirc-swan/adcirc/work/CMakeFiles/swan_serial_source/swmod1.f:2617:77:

 2617 |       REAL                FPI                                             40.88
      |                                                                             1
Error: Syntax error in data declaration at (1)
```