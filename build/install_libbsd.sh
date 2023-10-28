#!/bin/bash

THIS_SCRIPT=$(realpath "$0")
BUILD_TOP_DIR=$(dirname "${THIS_SCRIPT}")
TOP_DIR=${BUILD_TOP_DIR}/..

source ${BUILD_TOP_DIR}/config/config.sh

echo "Location of this script: ${BUILD_TOP_DIR}"
echo "RTEMS Install dir ${RTEMS_OS_INSTALL_DIR}"
echo "RTEMS Toolchain: ${RTEMS_TOOLCHAIN_INSTALL_DIR}"



if [ ! -d "${RTEMS_TOOLCHAIN_INSTALL_DIR}" ]; then 
  echo "ERROR: run install_tools.sh first"	
  exit 1
fi

if [ ! -d "${RTEMS_LIBBSD_SRC_DIR}" ]; then
  echo "Download RTEMS Libbsd"	
  git clone ${RTEMS_LIBBSD_GIT_REPO} ${RTEMS_LIBBSD_SRC_DIR}
  pushd ${RTEMS_LIBBSD_SRC_DIR}
  git checkout ${RTEMS_LIBBSD_VER_COMMIT}
  popd
fi

if [ -d "${RTEMS_LIBBSD_INSTALL_DIR}" ]; then 
  echo "Delete old RTEMS libbsd installation"	
  rm -rf ${RTEMS_LIBBSD_INSTALL_DIR}
fi 


echo "Build RTEMS libbsd"

pushd ${RTEMS_LIBBSD_SRC_DIR}
./waf clean
./waf configure --prefix=${RTEMS_LIBBSD_INSTALL_DIR} --rtems=${RTEMS_OS_INSTALL_DIR}  --rtems-tools=${RTEMS_TOOLCHAIN_INSTALL_DIR} --rtems-bsps=${RTEMS_BSP_ARCH}/${RTEMS_BSP_NAME} --buildset=${RTEMS_LIBBSD_CONFIG}
./waf install

popd

