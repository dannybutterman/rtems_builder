#!/bin/bash

THIS_SCRIPT=$(realpath "$0")
BUILD_TOP_DIR=$(dirname "${THIS_SCRIPT}")
TOP_DIR=${BUILD_TOP_DIR}/..

source ${BUILD_TOP_DIR}/config/config.sh

echo "Location of this script: ${BUILD_TOP_DIR}"
echo "RSB Source: ${RTEMS_RSB_SRC_DIR}"
echo "RTEMS Source: ${RTEMS_OS_SRC_DIR}"
echo "RTEMS Toolchain: ${RTEMS_TOOLCHAIN_INSTALL_DIR}"

if [ ! -d "${RTEMS_RSB_SRC_DIR}" ]; then 

  echo "Download RSB"	

  git clone ${RTEMS_RSB_GIT_REPO}	${RTEMS_RSB_SRC_DIR}	
  pushd ${RTEMS_RSB_SRC_DIR}
  git checkout ${RTEMS_RSB_VER_COMMIT}
  popd
fi


if [ ! -d "${RTEMS_TOOLCHAIN_INSTALL_DIR}" ]; then 

  echo "Build RTEMS toolchain for ${RTEMS_BSP_ARCH}"	

  pushd ${RTEMS_RSB_SRC_DIR}/rtems
  ../source-builder/sb-set-builder --prefix=${RTEMS_TOOLCHAIN_INSTALL_DIR} 6/rtems-${RTEMS_BSP_ARCH}
  popd
fi



