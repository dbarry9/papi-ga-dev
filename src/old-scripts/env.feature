#!/bin/bash

module use e4s
## upon sourcing many more modules become available
source /packages/e4s/23.11/mvapich/spack/share/spack/setup-env.sh

module load gcc/14.0.1
module load cuda/13.0.0

export PAPI_CUDA_ROOT=/packages/cuda/13.0.0

export PAPI=/home/users/dbarry/apps/papi-feature
export PAPI_DIR=${PAPI}
export LD_LIBRARY_PATH=${PAPI_DIR}/lib:${LD_LIBRARY_PATH}
export PATH=${PAPI_DIR}/bin:${PATH}
