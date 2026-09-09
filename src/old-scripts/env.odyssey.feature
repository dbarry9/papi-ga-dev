#!/bin/bash

export MYROCM=7.0.1

module load gcc/13.2
module load rocm/${MYROCM}


export PAPI_ROCM_ROOT=/opt/rocm-${MYROCM}
##export PAPI_ROCMSMI_ROOT=/opt/rocm-${MYROCM}/rocm_smi
export PAPI_ROCMSMI_ROOT=/opt/rocm-${MYROCM}


## Main variables.
export PAPI=/home/users/dbarry/apps/papi-odyssey-master
export PAPI_DIR=${PAPI}
export LD_LIBRARY_PATH=${PAPI_DIR}/lib:${LD_LIBRARY_PATH}
export PATH=${PAPI_DIR}/bin:${PATH}

git branch
