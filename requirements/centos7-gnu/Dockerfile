FROM centos:7

# install sudo
RUN yum update -y && yum -y install sudo && \
    sudo yum -y install git curl cloc which make cmake

RUN yum --enablerepo=extras -y install epel-release && \
    yum -y install netcdf-fortran-openmpi-static &&\
    ln -s /usr/bin/gfortran /usr/bin/f90 && \
    ln -s /lib64/openmpi/bin/mpif90 /usr/bin/mpif90 &&\
    ln -s /lib64/openmpi/bin/mpicc /usr/bin/mpicc && \
    ln -s /lib64/openmpi/bin/mpifort /usr/bin/mpifort

# docker build . -t sdat2/adcirc-swan-env:centos6-mpif90
# export PATH=$PATH:/usr/lib64/openmpi/bin/
# ln -s /lib64/openmpi/bin/mpif90 /usr/bin/mpif90
# docker push