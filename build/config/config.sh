#!/bin/bash




# TOP_DIR and BUILD_TOP_DIR must have been set up in the parent script
WORK_DIR=${BUILD_TOP_DIR}/work
RTEMS_TOP_SRC_DIR=${WORK_DIR}/source
INSTALL_DIR=${BUILD_TOP_DIR}/install
CMAKE_SCRIPT_DIR=${BUILD_TOP_DIR}/cmake
WORK_DIR=${BUILD_TOP_DIR}/work
TOOL_DIR=${BUILD_TOP_DIR}/tools
TOOL_DOWNLOAD_DIR=${BUILD_TOP_DIR}/downloads
APP_DIR=${TOP_DIR}/Application



#################################################
## RTEMS build config
RTEMS_BSP_ARCH=arm
RTEMS_BSP_NAME=xilinx_zynq_zybo


#################################################
## Toolchain build
RTEMS_RSB_GIT_REPO=https://github.com/dannybutterman/rtems-source-builder.git
RTEMS_RSB_SRC_DIR=${RTEMS_TOP_SRC_DIR}/rsb
RTEMS_RSB_VER_COMMIT=633023de6517998ee3b84e7ed172b1c5f2bf502b
RTEMS_TOOLCHAIN_INSTALL_DIR=${INSTALL_DIR}/toolchain

#################################################
## RTEMS build
RTEMS_OS_GIT_REPO=https://github.com/dannybutterman/rtems.git
RTEMS_OS_SRC_DIR=${RTEMS_TOP_SRC_DIR}/rtems
RTEMS_OS_VER_COMMIT=add_zynq_boards
RTEMS_OS_INSTALL_DIR=${INSTALL_DIR}/rtems


#################################################
## RTEMS Libbsd build
RTEMS_LIBBSD_GIT_REPO=https://github.com/dannybutterman/rtems-libbsd.git
RTEMS_LIBBSD_SRC_DIR=${RTEMS_TOP_SRC_DIR}/rtems-libbsd
RTEMS_LIBBSD_VER_COMMIT=1524f95e93a0e0ff85d676d214e0e57cac44e4f5
RTEMS_LIBBSD_INSTALL_DIR=${WORK_DIR}/rtems-libbsd
RTEMS_LIBBSD_CONFIG=${BUILD_TOP_DIR}/config/libbsdconfig.ini


#################################################
## Eclipse
ECLIPSE_SRC_REPO=http://ftp.halifax.rwth-aachen.de/eclipse/technology/epp/downloads/release/2022-06/R
ECLIPSE_TAR_NAME=eclipse-cpp-2022-06-R-linux-gtk-x86_64.tar.gz
ECLIPSE_EMBEDDED_SRC_REPO=http://ftp.halifax.rwth-aachen.de/eclipse/embed-cdt/releases/6.2.2
ECLIPSE_EMBEDDED_TAR_NAME=org.eclipse.embedcdt.repository-6.2.2-202206121057.zip
ECLIPSE_INSTALL_DIR=${TOOL_DIR}/eclipse















