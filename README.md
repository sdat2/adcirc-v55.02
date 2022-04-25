# adcirc-swan

ADCIRC-SWAN version.

```bash
docker pull asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20200513:latest

singularity pull docker://zcobell/adcirc_20191101

singularity pull docker://asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20170924

singularity shell --bind /work/n01/n01/sithom/adcirc-swan singularity/asgs -nv


```

```
https://wiki.adcirc.org/wiki/Compiling
```

mpif90 libmpich-dev_3.0.4-6ubuntu1_amd64


module load cray-mpich-abi/8.1.4 

```bash

ln -s /usr/bin/gfortran /usr/bin/f90
alias f90=gfortran
alias f90="gfortran --ffreeform"
ln -s /usr/local/bin/gfortran /usr/local/bin/f90

---------------------------------------------- /opt/cray/pe/lmod/modulefiles/comnet/crayclang/10.0/ofi/1.0 -----------------------------------------------
   cray-mpich-abi/8.1.4 (D)    cray-mpich-abi/8.1.9    cray-mpich/8.1.4 (L,D)    cray-mpich/8.1.9

```
