#!/bin/bash

export MYROCM=7.0.1

module load gcc/14.0.1
module load rocm/7.0.1

export PAPI_ROCM_ROOT=/opt/rocm-${MYROCM}
##export PAPI_ROCMSMI_ROOT=/opt/rocm-${MYROCM}/rocm_smi
export PAPI_ROCMSMI_ROOT=/opt/rocm-${MYROCM}
export PAPI_AMDSMI_ROOT=/opt/rocm-${MYROCM}

export ROCP_METRICS=${PAPI_ROCM_ROOT}/lib/rocprofiler/metrics.xml
export HSA_TOOLS_LIB=${PAPI_ROCM_ROOT}/lib/librocprofiler64.so
export ROCP_HSA_INTERCEPT=1

export PAPI=/home/users/dbarry/apps/papi-feature
export PAPI_DIR=${PAPI}
export PATH=${PAPI}/bin:${PATH}
export LD_LIBRARY_PATH=${PAPI}/lib:${LD_LIBRARY_PATH}

OUT=./feature
mkdir -p ${OUT}
#OUTCOMPTESTS=${OUT}-comptests
#mkdir -p ${OUTCOMPTESTS}

${PAPI}/bin/papi_avail           &> ${OUT}/out.avail
${PAPI}/bin/papi_native_avail    &> ${OUT}/out.native
${PAPI}/bin/papi_hardware_avail  &> ${OUT}/out.hw
${PAPI}/bin/papi_mem_info        &> ${OUT}/out.mem
${PAPI}/bin/papi_component_avail &> ${OUT}/out.comp
${PAPI}/bin/rocm_smi_writeTests  &> ${OUT}/out.writeTests

#sudo ./components/rocm_smi/tests/rocm_smi_writeTests &> ${OUTCOMPTESTS}/out.writeTests
#./components/rocm_smi/tests/rocm_smi_writeTests &> ${OUTCOMPTESTS}/out.writeTests
