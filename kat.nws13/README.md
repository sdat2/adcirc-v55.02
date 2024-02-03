# Big GOM mesh run with NWS=13 file

## debugging

<https://cpe.ext.hpe.com/docs/debugging-tools/gdb4hpc.1.html>


```bash
cp ../NWS13set4/fort.22.nc .
```

```bash


salloc --account=n01-SOWISE --partition=standard --qos=standard --nodes=1 --ntasks-per-node=128 --cpus-per-task=1 --exclusive  --time=01:00:00

module load gdb4hpc 

gdb4hpc 

launch --launcher-args="--account=n01-SOWISE --partition=standard --qos=standard --nodes=1 --ntasks-per-node=128 --cpus-per-task=1 --exclusive --export=ALL --distribution=block:block --hint=nomultithread " $my_prog{128} /work/n01/n01/sithom/adcirc-swan/katrina1/padcirc

quit
```

```
salloc --account=n01-SOWISE --partition=standard --qos=standard --nodes=1 --ntasks-per-node=128 --cpus-per-task=1 --exclusive  --time=01:00:00 gdb4hpc launch --launcher-args="--account=n01-SOWISE --partition=standard --qos=standard --nodes=1 --ntasks-per-node=128 --cpus-per-task=1 --exclusive --export=ALL --distribution=block:block --hint=nomultithread " $my_prog{128} /work/n01/n01/sithom/adcirc-swan/katrina1/padcirc
```