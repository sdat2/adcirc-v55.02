# Katrina run with NWS=13 file

## debugging


```bash
launch --launcher-args="--account=n01-SOWISE --partition=standard --qos=standard --nodes=1 --ntasks-per-node=128 --cpus-per-task=1 --exclusive --export=ALL --distribution=block:block --hint=nomultithread " $my_prog{128} /work/n01/n01/sithom/adcirc-swan/katrina1/padcirc
```