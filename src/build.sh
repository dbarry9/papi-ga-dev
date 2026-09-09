#!/bin/bash

INSTDIR=${PAPI}

mkdir -p ${INSTDIR}
rm -rf ${INSTDIR}/*

make clobber

./configure --prefix=${INSTDIR} --with-components="rocm_smi"

make -j16
make install

