# adcirc-v55.02 for ARCHER2

A folder containing ADCIRC-55.02 source code used for various studies, along with compiling setting. It includes the particular version of the source code used, and scripts to compile and run it on Archer2.

On Archer2 I have found that the cray `gfortran` compilers seem to work the best for compiling ADCIRC.

One particular issue in the code is the presence of Fortran from multiple styles (ending determined), and very long lines (up to 132 characters).

I found that trying to use the default cray compilers was very difficult, as the compiler flag, which should have been `-N 132` did not seem to work.

The `cmake` method seems to be much more reliable than `Makefile`.

## Getting Python loaded

```bash
#source ~/.bashrc
source /work/n02/n02/sdat2/.bashrc

micromamba activate t1
```

## Running jobs

```bash
squeue -u $USER
```

## Look at old jobs

```bash
sacct -l -u $USER
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


## Holland Hurricane Model

https://github.com/CLIMADA-project/climada_python

https://github.com/ec-jrc/pyStorms/blob/master/Notebooks/Estimate%20Holland%20Parameters.ipynb


## Figure generation script based on GMT

https://ccht.ccee.ncsu.edu/figuregen-v-49/


## Run Test

```
cd /work/n01/n01/sithom/adcirc-swan/inputs/adcirc_katrina-2d-parallel
sbatch submit.slurm
```


### Getting NWS 13 span up

#### TODO:

- Verify different model setups against tidal gauge data.


## Moving files:

```bash
rsync -rvtaP --dry-run sithom@archer2-login.ac.uk:/work/n01/n01/users/sithom .
```

```bash
/mnt/lustre/a2fs-work1/work/n01/n01/sithom /work/n02/n02/sdat2
```

## Getting git-lfs for downloading testsuite data

```bash
wget https://github.com/git-lfs/git-lfs/releases/download/v3.5.1/git-lfs-linux-amd64-v3.5.1.tar.gz
tar -xzvf git-lfs-linux-amd64-v3.5.1.tar.gz 
cd git-lfs-3.5.1/
sh install.sh --local
git lfs install
```

