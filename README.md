# adcirc-swan

ADCIRC-SWAN folder, which includes particular versions of the code, and script to run it.

On Archer2 I have found that the cray `gfortran` compilers seem to work the best for compiling ADCIRC.

One particular issue in the code is the presence of Fortran from multiple styles (ending determined), and very long lines (up to 132 characters).

I found that trying to use the default cray compilers was very difficult, as the compiler flag, which should have been `-N 132` did not seem to work.

I experimented to some extent with installing the environment as a singularity container from various docker images, but this was generally unsuccessful.

The `cmake` method seems to be much more reliable than `Makefile`.



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

Done:

- Try with extra entries in.
- Try running in debugging mode (need to recompile programs with option -g).

TODO:

- Verify different model setups against tidal gauge data.


## Moving files:

```bash
rsync -rvtaP --dry-run sithom@archer2-login.ac.uk:/work/n01/n01/users/sithom .
```

```bash
/mnt/lustre/a2fs-work1/work/n01/n01/sithom /work/n02/n02/sdat2
```