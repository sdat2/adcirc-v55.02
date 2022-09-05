# Running ADCIRC/SWAN on JASMIN

## MPI

Only openmpi available.

<https://help.jasmin.ac.uk/article/4896-how-to-submit-an-mpi-parallel-job-to-slurm>

### Three OPENMPI options

```bash
eb/OpenMPI/gcc/3.1.1 
eb/OpenMPI/gcc/4.0.0       
eb/OpenMPI/intel/3.1.1
```

### Example of MPI usage

```bash
module load eb/OpenMPI/gcc/4.0.0
mpirun ./mpi_myname.exe
```
